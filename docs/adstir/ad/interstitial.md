# 全画面インタースティシャル広告の導入

動画 / 静止画 による全画面広告の導入方法です。

## 1. 動画広告の初期化を行う

`AdstirVideoAds prepareWithMedia`を使い、プロジェクトで利用する全ての動画広告の初期化を同時に行います。

!!! notice ""
    動画リワード広告と全画面インタースティシャル広告併用する場合は、動画リワード広告と全画面インタースティシャル広告の広告枠全て同時に初期化を行う必要があります。

```Objctive-c tab=
[AdstirVideoAds prepareWithMedia:@"メディアID" spots:@[@枠No1, @枠No2]];
```

```swift tab=
AdstirVideoAds.prepare(withMedia: "メディアID", spots: [1, 2]);
```

## 2. 全画面インタースティシャル広告のインスタンスを生成

`AdstirInterstitial`のインスタンスを生成します。

```Objctive-c tab=
AdstirInterstitial *interstitial = [[AdstirInterstitial alloc] initWithMedia:@"メディアID" spot:枠No];
```

```swift tab=
let interstitial = AdstirInterstitial(media: "メディアID", spot: 枠No)!
```

## 3. デリゲートの実装(オプション)

```Objctive-c tab=
- (void)viewDidLoad {
    [super viewDidLoad];
        :
    interstitial.delegate = self;
        :
}

/** インタースティシャル広告の準備が完了した際に呼び出されます */
- (void)adstirInterstitialDidLoad:(AdstirInterstitial * __asadnonnull)interstitial
{
}

/** インタースティシャル広告の準備に失敗した際に呼び出されます */
- (void)adstirInterstitial:(AdstirInterstitial * __asadnonnull)interstitial didFailToLoadWithError:(NSError * __asadnonnull)error
{
}

/** インタースティシャル広告が表示された際に呼び出されます */
- (void)adstirInterstitialDidShow:(AdstirInterstitial * __asadnonnull)interstitial
{
}

/** インタースティシャル広告の表示に失敗した際に呼び出されます */
- (void)adstirInterstitial:(AdstirInterstitial * __asadnonnull)interstitial didFailToShowWithError:(NSError * __asadnonnull)error
{
}

/** インタースティシャル広告が閉じられたときに呼び出されます */
- (void)adstirInterstitialDidClose:(AdstirInterstitial * __asadnonnull)interstitial
{
}
```

```swift tab=
override func viewDidLoad() {
    super.viewDidLoad()
    ...
    interstitial?.delegate = self;
}

/** インタースティシャル広告の準備が完了した際に呼び出されます */
func adstirInterstitialDidLoad(_ interstitial: AdstirInterstitial) {
}
/** インタースティシャル広告の準備に失敗した際に呼び出されます */
func adstirInterstitial(_ interstitial: AdstirInterstitial, didFailToLoadWithError error: NSError) {
}
/** インタースティシャル広告が表示された際に呼び出されます */
func adstirInterstitialDidShow(_ interstitial: AdstirInterstitial) {
}
/** インタースティシャル広告の表示に失敗した際に呼び出されます */
func adstirInterstitial(_ interstitial: AdstirInterstitial, didFailToShowWithError error: NSError) {
}
/** インタースティシャル広告が閉じられたときに呼び出されます */
func adstirInterstitialDidClose(_ interstitial: AdstirInterstitial) {
}
```

## 4. 全画面インタースティシャル広告の読み込み

全画面インタースティシャル広告の読み込みを行います。

```Objective-c tab=
[interstitial load];
```

```swift tab=
interstitial.load()
```

## 5. 全画面インタースティシャル広告の再生

