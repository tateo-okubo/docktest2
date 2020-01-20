# TikTok広告の導入

## 対応OS

iOS 9.0以上

## SDKの準備

TikTokのSDKは、VideoAdSDKBundledのパッケージに同梱されております。
作成された動画枠の`動画SDK (iOS)`より取得いただけます。

### CocoaPodsを利用して組み込む場合

CocoaPodsでの導入については[こちら](../init/cocoapods.md)をご覧ください。

TikTokを利用される場合、Podfileに下記の記述を追記します。  

```
pod 'AdStir-Ads-SDK/TikTok'
```


### CocoaPodsを利用せず組み込む場合

#### プロジェクトへのSDKの追加

1. `TikTok`フォルダを、プロジェクト内の任意の箇所にドラッグ&ドロップします。
1. `Copy items if needed`にチェックを入れます。
1. `Add to targets`欄で、`TikTok`を利用するすべてのターゲットにチェックを入れます。
1. `Finish`をクリックします。

#### ビルド設定の変更

1. プロジェクトファイル設定画面を開きます。
1. 動画広告を組み込むビルドターゲットを選択します。
1. **Build Target**タブを選択します。
1. 画面右側の検索窓に**Other Linker Flags**と入力し、検索します。
1. **Other Linker Flags**欄に、**-ObjC**を設定します。  
1. 組み込む対象の全てのビルドターゲットに、同じ設定を行います。  
もしくは、この設定はプロジェクト単位で設定することも可能です。

#### 依存Framework/Libraryの追加

名前|ステータス
----|----
StoreKit.framework|Required
MobileCoreServices.framework|Required
WebKit.framework|Required
MediaPlayer.framework|Required
CoreMotion.framework|Required
CoreLocation.framework|Required
libresolv.9.tbd|Required
libc++.tbd|Required
libz.tbd|Required

## ユーザデータアクセス許可に関する設定

TikTokでは`CoreLocation.framework`, `CoreMotion.framework`を利用していますので、
[こちら](../info/user_data.md)を参考に設定を行ってください。