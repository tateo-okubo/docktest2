# AdstirLoadImageDeledate Protocol Reference

ネイティブ広告のデリゲートです。  
AdstirLoadImageDeledateのメソッドはすべてバックグラウンドスレッドで動作します。  
UIを操作する場合は[performSelectorOnMainThread:withObject:waitUntilDone:](http://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSObject_Class/Reference/Reference.html#//apple_ref/occ/instm/NSObject/performSelectorOnMainThread:withObject:waitUntilDone:)や[dispatch_sync(dispatch_get_main_queue(), ^(void){});](http://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man3/dispatch_get_main_queue.3.html)を利用してください。

## Instance Methods
* [-adstirDidLoadImage:](#-adstirdidloadimage)
* [-adstirDidFailToLoadImage](#-adstirdidfailtoloadimage)

***

### -adstirDidLoadImage:
バナー画像が読み込まれた際に呼ばれます。バナー画像はNSData型で受け取ります。

```objc
- (void)adstirDidLoadImage:(NSData *) data;
```

#### Parameters
* _data_
    * バナー画像

***

### -adstirDidFailToLoadImage
バナー画像の読み込みに失敗した際に呼ばれます。

```objc
- (void)adstirDidFailToLoadImage;
```

***