読み込みが完了した全画面インタースティシャル広告を再生します。
動画の再生を行うViewControllerを渡してください。
動画の再生後、もう一度動画を再生するためには[`4.全画面インタースティシャル広告の読み込み`](#4-全画面インタースティシャル広告の読み込み)を行う必要があります。

```Objective-c tab=
if (self.interstitial.canShow) {
    [self.interstitial showFromViewController:self];
}
```

```swift tab=
if (interstitial.canShow()) {
    interstitial.show(from: self);
}
```

## SDKの実装例

ここでは、単純な実装についてのサンプルを提示します。
まず、Storyboard上に、`UIButton`と`UILabel`を配置し、`UIButton`をのOutletとActionを`showInterstitialButton`と`showInterstitialButtonDidTouchUpInside`にそれぞれ接続し、`UILabel`のOutletを`statusLabel`に接続してください。

- AppDelegate

```Objective-c tab=
// ...
@import AdstirAds;
// ...
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /* 他の初期化コード */

    // メディアIDと、このアプリ内で利用する動画インセンティブメニューの枠IDとインタースティシャル広告の枠IDをすべて指定します。
    // 動画リワードとインタースティシャルを併用する場合はどちらの枠Noも指定してください。
    [AdstirVideoAds prepareWithMedia:@"メディアID" spots:@[@枠No]];

    return YES;
}
```

```swift tab=
// ...
import AdstirAds
// ...
class AppDelegate: UIResponder, UIApplicationDelegate {
// ...
   func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        /* 他の初期化コード */

        // メディアIDと、このアプリ内で利用するイン対すティシャル広告のメディアIDと、枠Noをすべて指定します。
        AdstirVideoAds.prepare(withMedia:"メディアID", spots: [枠No, 枠No])
        return true
    }
// ...
}
```

- ViewController

```Objective-c tab=
// ...
@import AdstirAds;
// ...
@interface ViewController () <AdstirInterstitialDelegate>
@property (weak, nonatomic) IBOutlet UIButton *showInterstitialButton;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@property (strong, nonatomic) AdstirInterstitial *interstitial;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    AdstirInterstitial *interstitial = [[AdstirInterstitial alloc] initWithMedia:@"メディアID" spot:枠No];
    interstitial.delegate = self;
    self.interstitial = interstitial;
    
    self.statusLabel.text = @"Loading...";
    [interstitial load];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** 全画面インタースティシャル広告を表示するボタンのターゲットメソッド */
- (IBAction)showInterstitialButtonDidTouchUpInside:(id)sender {
    self.showInterstitialButton.enabled = NO;
    if (self.interstitial.canShow) {
        [self.interstitial showFromViewController:self];
    }
}

/**
 Called when get ready to show ad
 
 インタースティシャル広告の準備が完了した際に呼び出されます
 */
- (void)adstirInterstitialDidLoad:(AdstirInterstitial * __asadnonnull)interstitial
{
    NSLog(@"広告の読み込みが完了しました");

    self.statusLabel.text = @"Loaded";
    self.showInterstitialButton.enabled = YES;
}

/**
 Called when failed to load ad
 
 インタースティシャル広告の準備に失敗した際に呼び出されます
 */
- (void)adstirInterstitial:(AdstirInterstitial * __asadnonnull)interstitial didFailToLoadWithError:(NSError * __asadnonnull)error
{
    NSLog(@"広告の読み込みに失敗しました");

    // 15秒待ってから再読み込みします
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.statusLabel.text = @"Loading...";
        [self.interstitial load];
    });
}

/**
 Called when interstitial ad is shown
 
 インタースティシャル広告が表示された際に呼び出されます
 */
- (void)adstirInterstitialDidShow:(AdstirInterstitial * __asadnonnull)interstitial
{
    NSLog(@"広告が表示されました");
    
    self.statusLabel.text = @"";
}

/**
 Called when failed to show ad
 
 インタースティシャル広告の表示に失敗した際に呼び出されます
 */
- (void)adstirInterstitial:(AdstirInterstitial * __asadnonnull)interstitial didFailToShowWithError:(NSError * __asadnonnull)error
{
    NSLog(@"広告の表示に失敗しました");
    
    // 15秒待ってから再読み込みします
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.statusLabel.text = @"Loading...";
        [self.interstitial load];
    });
}

/**
 Called when ad was closed
 
 インタースティシャル広告が閉じられたときに呼び出されます
 */
- (void)adstirInterstitialDidClose:(AdstirInterstitial * __asadnonnull)interstitial
{
    NSLog(@"広告が閉じられました");

    // 15秒待ってから再読み込みします
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.statusLabel.text = @"Loading...";
        [self.interstitial load];
    });
}

- (void)dealloc
{
    // デリゲートを解放します。解放を忘れるとクラッシュする可能性があります。
    self.interstitial.delegate = nil;
    // 広告の制御インスタンスを解放します。
    self.interstitial = nil;
}

@end
```



```swift tab=
import UIKit
import AdstirAds

class ViewController: UIViewController, AdstirInterstitialDelegate {

    @IBOutlet weak var showInterstitialButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!

    var interstitial: AdstirInterstitial?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.showInterstitialButton.enabled = false

        // メディアIDと、このアプリ内で利用する動画インセンティブメニューの枠IDとインタースティシャル広告の枠IDをすべて指定します。
        // 動画リワードとインタースティシャルを併用する場合はどちらの枠Noも指定してください。
        let interstitial = AdstirInterstitial(media: "メディアID", spot: 枠No)
        interstitial?.delegate = self;
        self.interstitial = interstitial

        self.statusLabel.text = "Loading...";
        interstitial?.load()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showInterstitialButtonDidTouchUpInside(sender: AnyObject) {
        self.showInterstitialButton.enabled = false

        if (self.interstitial != nil && self.interstitial!.canShow()) {
            self.interstitial?.showFromViewController(self)
        }
    }
    
    /**
     Called when get ready to show ad
     
     インタースティシャル広告の準備が完了した際に呼び出されます
     */
    func adstirInterstitialDidLoad(_ interstitial: AdstirInterstitial) {
        NSLog("広告の読み込みが完了しました")

        self.statusLabel.text = "Loaded"
        self.showInterstitialButton.enabled = true
    }
    /**
     Called when failed to load ad
     
     インタースティシャル広告の準備に失敗した際に呼び出されます
     */
    func adstirInterstitial(_ interstitial: AdstirInterstitial, didFailToLoadWithError error: NSError) {
        NSLog("広告の読み込みに失敗しました")
        
        // 15秒待ってから再読み込みします
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(15.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            self.statusLabel.text = "Loading...";
            self.interstitial?.load()
        })
    }
    /**
     Called when interstitial ad is shown
     
     インタースティシャル広告が表示された際に呼び出されます
     */
    func adstirInterstitialDidShow(_ interstitial: AdstirInterstitial) {
        NSLog("広告が表示されました")

        self.statusLabel.text = ""
    }
    /**
     Called when failed to show ad
     
     インタースティシャル広告の表示に失敗した際に呼び出されます
     */
    func adstirInterstitial(_ interstitial: AdstirInterstitial, didFailToShowWithError error: NSError) {
        NSLog("広告の表示に失敗しました")

        // 15秒待ってから再読み込みします
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(15.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            self.statusLabel.text = "Loading...";
            self.interstitial?.load()
        })
    }
    /**
     Called when ad was closed
     
     インタースティシャル広告が閉じられたときに呼び出されます
     */
    func adstirInterstitialDidClose(_ interstitial: AdstirInterstitial) {
        NSLog("広告が閉じられました")
        
        // 15秒待ってから再読み込みします
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(15.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            self.statusLabel.text = "Loading...";
            self.interstitial?.load()
        })
    }
    
    deinit {
        self.interstitial?.delegate = nil
        self.interstitial = nil
    }

}
```
