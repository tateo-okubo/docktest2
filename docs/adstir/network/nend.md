# nend広告の導入

## 対応OS
iOS 8.1以降

## SDKの準備
NendのSDKは、VideoAdSDKBundledのパッケージに同梱されております。  
作成された動画枠の`動画SDK (iOS)`より取得いただけます。

### CocoaPodsを利用して組み込む場合

CocoaPodsでの導入については[こちら](../init/cocoapods.md)をご覧ください。

Nendを利用される場合、Podfileに下記の記述を追記します。  

```
pod 'AdStir-Ads-SDK/Nend'
```

### CocoaPodsを利用せず組み込む場合

#### プロジェクトへのSDKの追加
1. `Nend`フォルダを、プロジェクト内の任意の箇所にドラッグ&ドロップします。
1. `Copy items if needed`にチェックを入れます。
1. `Add to targets`欄で、`Nend`を利用するすべてのターゲットにチェックを入れます。
1. `Finish`をクリックします。

#### 依存Framework/Libraryの追加
名前|ステータス
----|----
Security.framework|Required
ImageIO.framework|Required
SafariServices.framework|Required
WebKit.framework|Optional
UIKit.framework|Optional
libz.tbd|Required
