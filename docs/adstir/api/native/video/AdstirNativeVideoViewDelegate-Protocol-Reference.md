# AdstirNativeVideoViewDelegate Protocol Reference

ネイティブ動画広告のデリゲートです。

## Instance Methods

* [-adstirNativeVideoDidLoad:](#-adstirnativevideodidload)
* [-adstirNativeVideo:didFailToLoadWithError:](#-adstirnativevideodidfailtoloadwitherror)
* [-adstirNativeVideoDidStart:](#-adstirnativevideodidstart)
* [-adstirNativeVideoDidStop:](#-adstirnativevideodidstop)
* [-adstirNativeVideoDidFinishPlayback:](#-adstirnativevideodidfinishplayback)
* [-adstirNativeVideo:didFailToPlaybackWithError:](#-adstirnativevideodidfailtoplaybackwitherror)

***

### -adstirNativeVideoDidLoad:

動画広告の読み込みが完了した際に呼び出されます。

```objc
- (void)adstirNativeVideoDidLoad:(AdstirNativeVideoView *)nativeVideoView;
```

#### Parameters

* _nativeVideoView_
  * 読み込みが完了したView

***

### -adstirNativeVideo:didFailToLoadWithError:

動画広告の再生準備に失敗した際に呼び出されます。
エラーコードについては[こちら](#adstirnativevideoerror)をご覧ください。

```objc
- (void)adstirNativeVideo:(AdstirNativeVideoView *)nativeVideoView didFailToLoadWithError:(NSError *)error;
```

#### Parameters

* _nativeVideoView_
  * 動画広告の再生準備に失敗したView
* _error_
  * エラーメッセージ

***

### -adstirNativeVideoDidStart:

動画広告の再生開始時に呼び出されます。

```objc
- (void)adstirNativeVideoDidStart:(AdstirNativeVideoView *)nativeVideoView;
```

#### Parameters

* _nativeVideoView_
  * 再生を開始したView

***

### -adstirNativeVideoDidStop:

動画広告の再生停止時に呼び出されます。

```objc
- (void)adstirNativeVideoDidStop:(AdstirNativeVideoView *)nativeVideoView;
```

#### Parameters

* _nativeVideoView_
  * 再生を停止したView

***

### -adstirNativeVideoDidFinishPlayback:

動画広告の再生完了時に呼び出されます。

```objc
- (void)adstirNativeVideoDidFinishPlayback:(AdstirNativeVideoView *)nativeVideoView;
```

#### Parameters

* _nativeVideoView_
  * 再生を完了したView

***

### -adstirNativeVideo:didFailToPlaybackWithError:

動画広告の再生に失敗した際に呼び出されます。
エラーコードについては[こちら](#adstirnativevideoerror)をご覧ください。

```objc
- (void)adstirNativeVideo:(AdstirNativeVideoView *)nativeVideoView didFailToPlaybackWithError:(NSError *)error;
```

#### Parameters

* _nativeVideoView_
  * 動画広告の再生に失敗したView
* _error_
  * エラーメッセージ

***


## Error code

### AdstirNativeVideoError

***

エラーコード|定義|説明
---|---|---
14100 | AdstirNativeVideoErrorPrepareVideoError | 動画プレイヤーの準備に失敗した
14101 | AdstirNativeVideoErrorIoError | ファイルまたはネットワーク関連の操作エラー
14102 | AdstirNativeVideoErrorTimedOutError | 動画プレイヤーがタイムアウトした 
14103 | AdstirNativeVideoErrorMalformedError | ビットストリームが関連コーディング規格またはファイル仕様に準拠していない
14104 | AdstirNativeVideoErrorUnsupportedError | メディアフレームワークはこの機能をサポートしていない
14105 | AdstirNativeVideoErrorNotValidForProgressiveplayback | 動画のコンテナがプログレッシブ再生に対応していない
14106 | AdstirNativeVideoErrorUnknownPlayerError | 動画プレイヤーでの不明なエラー
14107 | AdstirNativeVideoErrorServerError | 動画サーバーのエラー
14108 | AdstirNativeVideoErrorVideoNotSpecified | プレイヤー読み込みの際、ネイティブ動画オブジェクトが指定されなかった
14109 | AdstirNativeVideoErrorNoFreeSpace | 端末の空き容量が不足しているエラー
14110 | AdstirNativeVideoErrorIncorrectFileName | 動画キャッシュのファイル名が不正
14111 | AdstirNativeVideoErrorIncorrectUrl | 動画ファイルが不正なURL
14112 | AdstirNativeVideoErrorOpenStreamError | ストリームを開くことに失敗した
14113 | AdstirNativeVideoErrorVideoChacheError | 動画キャッシュの生成に失敗した
14114 | AdstirNativeVideoErrorPlayerStateError | 動画プレイヤーが正しくない状態で再生されようとした
14115 | AdstirNativeVideoErrorPlayerUnavailableError | Viewの準備が整っていない状態で再生されようとした
14199 | AdstirNativeVideoErrorUnknownError | 不明なエラー

