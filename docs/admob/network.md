# AdMobメディエーションで利用できるアドネットワーク

adstirのAdMobパッケージには下記のアドネットワークのSDKがパッケージングされております。

アドネットワーク|SDKバージョン|バナー|インタースティシャル|動画リワード|動画リワード(新API)|ネイティブ
---| :-: |:-:|:-:|:-:|:-:|:-:
AdColony|{{config.version.adcolony}}| o | o | o | o | -
AppLovin|{{config.version.applovin}}| o | o | o | o | o
Facebook|{{config.version.facebook}}| o | o | o | o | o
maio    |{{config.version.maio}}| - | o | o | o | -
MoPub   |{{config.version.mopub}}| o | o | o | o | o
nend    |{{config.version.nend}}| o | o | o | o | - 
TapJoy  |{{config.version.tapjoy}}| - | o | o | o | - 
UnityAds|{{config.version.unityads}}| o | o | o | o | - 

## 追加実装

アドネットワークによっては追加実装が必要なネットワークがございます。
下記を参照して実装をお願いします。

### MoPubの追加実装

広告の読み込み前にMoPub SDKを初期化する必要がございます。
AppDelegateなどで`initializeSdkWithConfiguration:`を呼び出してください。
`MOPUB_AD_UNIT_ID`は営業担当よりおしらせします。

```Objective-c tab= hl_lines="1 2 3 4 5 6 7 10 12 13 14"
#import "MoPub.h";
…
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

  MPMoPubConfiguration *sdkConfig =
  [[MPMoPubConfiguration alloc] initWithAdUnitIdForAppInitialization:@"MOPUB_AD_UNIT_ID"];

  [[MoPub sharedInstance] initializeSdkWithConfiguration:sdkConfig completion:nil];
  return YES;
}
@end
```

```swift tab= hl_lines="1 2 3 4 5 6 9 10 11"
import UIKit
import MoPub

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let sdkConfig = MPMoPubConfiguration(adUnitIdForAppInitialization: "MOPUB_AD_UNIT_ID")
        MoPub.sharedInstance().initializeSdk(with: sdkConfig, completion: nil)
        return true
    }
}
```