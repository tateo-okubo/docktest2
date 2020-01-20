# AppLovin広告の導入

## 対応OS

iOS 10.0以上

## SDKの準備

AppLovinのSDKは、VideoAdSDKBundledのパッケージに同梱されております。
作成された動画枠の`動画SDK (iOS)`より取得いただけます。

### CocoaPodsを利用して組み込む場合

CocoaPodsでの導入については[こちら](../init/cocoapods.md)をご覧ください。

AppLovinを利用される場合、Podfileに下記の記述を追記します。  

```
pod 'AdStir-Ads-SDK/AppLovin'
```

### CocoaPodsを利用せず組み込む場合

#### プロジェクトへのSDKの追加
1. `AppLovin`フォルダを、プロジェクト内の任意の箇所にドラッグ&ドロップします。
1. `Copy items if needed`にチェックを入れます。
1. `Add to targets`欄で、`AppLovin`を利用するすべてのターゲットにチェックを入れます。
1. `Finish`をクリックします。

#### 依存Framework/Libraryの追加
名前|ステータス
----|----
CoreGraphics.framework|Required
CoreMedia.framework|Required
StoreKit.framework|Required
SystemConfiguration.framework|Required
libz.tbd|Required
