# AdstirNativeVideoView Class Reference

ネイティブ動画広告のクラスです。

## Properties

* [delegate](#delegate)

### delegate
ネイティブ動画広告のイベントを受け取るDelegateを設定してください。  
Delegateの詳細は[こちら](AdstirNativeVideoViewDelegate-Protocol-Reference.md]をご覧ください。

```objc
@property (nonatomic, weak) id<AdstirNativeVideoViewDelegate> delegate;
```

## Instance Methods

* [-loadAd:](#-loadAd)

***

### -loadAd

Viewに動画広告を読み込みます。

```objc
- (void)loadAd:(AdstirNativeVideoAd *)ad;
```

***