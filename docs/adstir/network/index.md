# 提携対応アドネットワーク

各広告には下記のネットワークSDKが対応しています。

ネットワーク|SDKバージョン[^1]|対応OS|容量(KB)[^2]| バナー | スワイプインタースティシャル | ネイティブ | 動画リワード | 全画面インタースティシャル
---|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:
[AdColony](adcolony.md)|{{config.version.adcolony}}|8.0〜| | - | - | - | ○ | -
[AdCorsa](adcorsa.md)  |{{config.version.adcorsa}} |8.0〜|280 | - | - | - | ○ | ○
[AppLovin](applovin.md)|{{config.version.applovin}}|10.0〜|760| - | - | - | ○ | ○
[imobile](imobile.md)  |{{config.version.imobile}} |8.1〜| 110| - | - | - | - | ○
[Maio](maio.md)        |{{config.version.maio}}    |8.0〜|180 | - | - | - | ○ | ○
[Mobvista](mobvista.md)|{{config.version.mobvista}}|8.0〜|1880 | - | - | - | ○ | ○
[MoPub](mopub.md)      |{{config.version.mopub}}   |9.0〜|760| ○ | ○ | ○ | ○ | ○
[Nend](nend.md)        |{{config.version.nend}}    |8.1〜|400 | - | - | - | ○ | ○
[TapJoy](tapjoy.md)    |{{config.version.tapjoy}}  |9.0〜|400 | - | - | - | ○ | ○
[TikTok](tiktok.md)    |{{config.version.tiktok}}  |9.0〜|580| - | - | - | ○ | ○
[UnityAds](unityads.md)|{{config.version.unityads}}|9.0〜[^3]|250 | - | - | - | ○ | -
[Zucks](zucks.md)      |{{config.version.zucks}}   |8.0〜|  150| - | ○ | - | - | -



* 対応OSバージョンでない端末の場合、非対応のネットワークは配信されず、対応しているネットワークが配信されます。
* ATS, Bitcode, IPv6については上記のネットワーク全て対応しております。

[^1]: adstir SDK {{config.version.adstir}}の対応状況です。
[^2]: 容量は、対応提携ネットワークのSDKと、メディエーションアダプタを追加したときに増加する概算容量です。
[^3]: UnityAds SDKを組み込んだアプリをiOS 9未満で起動するとクラッシュします。ご注意ください。