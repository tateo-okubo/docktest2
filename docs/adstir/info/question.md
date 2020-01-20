# よくある質問

## レポートに表示回数が反映されません

開発版とリリース版のパッケージ名が異なる場合、一部の提携ネットワークで実績の取得が行われないことがございます。
その際は、リリース版と同じパッケージ名に変更いただいた上でテストいただくか、開発版とリリース版のパッケージ名が異なる旨を添えていただき、レポート数値について営業担当にお問い合わせください。

## 動画の再生について

###「You may not prepare AdstirInterastitial.」と表示される

初期化処理が行われていません。
広告を読み込む前に、必ず[初期化](../api/AdstirVideoAds-Class-Reference/#preparewithmediaspots)を行ってください。

### 動画が再生できません

* ご利用の対応提携ネットワークのSDKとメディエーションアダプタがプロジェクトに追加されているかご確認ください。

* SDKを更新された場合は、パッケージに含まれる全てのSDKを更新されたかご確認ください。 バージョンの異なるSDKをご利用の場合、正常に動作しない可能性があります。

* 初期化メソッド([prepareWithMedia](../api/AdstirVideoAds-Class-Reference#preparewithmediaspots))で指定したメディアIDと同じメディアIDを使ってAdstirVideoReward, AdstirInterstitialをインスタンス化してるかご確認ください。

### 特定のアドネットワークの動画が再生できません

プロジェクトの設定や動作環境がネットワークに対応しているか[こちら](../network#提携対応アドネットワーク)からご確認ください。

### 特定アドネットワークが正しく組み込まれているか確認したい

下記の動画リワードの広告枠をご利用していただくことでSDKが組み込まれているか確認が可能です。
下記のIDで動作を確認後、本番のIDへ変更をお願いします。

アドネットワーク名|メディアID|枠No
---|---|---
adstirのプレイヤー                |MEDIA-2e366f20|1
[Nend](../network/nend.md)         |MEDIA-2e366f20|2
[AppLovin](../network/applovin.md) |MEDIA-2e366f20|3
[UnityAds](../network/unityads.md) |MEDIA-2e366f20|4
[Maio](../network/maio.md)         |MEDIA-2e366f20|5
[TapJoy](../network/tapjoy.md)     |MEDIA-2e366f20|6
[MoPub](../network/mopub.md)       |MEDIA-2e366f20|7
[AdCorsa](../network/adcorsa.md)  |MEDIA-2e366f20|8
[Mobvista](../network/mobvista.md) |MEDIA-2e366f20|9
[AdColony](../network/adcolony.md) |MEDIA-2e366f20|10
[TikTok](../network/tiktok.md)     |MEDIA-2e366f20|11

### エラーコードの意味を教えてください。

下記をご覧ください。

* [動画リワード広告のエラーコード](../../api/video/AdstirVideoRewardDelegate-Protocol-Reference/#error-code)
* [全画面インタースティシャル広告のエラーコード](../..//api/interstitial/AdstirInterstitialDelegate-Protocol-Reference/#adstirinterstitialerror)
* [ネイティブ動画広告のエラーコード](../../api/native/video/AdstirNativeVideoViewDelegate-Protocol-Reference/#adstirnativevideoerror)
