# AdstirInterstitialDelegate Protocol Reference

全画面インタースティシャル広告のデリゲートです。

## Instance Methods
* [-adstirInterstitialDidLoad:](#-adstirinterstitialdidload)
* [-adstirInterstitial:didFailToLoadWithError:](#-adstirinterstitialdidfailtoloadwitherror)
* [-adstirInterstitialDidShow:](#-adstirinterstitialdidshow)
* [-adstirInterstitial:didFailToShowWithError:](#-adstirinterstitialdidfailtoshowwitherror)
* [-adstirInterstitialDidClose:](#-adstirinterstitialdidclose)


***

### -adstirInterstitialDidLoad:
インタースティシャル広告の準備が完了した際に呼び出されます。

```objc
- (void)adstirInterstitialDidLoad:(AdstirInterstitial *)interstitial;
```

#### Parameters
* _interstitial_
    * インタースティシャル広告の準備が完了したインスタンス


***

### -adstirInterstitial:didFailToLoadWithError:
インタースティシャル広告の準備に失敗した際に呼び出されます。  
エラーコードについては[こちら](#adstirinterstitialerror)をご覧ください。

```objc
- (void)adstirInterstitial:(AdstirInterstitial *)interstitial didFailToLoadWithError:(NSError *)error;
```

#### Parameters
* _interstitial_
    * インタースティシャル広告の準備に失敗したインスタンス
* _error_
    * エラーメッセージ

***

### -adstirInterstitialDidShow:
インタースティシャル広告が表示された際に呼び出されます。

```objc
- (void)adstirInterstitialDidShow:(AdstirInterstitial *)interstitial;
```

#### Parameters
* _Interstitial_
    * インタースティシャル広告を表示したインスタンス

***

### -adstirInterstitial:didFailToShowWithError:
インタースティシャル広告の表示に失敗した際に呼び出されます。  
エラーコードについては[こちら](#adstirinterstitialerror)をご覧ください。

```objc
- (void)adstirInterstitial:(AdstirInterstitial *)interstitial didFailToShowWithError:(NSError *)error;
```

#### Parameters
* _interstitial_
    * インタースティシャル広告の表示に失敗したインスタンス

* _error_
    * エラーメッセージ

***

### -adstirInterstitialDidClose:
インタースティシャル広告が閉じられたときに呼び出されます。

```objc
- (void)adstirInterstitialDidClose:(AdstirInterstitial *)interstitial;
```

#### Parameters
* _interstitial_
    * インタースティシャル広告が閉じられたインスタンス

***

## Error code
### AdstirInterstitialError

エラーコード|定義|説明
---|---|---
15000|AdstirInterstitialErrorUnknown|Unknownエラー  
15001|AdstirInterstitialErrorInternal|Internalエラー(アプリ側へは通知されません)  
15002|AdstirInterstitialErrorNoFill|案件切れによる読み込みエラー  
15003|AdstirInterstitialErrorFailedToShow|広告再生失敗エラー  
15004|AdstirInterstitialErrorInvalidSpot|存在しない広告枠への読み込みエラー  
15005|AdstirInterstitialErrorDidNotInitialize|初期化未完了時の読み込みエラー
15006|AdstirInterstitialErrorMediationAdapterNotFound|メディエーションアダプタの呼び出しエラー(アプリ側へは通知されません)  


