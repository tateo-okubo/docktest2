# imobile広告の導入

## 対応OS

iOS 8.0以上

## SDKの準備

IMobileのSDKは、VideoAdSDKBundledのパッケージに同梱されております。  
作成された動画枠の`動画SDK (iOS)`より取得いただけます。

### CocoaPodsを利用して組み込む場合

CocoaPodsでの導入については[こちら](../init/cocoapods.md)をご覧ください。

IMobileを利用される場合、Podfileに下記の記述を追記します。  

```
pod 'AdStir-Ads-SDK/IMobile'
```

### CocoaPodsを利用せず組み込む場合

#### プロジェクトへのSDKの追加

1. `IMobile`フォルダを、プロジェクト内の任意の箇所にドラッグ&ドロップします。
1. `Copy items if needed`にチェックを入れます。
1. `Add to targets`欄で、`IMobile`を利用するすべてのターゲットにチェックを入れます。
1. `Finish`をクリックします。

#### 依存Framework/Libraryの追加

名前|ステータス
----|----
SystemConfiguration.framework|Required
CoreLocation.framework|Required

## ユーザデータアクセス許可に関する設定

IMobileでは`CoreLocation.framework`を利用していますので、
[こちら](../info/user_data.md)を参考に設定を行ってください。

