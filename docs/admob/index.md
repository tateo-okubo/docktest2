# AdMob広告について

## 前提条件

* Xcode 10以上
* iOS 9.0以上
    * iOS 8.0以上のアプリから組み込めますが、iOS 9.0以上の端末に広告が配信されます。

## 事前準備

[AdMobのスタートガイド](https://developers.google.com/admob/ios/quick-start?hl=ja)を参考に、AdMobの設定をおこなってください。
GoogleMobileAds SDKは7.53.0以上をご利用ください。

### メディエーションの準備

[AdMobメディエーション](https://developers.google.com/admob/ios/mediate?hl=ja)を行うために、アドネットワークのSDKとアダプターをプロジェクトへ導入します。

#### CocoaPodを利用している場合
Podfileへ下記のものを記述することで、adstirが利用するアドネットワークのSDKとアダプターを一括で導入することができます。

```
pod 'AdStir-Ads-SDK/AdMob-Package'
```

#### 手動で導入する場合

1. [こちら](../adstir/init/manual_integration.md#sdkの手動組み込み)を参考にadstirの動画パッケージを組み込みます。
1. [AdMobのスタートガイド](https://developers.google.com/admob/ios/quick-start?hl=ja#manual_download)を参考にGoogleMobileAds SDKを導入します。
1. adstir SDKにbundleされていないアドネットワークのSDKをダウンロードします。
    * [Facebook](https://origincache.facebook.com/developers/resources/?id=FBAudienceNetwork-5.6.0.zip)
1. AdMobメディエーションで利用できる各アドネットワークのアダプターをダウンロードします。
    * [AdColony](https://google.bintray.com/mobile-ads-adapters-ios/AdColonyAdapter/4.1.2.0/AdColonyAdapter-4.1.2.0.zip)
    * [AppLovin](https://google.bintray.com/mobile-ads-adapters-ios/AppLovinAdapter/6.10.1.0/AppLovinAdapter-6.10.1.0.zip)
    * [Facebook](https://google.bintray.com/mobile-ads-adapters-ios/FacebookAdapter/5.6.0.0/FacebookAdapter-5.6.0.0.zip)
    * [maio](https://google.bintray.com/mobile-ads-adapters-ios/MaioAdapter/1.5.1.0/MaioAdapter-1.5.1.0.zip)
    * [MoPub](https://google.bintray.com/mobile-ads-adapters-ios/MoPubAdapter/5.10.0.0/MoPubAdapter-5.10.0.0.zip)
    * [nend](https://google.bintray.com/mobile-ads-adapters-ios/NendAdapter/5.3.0.0/NendAdapter-5.3.0.0.zip)
    * [TapJoy](https://google.bintray.com/mobile-ads-adapters-ios/TapjoyAdapter/12.3.4.0/TapjoyAdapter-12.3.4.0.zip)
    * [UnityAds](https://google.bintray.com/mobile-ads-adapters-ios/UnityAdapter/3.3.0.0/UnityAdapter-3.3.0.0.zip)
1. ダウンロードしたzipファイルを解凍し、各frameworkをプロジェクトへ追加します。

## 広告の実装

AdMobの実装ガイドをご覧ください。

* [バナー](https://developers.google.com/admob/ios/banner?hl=ja)
* [インタースティシャル](https://developers.google.com/admob/ios/interstitial?hl=ja)
* [ネイティブ](https://developers.google.com/admob/ios/native/start?hl=ja)
* [動画リワード](https://developers.google.com/admob/ios/rewarded-ads?hl=ja)

また、アドネットワークによっては追加で実装する必要がございます。
[追加実装](network.md#追加実装)をご覧になり、実装をお願いします。

### テストデバイスの追加

開発時には[テストデバイスを追加する](https://developers.google.com/admob/ios/test-ads#add_your_test_device)より、広告リクエスト時にデバイスIDの設定をおこなってください。
こちらの設定をおこなった際には、アプリケーションのリリース前には該当コードの削除をお願いいたします。
