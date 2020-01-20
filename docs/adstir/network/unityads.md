# UnityAds広告の導入

## 対応OS

iOS 9以上

!!! danger "iOS 8以下をサポートしているアプリの開発者の皆さまへ"
    **UnityAds SDKを組み込んだアプリをiOS 9未満で起動するとクラッシュしますので、iOS 8以下をサポートしているアプリを開発している場合はご注意ください。**

## SDKの準備

UnityAdsのSDKは、VideoAdSDKBundledのパッケージに同梱されております。
作成された動画枠の`動画SDK (iOS)`より取得いただけます。

### CocoaPodsを利用して組み込む場合

CocoaPodsでの導入については[こちら](../init/cocoapods.md)をご覧ください。

UnityAdsを利用される場合、Podfileに下記の記述を追記します。  

```
pod 'AdStir-Ads-SDK/UnityAds'
```

### CocoaPodsを利用せず組み込む場合

#### プロジェクトへのSDKの追加

1. `UnityAds`フォルダを、プロジェクト内の任意の箇所にドラッグ&ドロップします。
1. `Copy items if needed`にチェックを入れます。
1. `Add to targets`欄で、`UnityAds`を利用するすべてのターゲットにチェックを入れます。
1. `Finish`をクリックします。
