# Amazon Publisher Services(APS)の初期設定

APSの広告は下記のものに対応しております。
APSの広告を表示するためには、`AdMobの広告リクエスト時に追加で実装が必要`になりますので、必ず下記を確認してください。

* [AdMobバナー広告](banner.md)
* [AdMobインタースティシャル広告](interstitial.md)

## 前提条件

* iOS 9.0以上

## プロジェクトへAPSの導入

APSのSDKとアダプター、アドネットワークのSDKとアダプターをプロジェクトへ導入します。

### CocoaPodを利用している場合
Podfileへ下記のものを記述することで、adstirが利用するアドネットワークのSDKとアダプターを一括で導入することができます。

```
pod 'AdStir-Ads-SDK/AdMob-Package'
```

### 手動で導入する場合

営業担当にお問い合わせください。


## APSの初期化

営業担当がお知らせしたAPSのapp idを用いて、下記のように初期化を行います。

```Objective-c tab=
#import <DTBiOSSDK/DTBiOSSDK.h>
...

[[DTBAds sharedInstance] setAppKey: @"YOUR_APP_ID"];
```

```swift tab=
import DTBiOSSDK
...

DTBAds.sharedInstance().setAppKey("YOUR_APP_ID")
```

テスト時には下記のものも追加します。
アプリをリリースする前には下記のコードは削除してください。

```Objective-c tab=
[[DTBAds sharedInstance] setLogLevel:DTBLogLevelAll];
[[DTBAds sharedInstance] setTestMode:YES];
```

```swift tab=
DTBAds.sharedInstance().setLogLevel(DTBLogLevelAll)
DTBAds.sharedInstance().testMode = true
```

## 広告を実装する

* [AdMobバナー広告](banner.md)
* [AdMobインタースティシャル広告](interstitial.md)
