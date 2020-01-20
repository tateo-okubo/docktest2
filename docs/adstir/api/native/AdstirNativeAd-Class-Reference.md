# AdstirNativeAd Class Reference

ネイティブ広告のリクエストを行うオブジェクトです。

## Properties
* [media](#media)
* [spot](#spot)
* [sponsoredText](#sponsoredtext)
* [delegate](#delegate)

***

### media
管理画面から取得したメディアIDを設定してください。
```objc
@property (nonatomic, copy) NSString *media;
```

***

### spot
管理画面から取得した枠Noを設定してください。
```objc
@property (nonatomic, assign) NSUInteger spot;
```

***

### sponsoredText
[ネイティブ広告ガイドライン](http://wiki.ad-stir.com/%E3%83%8D%E3%82%A4%E3%83%86%E3%82%A3%E3%83%96%E5%BA%83%E5%91%8A%E3%82%AC%E3%82%A4%E3%83%89%E3%83%A9%E3%82%A4%E3%83%B3)で規定されているスポンサー表記を実装した通りに設定してください。
```objc
@property (nonatomic, copy) NSString *sponsoredText;
```

***

### delegate
ネイティブ広告のレスポンスを受け取るDelegateを設定してください。  
Delegateの詳細は[こちら](AdstirNativeAdDelegate-Protocol-Reference.md)をご覧ください。

```objc
@property (nonatomic, weak) id<AdstirNativeAdDelegate> delegate;
```

***

## Class Methods
* [+setTestModeEnabled:](#settestmodeenabled)
* [+testModeEnabled](#testmodeenabled)

***

### +setTestModeEnabled:
テストモードの有効/無効を切り替えます。有効にする場合はYES、無効にする場合はNOを設定してください。デフォルトではテストモードは無効になっています。
```objc
+ (void)setTestModeEnabled:(BOOL)enabled;
```

#### Parameters
* _enabled_
    * テストモードの有効/無効

***

### +testModeEnabled
テストモードの有効/無効を取得します。

```objc
+ (BOOL)testModeEnabled
```

#### Returns
* _enabled_
    * テストモードの有効/無効

***


## Instance Methods

* [-init](#-init)
* [-getAd](#-getad)
* [-denyVideoOnMobileConnt:](#-denyVideoOnMobileConnt:)

***

### -init
初期化を行います。
```objc
- (id)init;
```

***

### -getAd
ネイティブ広告のリクエストを行います。
必ず全ての設定を行ったあとで呼び出してください。
```objc
- (void)getAd;
```

*** 

### -denyVideoOnMobileConnt:

モバイル回線を使用している際に動画広告を拒否するかを設定します。

```objc
- (void)denyVideoOnMobileConnt:(BOOL)enabled;
```

***


