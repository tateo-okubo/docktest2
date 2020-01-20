# CocoaPodsを利用した組み込み

[CocoaPods](https://guides.cocoapods.org/using/getting-started)を利用してSDKをプロジェクトに取り込むことが可能です。

## Podfileの作成

プロジェクトにPodfileが存在しない場合は、組み込む対象の.xcodeprojファイルがあるディレクトリに移動し、下記のコマンドでPodfileを作成します。

```bash
$ pod init
```

## Podfileの編集

任意のエディタでPodfileを開き、下記の様にadstir SDKについての記述を追記します。  
platformの行は、プロジェクトに応じて適宜設定してください。  

```ruby
# Uncomment the next line to define a global platform for your project
platform :ios, "9.0"
pod 'AdStir-Ads-SDK'

# AdMobメディエーションを利用する場合は、下記のコメントを外します。
# pod 'AdStir-Ads-SDK/AdMob-Package'

target 'projectname' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for projectname

end
```

podに記述したものと、導入されるSDKの対応は以下の通りです。

pod | 導入されるもの
---|---
AdStir-Ads-SDK|adstir SDK
AdStir-Ads-SDK/AdMobMediationAdapter| adstir SDK / adstirのAdMobアダプター
AdStir-Ads-SDK/AdColony| adstir SDK / AdColony SDKとアダプター
AdStir-Ads-SDK/AdCorsa| adstir SDK / AdCorsa SDKとアダプター
AdStir-Ads-SDK/AppLovin| adstir SDK / AppLovin SDKとアダプター
AdStir-Ads-SDK/IMobile| adstir SDK / IMobile SDKとアダプター
AdStir-Ads-SDK/Maio| adstir SDK / Maio SDKとアダプター
AdStir-Ads-SDK/Mobvista| adstir SDK / Mobvista SDKとアダプター
AdStir-Ads-SDK/MoPub| adstir SDK / MoPub SDKとアダプター
AdStir-Ads-SDK/Nend| adstir SDK / Nend SDKとアダプター
AdStir-Ads-SDK/TapJoy| adstir SDK / TapJoy SDKとアダプター
AdStir-Ads-SDK/TikTok| adstir SDK / TikTok SDKとアダプター
AdStir-Ads-SDK/UnityAds| adstir SDK / UnityAds SDKとアダプター
AdStir-Ads-SDK/All-Incentivized| adstir SDK / 動画リワード対応しているSDKとアダプター
AdStir-Ads-SDK/All-Interstitial| adstir SDK / 全画面インタースティシャル対応しているSDKとアダプター
AdStir-Ads-SDK/All-Swipeinterstitial| adstir SDK / スワイプインタースティシャル対応しているSDKとアダプター
AdStir-Ads-SDK/All-adstir| adstir SDK / [adstirと提携しているアドネットワーク](../network/index.md#提携対応アドネットワーク)のSDKとアダプター
AdStir-Ads-SDK/AdMob-Package| adstir SDK / [AdMobメディエーション](../../../admob/network/#admobメディエーションで利用できるアドネットワーク)で利用するアドネットワーク / [APS](../../../aps/init/#amazon-publisher-servicesapsの初期設定)のSDKとアダプター

## SDKのインストール

新規でadstirのSDKを追加する場合は、下記のコマンドを実行します。

```bash
$ pod install
```

更新または削除をする場合は、下記のコマンドを実行します。

```bash
$ pod update
```

## アプリケーションの開発

新規でPodfileを作成した場合には、同じディレクトリに**プロジェクト名.xcworkspace**というファイルが作成されますので、そのファイルを開いてアプリケーションの開発を行います。  
既存のPodfileに追記した場合は、引き続き同じワークスペースで開発を進めてください。
