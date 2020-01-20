# AdstirMraidView-Class-Reference

バナー広告を呼び出すためのクラスです。

## Properties

* [intervalTime](#intervaltime)
* [delegate](#delegate)
* [media](#media)
* [spot](#spot)
* [autoloadenabled](#autoloadenabled)

***

### intervalTime
広告のローテーション時間を設定します。  
デフォルトのローテーション時間は60秒で、最小のローテーション時間は30秒です。  
0を設定するとローテーションは無効になります。
```objc
@property (assign) NSUInteger  intervalTime;
```

***

### delegate
バナー広告のDelegateを設定してください。
AdstirMraidViewDelegateの詳細は[こちら](AdstirMraidViewDelegate-Protocol-Reference.md)をご覧ください。

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
YESを設定すると、AdstirMraidViewがWindowに追加される際に自動でバナー広告の読み込みが始まります。  
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
* [-initWithAdSize:origin:media:spot:](#-initwithadsizeoriginmediaspot)
* [-start](#-start)
* [-stop](#-stop)

***

### -initWithAdSize:media:spot:
親ビューの左上を起点として初期化を行います。  
広告サイズについては[こちら](../../ad/banner.md#対応している広告サイズ)をご覧ください。

```objc
- (instancetype)initWithAdSize:(AdstirAdSize)size media:(NSString *)media spot:(NSUInteger)spot
```

#### Parameters
* _size_
    * 広告サイズ
* _media_
    * メディアID
* _spot_
    * スポットID

***

### -initWithAdSize:origin:media:spot:
親ビューに対する位置を指定して初期化を行います。  
広告サイズについては[こちら](../../ad/banner.md#対応している広告サイズ)をご覧ください。

```objc
- (instancetype)initWithAdSize:(AdstirAdSize)size origin:(CGPoint)origin media:(NSString *)media spot:(NSUInteger)spot
```

#### Parameters
* _size_
    * 広告サイズ
* _origin_
    * 親ビューに対する位置
* _media_
    * メディアID
* _spot_
    * スポットID

***

### -start
バナー広告の読み込みを行います。
```objc
- (void)start
```

***

### -stop
バナー広告の読み込みを停止します。
```objc
- (void)stop
```

***