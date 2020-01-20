# Amazon Publisher Services(APS)のインタースティシャル広告の導入

!!! warning "はじめに"
    APS SDKの初期化が必要です。[APSの設定](/aps/init)をご覧になり、[APSの初期化](/aps/init#apsの初期化)を必ず先に行ってください。

## APSバナーへのリクエストを行う

### `DTBAdSize`のインスタンスを生成します

`YOUR_SLOT_UUID`には営業担当がお知らせしたIDを入力してください。
    
```Objective-c tab=
#import <DTBiOSSDK/DTBiOSSDK.h>

DTBAdSize *size = [[DTBAdSize alloc] initInterstitialAdSizeWithSlotUUID:@"YOUR_SLOT_UUID"];
```

```swift tab=
import DTBiOSSDK

let size = DTBAdSize(interstitialAdSizeWithSlotUUID: "YOUR_SLOT_UUID")
```

### `DTBAdLoader`のインスタンスを生成し、`DTBAdSize`を設定する


```Objective-c tab=
DTBAdLoader *adLoader = [DTBAdLoader new];
[adLoader setSizes:size, nil];
```

```swift tab=
let adLoader = DTBAdLoader()
adLoader.setAdSizes([size])
```

### APSの入札リクエストを行う

loadAdを呼び出して入札リクエストを行います。

```Objective-c tab=
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

```Objective-c tab=
#import <DTBiOSSDK/DTBiOSSDK.h>
@interface ViewController () <GADInterstitialDelegate, DTBAdCallback>
@end

@implementation ViewController
...

#pragma mark - DTBAdCallback
- (void)onFailure: (DTBAdError)error {
    // APSの入札情報は付与しないでAdMobへリクエストを行う
    [self loadAdMobInterstitialAdsWithExtras:nil];
}

- (void)onSuccess: (DTBAdResponse *)adResponse {
    // APSの入札情報を付与してAdMobへリクエスト行う
    NSString *amznSlots = adResponse.amznSlots;
    NSDictionary *mediationHints = [adResponse mediationHints];
    GADCustomEventExtras *extras = [[GADCustomEventExtras alloc] init];
    [extras setExtras:mediationHints forLabel:amznSlots];
    [self loadAdMobInterstitialAdsWithExtras:extras];
}

#pragma mark - AdMobinterstitial load

- (void)loadAdMobInterstitialAdsWithExtras: (GADCustomEventExtras *)extras
{
    GADRequest *request = [GADRequest request];
    if (extras != nil) {
        // admobへリクエストを行う際にextraへ登録する
        [request registerAdNetworkExtras:extras];
    }

    // GADInterstitial オブジェクトを生成し、AdMobへリクストを行う。
    googleInterstitial = [[GADInterstitial alloc] initWithAdUnitID:@"ADMOB_INTERSTITIAL_ID"];
    googleInterstitial.delegate = self
    [googleInterstitial loadRequest:request];
}
```

```swift tab=
import UIKit
import DTBiOSSDK
import GoogleMobileAds

class ViewController: UIViewController, DTBAdCallback {
    var googleInterstitial: GADInterstitial!
    ...
    // MARK: DTBAdCallback
    func onFailure(_ error: DTBAdError) {
        // APSの入札情報を付与してAdMobへリクエスト行う
        self.loaodAdMobInterstitialAd(extras: nil)
    }
    
    func onSuccess(_ adResponse: DTBAdResponse!) {
        // APSの入札情報を付与してAdMobへリクエスト行う
        let amznSlots = adResponse.amznSlots()
        let mediationHints = adResponse.mediationHints()
        let extras = GADCustomEventExtras.init()
        extras.setExtras(mediationHints, forLabel: amznSlots)
        self.loaodAdMobInterstitialAd(extras: extras)
    }

    // MARK: load AdMob interstitial
    func loaodAdMobInterstitialAd(extras: GADCustomEventExtras?) {
        let request = GADRequest()
        if (extras != nil) {
            request.register(extras!)
        }
        self.googleInterstitial = GADInterstitial(adUnitID: "ADMOB_INTERSTITIAL_ID")
        self.googleInterstitial.load(request)
    }
}
```

### 広告を表示する

広告の準備ができているか確認してから広告を表示します。

```Objective-c tab=
- (void)showInterstitialAd {
  if (googleInterstitial.isReady){
   [googleInterstitial presentFromRootViewController:self];
  }
}
```

```swift tab=
func showInterstitialAd(){
    if (self.googleInterstitial.isReady) {
        self.googleInterstitial.present(fromRootViewController: self)
    }
}
```

## 実装例

```Objective-c tab=
#import "APSInterstitialViewController.h"
#import <DTBiOSSDK/DTBiOSSDK.h>
@import GoogleMobileAds;

@interface APSInterstitialViewController () <GADInterstitialDelegate, DTBAdCallback>
@property(nonatomic, strong) GADInterstitial *googleInterstitial;
@end

@implementation APSInterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // APSのSDKの初期化を行います。
    [[DTBAds sharedInstance] setAppKey: @"YOUR_APP_ID"];

    [self loadInterstitialAd];
}

