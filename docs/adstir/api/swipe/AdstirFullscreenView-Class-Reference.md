# AdstirFullscreenView Class Reference

## Properties
* [delegate](#delegate)
* [media](#media)
* [spot](#spot)

***

### delegate
スワイプインタースティシャル広告のDelegateを設定してください。
AdstirMraidViewDelegateの詳細は[こちら](../banner/AdstirMraidViewDelegate-Protocol-Reference.md)をご覧ください。

```objc
@property (weak) id<AdstirMraidViewDelegate> delegate;
```

***

### media
メディアIDを設定します。

```objc
@property (nonatomic, copy, asadnonnull) NSString*  media;
```

***

### spot
枠Noを設定します。

```objc
@property (nonatomic, assign) NSUInteger spot;
```

***

### autoloadEnabled
YESを設定すると、AdstirFullscreenViewがWindowに追加される際に自動でスワイプインタースティシャル広告の読み込みが始まります。
デフォルトではNOが設定されています。

```objc
@property (nonatomic, assign, getter=isAutoloadEnabled) BOOL autoloadEnabled;
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

* [-initWithAdSize:media:spot:](#-initwithadsizemediaspot)
* [-initWithView:origin:media:spot:](#-initwithadsizeoriginmediaspot)
* [-start](#-start)
* [-stop](#-stop)

***

### -initWithAdSize:media:spot:
表示されるスワイプインタースティシャル広告のサイズを指定して初期化を行います。

```objc
- (instancetype)initWithAdSize:(CGSize)size media:(NSString *)media spot:(NSUInteger)spot
```

#### Parameters
* _size_
    * 広告サイズ
* _media_
    * メディアID
* _spot_
    * スポットID

***

### -initWithView:media:spot:
親ビューに全画面で表示されるように初期化を行います。


```objc
- (instancetype)initWithAdSize:(UIView)view media:(NSString *)media spot:(NSUInteger)spot
```

#### Parameters
* _view_
    * 親ビュー
* _media_
    * メディアID
* _spot_
    * スポットID

***

### -start
スワイプインタースティシャル広告の読み込みを行います。
```objc
- (void)start
```

***

### -stop
スワイプインタースティシャル広告の読み込みを停止します。
```objc
- (void)stop
```

***