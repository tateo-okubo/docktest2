# AdstirVideoRewardDelegate Protocol Reference

動画リワード広告のデリゲートです。

## Instance Methods
* [-adstirVideoRewardDidLoad:](#-adstirvideorewarddidload)
* [-adstirVideoReward:didFailToLoadWithError:](#-adstirvideorewarddidfailtoloadwitherror)
* [-adstirVideoRewardDidStart:](#-adstirvideorewarddidstart)
* [-adstirVideoReward:didFailToPlaybackWithError:](#-adstirvideorewarddidfailtoplaybackwitherror)
* [-adstirVideoRewardDidFinishPlayback:](#-adstirvideorewarddidfinishplayback)
* [-adstirVideoRewardDidComplete:](#-adstirvideorewarddidcomplete)
* [-adstirVideoRewardDidClose:](#-adstirvideorewarddidclose)
* [-adstirVideoRewardDidCancel:](#-adstirvideorewarddidcancel)


***

### -adstirVideoRewardDidLoad:
動画の再生準備が完了した際に呼び出されます。

```objc
- (void)adstirVideoRewardDidLoad:(AdstirVideoReward *)videoReward;
```

#### Parameters
* _videoReward_
    * 再生準備が完了したインスタンス


***

### -adstirVideoReward:didFailToLoadWithError:
動画の再生準備に失敗した際に呼び出されます。  
エラーコードについては[こちら](#adstirvideorewarderror)をご覧ください。

```objc
- (void)adstirVideoReward:(AdstirVideoReward *)videoReward didFailToLoadWithError:(NSError *)error;
```

#### Parameters
* _videoReward_
    * 再生準備に失敗したインスタンス
* _error_
    * エラーメッセージ

***

### -adstirVideoRewardDidStart:
動画の再生が開始された際に呼び出されます。

```objc
- (void)adstirVideoRewardDidStart:(AdstirVideoReward *)videoReward;
```

#### Parameters
* _videoReward_
    * 再生を開始したインスタンス

***

### -adstirVideoReward:didFailToPlaybackWithError:
動画の再生に失敗した際に呼び出されます。  
エラーコードについては[こちら](#adstirvideorewarderror)をご覧ください。

```objc
- (void)adstirVideoReward:(AdstirVideoReward *)videoReward didFailToPlaybackWithError:(NSError *)error;
```

#### Parameters
* _videoReward_
    * 再生に失敗したインスタンス

* _error_
    * エラーメッセージ

***

### -adstirVideoRewardDidFinishPlayback:
動画の再生が完了した際に呼び出されます。

```objc
- (void)adstirVideoRewardDidFinishPlayback:(AdstirVideoReward *)videoReward;
```

#### Parameters
* _videoReward_
    * 再生が完了したインスタンス

***

### -adstirVideoRewardDidComplete:
リワードが付与された際に呼び出されます。

```objc
- (void)adstirVideoRewardDidComplete:(AdstirVideoReward *)videoReward;
```

#### Parameters
* _videoReward_
    * リワードを付与したインスタンス

***

### -adstirVideoRewardDidClose:
動画の再生画面が閉じられた際に呼び出されます。

```objc
- (void)adstirVideoRewardDidClose:(AdstirVideoReward *)videoReward;
```

#### Parameters
* _videoReward_
    * 再生画面が閉じられたインスタンス

***

### -adstirVideoRewardDidCancel:
 動画の再生がキャンセルされた際に呼び出されます。ただし、このイベントには全てのアドネットワークが対応しているわけではありません。

```objc
- (void)adstirVideoRewardDidCancel:(AdstirVideoReward *)videoReward;
```

#### Parameters
* _videoReward_
    * 再生がキャンセルされたインスタンス

***

## Error code
### AdstirVideoRewardError

エラーコード|定義|説明
---|---|---
15100|AdstirVideoRewardErrorUnknown|Unknownエラー  
15101|AdstirVideoRewardErrorInternal|Internalエラー(アプリ側へは通知されません)  
15102|AdstirVideoRewardErrorNoFill|案件切れによる読み込みエラー  
15103|AdstirVideoRewardErrorFailedToPlayback|広告再生失敗エラー  
15104|AdstirVideoRewardErrorInvalidSpot|存在しない広告枠への読み込みエラー  
15105|AdstirVideoRewardErrorDidNotInitialize|初期化未完了時の読み込みエラー
15106|AdstirVideoRewardErrorMediationAdapterNotFound|メディエーションアダプタの呼び出しエラー(アプリ側へは通知されません)  