- (void)loadInterstitialAd {
    // APSの読み込みを行う。
    DTBAdSize *size = [[DTBAdSize alloc] initInterstitialAdSizeWithSlotUUID:@"YOUR_SLOT_UUID"];
    DTBAdLoader *adLoader = [DTBAdLoader new];
    [adLoader setSizes:size, nil];
    
    // APSの入札リクエスト
    [adLoader loadAd:self];
}

#pragma mark - DTBAdCallback
- (void)onFailure: (DTBAdError)error {
    // APSの入札情報は付与しないでAdMobへリクエストを行う
    [self loadAdMobInterstitialAdsWithExtras:nil];
}

- (void)onSuccess: (DTBAdResponse *)adResponse {
    // APSの入札情報を付与してAdMobへリクエスト行う
    NSString *amznSlots = adResponse.amznSlots;
    NSDictionary *mediationHints = [adResponse mediationHints];
    GADCustomEventExtras *extras = [[GADCustomEventExtras alloc] init];
    [extras setExtras:mediationHints forLabel:amznSlots];
    [self loadAdMobInterstitialAdsWithExtras:extras];
}

#pragma mark - AdMobInterstitial load

- (void)loadAdMobInterstitialAdsWithExtras: (GADCustomEventExtras *)extras
{
    GADRequest *request = [GADRequest request];
    if (extras != nil) {
        // admobへリクエストを行う際にextraへ登録する
        [request registerAdNetworkExtras:extras];
    }

    // GADInterstitial オブジェクトを生成し、AdMobへリクストを行う。
    self.googleInterstitial = [[GADInterstitial alloc] initWithAdUnitID:@"ADMOB_INTERSTITIAL_ID"];
    self.googleInterstitial.delegate = self;
    [self.googleInterstitial loadRequest:request];
}

#pragma mark -
#pragma mark GADInterstitialDelegate

- (void)interstitialDidReceiveAd:(GADInterstitial *)ad
{
    // 読み込み完了したら呼ばれます
    if (self.googleInterstitial.isReady) {
        [self.googleInterstitial presentFromRootViewController:self];
    }
}

- (void)interstitial:(GADInterstitial *)ad didFailToReceiveAdWithError:(GADRequestError *)error {
    [self loadInterstitialAd];
}

- (void)interstitialWillPresentScreen:(GADInterstitial *)ad {}

- (void)interstitialDidFailToPresentScreen:(GADInterstitial *)ad {
    [self loadInterstitialAd];
}

- (void)interstitialWillDismissScreen:(GADInterstitial *)ad {}

- (void)interstitialDidDismissScreen:(GADInterstitial *)ad {
    [self loadInterstitialAd];
}

- (void)interstitialWillLeaveApplication:(GADInterstitial *)ad {}

@end
```

```swift tab=
import UIKit
import DTBiOSSDK
import GoogleMobileAds

class ViewController: UIViewController, GADInterstitialDelegate, DTBAdCallback {
    
    var googleInterstitial: GADInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // APSのSDKの初期化を行います。
        DTBAds.sharedInstance().setAppKey("YOUR_APP_ID")
        
        self.loadInterstitialAd()
    }
    
    
    func loadInterstitialAd() {
        let size = DTBAdSize(interstitialAdSizeWithSlotUUID: "YOUR_SLOT_UUID")
        let adLoader = DTBAdLoader()
        adLoader.setAdSizes([size])
        adLoader.loadAd(self)
    }
    
    // MARK: DTBAdCallback
    func onFailure(_ error: DTBAdError) {
        // APSの入札情報を付与してAdMobへリクエスト行う
        self.loaodAdMobInterstitialAd(extras: nil)
    }
    
    func onSuccess(_ adResponse: DTBAdResponse!) {
        // APSの入札情報を付与してAdMobへリクエスト行う
        let amznSlots = adResponse.amznSlots()
        let mediationHints = adResponse.mediationHints()
        let extras = GADCustomEventExtras.init()
        extras.setExtras(mediationHints, forLabel: amznSlots)
        self.loaodAdMobInterstitialAd(extras: extras)
    }
    
    func loaodAdMobInterstitialAd(extras: GADCustomEventExtras?) {
        let request = GADRequest()
        if (extras != nil) {
            request.register(extras!)
        }
        self.googleInterstitial = GADInterstitial(adUnitID: "ADMOB_INTERSTITIAL_ID")
        self.googleInterstitial.delegate = self
        self.googleInterstitial.load(request)
    }
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        if (self.googleInterstitial.isReady) {
            self.googleInterstitial.present(fromRootViewController: self)
        }
    }

    func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
        self.loadInterstitialAd()
    }

    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        self.loadInterstitialAd()
    }

    func interstitialWillPresentScreen(_ ad: GADInterstitial) {
    }

    func interstitialWillDismissScreen(_ ad: GADInterstitial) {
    }

    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        self.loadInterstitialAd()
    }

    func interstitialWillLeaveApplication(_ ad: GADInterstitial) {
    }
}
```
