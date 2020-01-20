# AdMobメディエーションで利用できるアドネットワーク

adstirのAdMobパッケージには下記のアドネットワークのSDKがパッケージングされております。

アドネットワーク|SDKバージョン|バナー|インタースティシャル|動画リワード|動画リワード(新API)|ネイティブ
---| :-: |:-:|:-:|:-:|:-:|:-:
AdColony|4.1.2| o | o | o | o | -
AppLovin|6.10.1| o | o | o | o | o
Facebook|5.6.0| o | o | o | o | o
maio    |1.5.1| - | o | o | o | -
MoPub   |5.10.0| o | o | o | o | o
nend    |5.3.0| o | o | o | o | - 
TapJoy  |12.3.4| - | o | o | o | - 
UnityAds|3.3.0| o | o | o | o | - 

## 追加実装

アドネットワークによっては追加実装が必要なネットワークがございます。
下記を参照して実装をお願いします。

### MoPubの追加実装

広告の読み込み前にMoPub SDKを初期化する必要がございます。
AppDelegateなどで`initializeSdkWithConfiguration:`を呼び出してください。
`MOPUB_AD_UNIT_ID`は営業担当よりおしらせします。

```Objective-c tab= hl_lines="8 9 11"
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

```swift tab= hl_lines="7 8"
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