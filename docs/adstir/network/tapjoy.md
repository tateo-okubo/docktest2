# TapJoy広告の導入

## 対応OS

iOS 9.0以上

## SDKの準備

TapJoyのSDKは、VideoAdSDKBundledのパッケージに同梱されております。
作成された動画枠の`動画SDK (iOS)`より取得いただけます。

### CocoaPodsを利用して組み込む場合

CocoaPodsでの導入については[こちら](../init/cocoapods.md)をご覧ください。

TapJoyを利用される場合、Podfileに下記の記述を追記します。  

```
pod 'AdStir-Ads-SDK/TapJoy'
```

### CocoaPodsを利用せず組み込む場合

#### プロジェクトへのSDKの追加

1. `TapJoy`フォルダを、プロジェクト内の任意の箇所にドラッグ&ドロップします。
1. `Copy items if needed`にチェックを入れます。
1. `Add to targets`欄で、`TapJoy`を利用するすべてのターゲットにチェックを入れます。
1. `Finish`をクリックします。

#### 依存Framework/Libraryの追加
名前|ステータス
----|----
MediaPlayer.framework|Required
CoreMotion.framework|Required
StoreKit.framework|Required
MessageUI.framework|Required
ImageIO.framework|Required
MobileCoreServices.framework|Required
libc++.tbd|Required
libz.tbd|Required

## ユーザデータアクセス許可に関する設定

TapJoyでは`CoreLocation.framework`, `CoreMotion.framework`を利用していますので、
[こちら](../info/user_data.md)を参考に設定を行ってください。
