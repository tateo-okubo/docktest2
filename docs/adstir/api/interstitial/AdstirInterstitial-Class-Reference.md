# AdstirInterstitial Class Reference

全画面インタースティシャル広告を呼び出すためのクラスです。

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
* [-initWithMedia:spot:](#-initwithmediaspot)
* [-load](#-load)
* [-canShow](#-canshow)
* [-showFromViewController:](#-showfromviewcontroller)

***

### -initWithMedia:spot:  
インスタンスの初期化を行います。[+prepareWithMedia:spots:](#preparewithmediaspots)で初期化したIDと別のIDは使用できません。
```objc
- (instancetype)initWithMedia:(NSString *)media spot:(NSUInteger)spot
```

#### Parameters

* _media_
    * メディアID

* _spot_
    * スポットID


#### Returns

* _instancetype_
    * 初期化済みのAdstirInterstitialのインスタンス

***

### -load
広告の読み込みを行います。読み込み完了等の通知が必要な場合は[AdstirInterstitial](AdstirInterstitialDelegate-Protocol-Reference.md)を実装してください。


```objc
-　(void)load
```

***

### -canShow
広告が再生できる場合はYES、できない場合はNOを返します。

```objc
- (BOOL)canShow
```

#### Returns

* _BOOL_
    * 再生の可否

***

### -showFromViewController:
広告の再生を行います。再生の開始等の通知が必要な場合は[AdstirInterstitialDelegate](AdstirInterstitialDelegate-Protocol-Reference.md)を実装してください。


```objc
- (void)showFromViewController:(UIViewController *)viewController
```

#### Parameters

* _viewController_
    * 呼び出し元のViewController

***