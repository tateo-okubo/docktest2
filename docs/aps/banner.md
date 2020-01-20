# Amazon Publisher Services(APS)のバナー広告の導入

!!! warning "はじめに"
    APS SDKの初期化が必要です。[APSの設定](/aps/init)をご覧になり、[APSの初期化](/aps/init#apsの初期化)を必ず先に行ってください。

## APSバナーへのリクエストを行う

### `DTBAdSize`のインスタンスを生成します

広告サイズは実際に表示するバナー広告のサイズを、`YOUR_SLOT_UUID`には営業担当がお知らせしたIDを入力してください。
    
```Objective-C tab=
DTBAdSize *size = [[DTBAdSize alloc] initBannerAdSizeWithWidth：320 height：50 andSlotUUID：@"YOUR_SLOT_UUID"];
```

```swift tab=
let size = DTBAdSize(bannerAdSizeWithWidth: 320, height: 50, andSlotUUID: "YOUR_SLOT_UUID")
```

### `DTBAdLoader`のインスタンスを生成し、`DTBAdSize`を設定する


```Objective-C tab=
DTBAdLoader *adLoader = [DTBAdLoader new];
[adLoader setSizes:size, nil];
```

```swift tab=
let adLoader = DTBAdLoader()
adLoader.setAdSizes([size])
```

### APSの入札リクエストを行う

loadAdを呼び出して入札リクエストを行います。

```Objective-C tab=
[adLoader loadAd:self];
```

```swift tab=
adLoader.loadAd(self)
```

### `DTBAdCallback`の実装を行う

APSが入札した場合はonSuccessが、入札しなかった場合はonFailureが呼ばれます。

APSの入札結果を元に、AdMobへ広告リクエストを行います。

onSuccessが呼ばれた場合は、AdMobへGADCustomEventExtrasを付与して広告リクエストを行い、
onFailureが呼ばれた場合は、AdMobへ追加情報を付与せずにリクエストを行います。
AdMobの実装については[こちら](/admob#広告の実装)をご覧ください。

```Objective-C tab=
#import <DTBiOSSDK/DTBiOSSDK.h>
@interface ViewController () <GADBannerViewDelegate, DTBAdCallback>
@end

@implementation ViewController
...

#pragma mark - DTBAdCallback
- (void)onFailure: (DTBAdError)error {
    // APSの入札情報は付与しないでAdMobへリクエストを行う
    [self loadAdMobBannerAdsWithExtras:nil];
}

- (void)onSuccess: (DTBAdResponse *)adResponse {
    // APSの入札情報を付与してAdMobへリクエスト行う
    NSString *amznSlots = adResponse.amznSlots;
    NSDictionary *mediationHints = [adResponse mediationHints];
    GADCustomEventExtras *extras = [[GADCustomEventExtras alloc] init];
    [extras setExtras:mediationHints forLabel:amznSlots];
    [self loadAdMobBannerAdsWithExtras:extras];
}

#pragma mark - AdMobBanner load

- (void)loadAdMobBannerAdsWithExtras: (GADCustomEventExtras *)extras
{
    GADRequest *request = [GADRequest request];
    if (extras != nil) {
        // admobへリクエストを行う際にextraへ登録する
        [request registerAdNetworkExtras:extras];
    }

    // AdMobへリクエストを行う
    self.bannerView = [[GADBannerView alloc] initWithAdSize:利用するバナーのサイズ];
    self.bannerView.delegate = self;
    self.bannerView.adUnitID = @"ADMOB_BANNER_ID";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:request];
}
```

```swift tab=
import UIKit
import DTBiOSSDK
import GoogleMobileAds

class ViewController: UIViewController, DTBAdCallback {
    
    var bannerView: GADBannerView!

    ...
    
    func onFailure(_ error: DTBAdError) {
        // APSの入札情報を付与してAdMobへリクエスト行う
        self.loadAdMobBannerAd(extras: nil)
    }
    
    func onSuccess(_ adResponse: DTBAdResponse!) {
        // APSの入札情報を付与してAdMobへリクエスト行う
        let amznSlots = adResponse.amznSlots()
        let mediationHints = adResponse.mediationHints()
        let extras = GADCustomEventExtras.init()
        extras.setExtras(mediationHints, forLabel: amznSlots)
        self.loadAdMobBannerAd(extras: extras)
    }
    
    func loadAdMobBannerAd(extras: GADCustomEventExtras?) {
        let request = GADRequest()
        if (extras != nil) {
            request.register(extras!)
        }
        self.bannerView = GADBannerView.init(adSize: kGADAdSizeBanner)
        self.bannerView.adUnitID = "ADMOB_BANNER_ID"
        self.bannerView.rootViewController = self
        self.bannerView.load(request)
    }
    ...
}
```


## 実装例

```Objective-C tab=
#import "ViewController.h"
#import <DTBiOSSDK/DTBiOSSDK.h>
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface ViewController () <DTBAdCallback>

@property(nonatomic, strong) GADBannerView *bannerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // APSのSDKの初期化を行います。
    [[DTBAds sharedInstance] setAppKey: @"YOUR_APP_ID"];

    // 広告サイズと、APSのslot idを指定します。
    DTBAdSize *size = [[DTBAdSize alloc] initBannerAdSizeWithWidth:320 height:50 andSlotUUID:@"YOUR_SLOT_UUID"];
    DTBAdLoader *adLoader = [DTBAdLoader new];
    [adLoader setSizes:size, nil];
    [adLoader loadAd:self];
}


#pragma mark - DTBAdCallback
- (void)onFailure: (DTBAdError)error {
    // APSの入札情報は付与しないでAdMobへリクエストを行う
    [self loadAdMobBannerAdsWithExtras:nil];
}

- (void)onSuccess: (DTBAdResponse *)adResponse {
    // APSの入札情報を付与してAdMobへリクエスト行う
    NSString *amznSlots = adResponse.amznSlots;
    NSDictionary *mediationHints = [adResponse mediationHints];
    GADCustomEventExtras *extras = [[GADCustomEventExtras alloc] init];
    [extras setExtras:mediationHints forLabel:amznSlots];
    [self loadAdMobBannerAdsWithExtras:extras];
}

#pragma mark - AdMobBanner load

- (void)loadAdMobBannerAdsWithExtras: (GADCustomEventExtras *)extras
{
    GADRequest *request = [GADRequest request];
    if (extras != nil) {
        // admobへリクエストを行う際にextraへ登録する
        [request registerAdNetworkExtras:extras];
    }

    // AdMobへリクエストを行う
    self.bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    // viewへセット
    [self addBannerViewToView:self.bannerView];
    self.bannerView.adUnitID = @"AD_ADMOB_BANNER_ID";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:request];
}


- (void)addBannerViewToView:(UIView *)bannerView {
  bannerView.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:bannerView];
  [self.view addConstraints:@[
    [NSLayoutConstraint constraintWithItem:bannerView
                               attribute:NSLayoutAttributeBottom
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.bottomLayoutGuide
                               attribute:NSLayoutAttributeTop
                              multiplier:1
                                constant:0],
    [NSLayoutConstraint constraintWithItem:bannerView
                               attribute:NSLayoutAttributeCenterX
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.view
                               attribute:NSLayoutAttributeCenterX
                              multiplier:1
                                constant:0]
                                ]];
}

@end

```

```swift tab=
import UIKit
import DTBiOSSDK
import GoogleMobileAds

class ViewController: UIViewController, DTBAdCallback {
    
    var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // APSのSDKの初期化を行います。
        DTBAds.sharedInstance().setAppKey("YOUR_APP_ID")
        
        let size = DTBAdSize(bannerAdSizeWithWidth: 320, height: 50, andSlotUUID: "YOUR_SLOT_UUID")
        let adLoader = DTBAdLoade()
        adLoader.setAdSizes([size])
        adLoader.loadAd(self)
    }
    
    func onFailure(_ error: DTBAdError) {
        // APSの入札情報を付与してAdMobへリクエスト行う
        self.loadAdMobBannerAd(extras: nil)
        
    }
    
    func onSuccess(_ adResponse: DTBAdResponse!) {
        // APSの入札情報を付与してAdMobへリクエスト行う
        let amznSlots = adResponse.amznSlots()
        let mediationHints = adResponse.mediationHints()
        let extras = GADCustomEventExtras.init()
        extras.setExtras(mediationHints, forLabel: amznSlots)
        self.loadAdMobBannerAd(extras: extras)
    }
    
    func loadAdMobBannerAd(extras: GADCustomEventExtras?) {
        let request = GADRequest()
        if (extras != nil) {
            request.register(extras!)
        }
        self.bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        // viewへセット
        addBannerViewToView(bannerView)
        self.bannerView.adUnitID = "AD_ADMOB_BANNER_ID"
        self.bannerView.rootViewController = self
        self.bannerView.load(request)
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
        [NSLayoutConstraint(item: bannerView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: bottomLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0),
        NSLayoutConstraint(item: bannerView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0)
        ])
    }
}
```