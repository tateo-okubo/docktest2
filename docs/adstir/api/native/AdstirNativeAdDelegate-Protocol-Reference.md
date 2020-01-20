# AdstirNativeAdDelegate Protocol Reference

ネイティブ広告のデリゲートです。  
AdstirNativeAdDelegateのメソッドはすべてバックグラウンドスレッドで動作します。  
UIを操作する場合は[performSelectorOnMainThread:withObject:waitUntilDone:](http://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSObject_Class/Reference/Reference.html#//apple_ref/occ/instm/NSObject/performSelectorOnMainThread:withObject:waitUntilDone:)や[dispatch_sync(dispatch_get_main_queue(), ^(void){});](http://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man3/dispatch_get_main_queue.3.html)を利用してください。

## Instance Methods
* [-adstirNativeAdDidReceiveAd:response:](#-adstirnativeaddidreceiveadresponse)
* [-adstirNativeAdDidFailToReceiveAd:](#-adstirnativeaddidfailtoreceivead)

***

### -adstirNativeAdDidReceiveAd:response:
広告の取得が成功した際に呼び出されます。

```objc
- (void)adstirNativeAdDidReceiveAd:(AdstirNativeAd *)nativeAd response:(AdstirNativeAdResponse *)response;
```

#### Parameters
* _nativeAd_
    * リクエスト
* _response_
    * レスポンス

***

### -adstirNativeAdDidFailToReceiveAd:
広告の取得が失敗した際に呼び出されます。

```objc
- (void)adstirNativeAdDidFailToReceiveAd:(AdstirNativeAd　＊)nativeAd;
```

#### Parameters
* _nativeAd_
    * リクエスト

***