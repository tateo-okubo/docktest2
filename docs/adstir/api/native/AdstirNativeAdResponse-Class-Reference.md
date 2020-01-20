# AdstirNativeAdResponse Class Reference

ネイティブ広告のレスポンスクラスです。

## Properties

* [title](#title)
* [rating](#rating)
* [cta](#cta)
* [loadImageDelegate](#loadimagedelegate)
* [loadSmallImageDelegate](#loadsmallimagedelegate)

***

### title

タイトルの文字列を返却します。
```objc
@property (nonatomic, readonly, copy) NSString* title;
```

***

### descriptionText
説明文の文字列を返却します。
```objc
@property (nonatomic, readonly, copy) NSString* descriptionText;
```

***

### rating
レーティングを返却します。
```objc
@property (nonatomic, readonly, assign) float rating;
```

***

### cta
CTAボタンテキストの文字列を返却します。
```objc
@property (nonatomic, readonly, copy) NSString* cta;
```

***


### loadImageDelegate
バナー画像をNSDataで受け取るDelegateを設定してください。  
Delegateの詳細は[こちら](AdstirLoadImageDeledate-Protocol-Reference.md)をご覧ください。

```objc
@property (nonatomic, weak) id<AdstirLoadImageDeledate> loadImageDelegate;
```

***

### loadSmallImageDelegate
アイコン画像をNSDataで受け取るDelegateを設定してください。   
Delegateの詳細は[こちら](AdstirLoadSmallImageDeledate-Protocol-Reference.md)をご覧ください。
```objc
@property (nonatomic, weak) id<AdstirLoadSmallImageDeledate> loadSmallImageDelegate;
```

***


## Instance Methods
* [-bindImageToImageView:](#-bindimagetoimageview)
* [-bindImageToButton:](#-bindimagetobutton)
* [-getImageAsByte](#-getimageasbyte)
* [-bindSmallImageToImageView:](#-bindsmallimagetoimageview)
* [-bindSmallImageToButton:](#-bindsmallimagetobutton)
* [-bindOptoutImageToButton:](#-bindoptoutimagetobutton)
* [-getSmallImageAsByte](#-getsmallimageasbyte)
* [-click](#-click)
* [-clickOptout](#-clickOptout)
* [-impression](#-impression)

***

### -bindImageToImageView:
バナー画像をUIImageViewに対して設定します。
```objc
- (void)bindImageToImageView:(UIImageView *)imageView;
```
### Parameters
* _imageView_
    * バナー画像を設定するUIImageView

***

### -bindImageToButton:
バナー画像をUIButtonに対して設定します。
```objc
- (void)bindImageToButton:(UIButton *)button;
```

#### Parameters
* _button_
    * バナー画像を設定するUIButton

*** 

### -getImageAsByte
バナー画像のNSDataでの取得を要求します。
```objc
- (void)getImageAsByte;
```

***

### -bindSmallImageToImageView:
アイコン画像をUIImageViewに対して設定します。
```objc
- (void)bindSmallImageToImageView:(UIImageView *)imageView;
```

#### Parameters
* _imageView_
    * アイコン画像を設定するUIImageView

***

### -bindSmallImageToButton:
アイコン画像をUIButtonに対して設定します。
```objc
- (void)bindSmallImageToButton:(UIButton *)button;
```

#### Parameters
* _button_
    * アイコン画像を設定するUIButton

*** 

### -bindOptoutImageToButton:
iマーク画像をUIButtonに対して設定します。
```objc
- (void)bindOptoutImageToButton:(UIButton *)button;
```
#### Parameters
* _button_
    * iマーク画像を設定するUIButton

*** 


### -getSmallImageAsByte
アイコン画像のNSDataでの取得を要求します。
```objc
- (void)getSmallImageAsByte;
```

*** 

### -click
広告がクリックされた際clickメソッドを必ず呼び出してください。
このメソッドが呼び出されると、自動的にランディングページに遷移します。
```objc
- (void)click;
```

***

### -clickOptout
このメソッドが呼び出されると、自動的にオプトアウトページに遷移します。
```objc
- (void)click;
```

***

### -impression
広告の表示回数をカウントします。
このメソッドを呼び出さずにクリックメソッドを呼び出した場合、正常にクリック回数がカウントされない場合があります。
```objc
- (void)impression;
```

***