# AdstirVideoAds Class Reference

動画リワード広告及び全画面インタースティシャル広告の初期化用クラスです。

## Class Methods
* [+prepareWithMedia:spots:](#preparewithmediaspots)
* [+setMediaUserID:](#setmediauserid)
* [+mediaUserID](#mediauserid)

***

### +prepareWithMedia:spots:

動画リワード広告及び全画面インタースティシャル広告の初期化を行います。

!!! notice
    動画リワード広告と全画面インタースティシャル広告を併用する場合は、動画リワード広告と全画面インタースティシャル広告の広告枠全て同時に初期化を行う必要があります。


```objc
+ (void)prepareWithMedia:(NSString *)media spots:(NSArray *)spots
```

#### Parameters
* _media_
    * メディアID

* _spots_
    * 動画リワード広告及び全画面インタースティシャル広告のスポットID

***

### +setMediaUserID:
メディアユーザIDを設定します。メディアユーザーIDを設定していない場合は、動画リワード利用時の[成果のコールバックURLへの通知](../ad/vr/callback.md)を行いません。

!!! notice
    [動画リワード広告を読み込む](../video/AdstirVideoReward-Class-Reference#-load)前にメディアユーザーIDを設定する必要があります。

```objc
+ (void)setMediaUserID:(NSString *)mediaUserID
```

#### Parameters

* _mediaUserID_
  * メディアユーザID

***

### +mediaUserID
メディアユーザIDを取得します。

```objc
+ (NSString *)mediaUserID
```

#### Returns

* _NSString *_
  * メディアユーザID
