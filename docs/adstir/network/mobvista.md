# Mobvista広告の導入

## 対応OS

iOS 8.0以上。

!!! warning "注意"
    iPadOSには配信されません。

## SDKの準備

MobvistaのSDKは、VideoAdSDKBundledのパッケージに同梱されております。
作成された動画枠の`動画SDK (iOS)`より取得いただけます。

### CocoaPodsを利用して組み込む場合

CocoaPodsでの導入については[こちら](../init/cocoapods.md)をご覧ください。

Mobvistaを利用される場合、Podfileに下記の記述を追記します。  

```
pod 'AdStir-Ads-SDK/Mobvista'
```

### CocoaPodsを利用せず組み込む場合

#### プロジェクトへのSDKの追加

1. `Mobvista`フォルダを、プロジェクト内の任意の箇所にドラッグ&ドロップします。
1. `Copy items if needed`にチェックを入れます。
1. `Add to targets`欄で、`Mobvista`を利用するすべてのターゲットにチェックを入れます。
1. `Finish`をクリックします。

#### 依存Framework/Libraryの追加
名前|ステータス
----|----
CoreGraphics.framework|Required
Foundation.framework|Required
UIKit.framework|Required
StoreKit.framework|Required
CoreLocation.framework|Required
MobileCoreServices.framework|Required
Accelerate.framework|Required
WebKit.framework|Required
libsqlite3.tbd|Required
libz.tbd|Required

## ユーザデータアクセス許可に関する設定

Mobvistaでは`CoreLocation.framework`を利用していますので、
[こちら](../info/user_data.md)を参考に設定を行ってください。


