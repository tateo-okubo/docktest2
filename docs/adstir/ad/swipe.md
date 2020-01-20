# スワイプインタースティシャル広告の導入

縦表示アプリに全画面で表示できる広告の導入方法です。

## 1. adstir SDKをインポートします

```Objective-c tab=
@import AdstirAds;
```

```swift tab=
import AdstirAds
```

## 2. スワイプインタースティシャル広告のインスタンスを生成します

```Objective-c tab=
AdstirFullscreenView *adView = [[AdstirFullscreenView alloc] initWithView:self.view media:@"メディアID" spot:枠No];
```

```swift tab=
let adView = AdstirFullscreenView(view: self.view, media: メディアID, spot: 枠No)
```

## 3. スワイプインタースティシャル広告のデリゲートを設定します(オプション)

デリゲートをご利用される場合は、ページ下部の`広告の設置例`もご参考にしてください。

```Objectiv-c tab=
adView.delegate = self;
```

```swift tab=
adView?.delegate = self
```

## 4. スワイプインタースティシャル広告をviewに配置します

```Objectiv-c tab=
[self.view addSubview:adView];
```

```swift tab=
self.view.addSubview(adView!)
```

## 5. スワイプインタースティシャル広告の読み込みを開始します

スワイプインタースティシャル広告はバックグラウンドで読み込みを行えます。
スワイプインタースティシャル広告を表示させる前に読み込みを行なっておくことをオススメします。

```Objectiv-c tab=
[adView start];
```

```swift tab=
adView?.start()
```

## 広告の設置例

```Objective-c tab=
#import "ViewController.h"
@import AdstirAds;

@interface ViewController () <AdstirMraidViewDelegate>

@property (retain) AdstirFullscreenView *adstir;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *media = @"メディアID";
    NSUInteger spot = 枠No;

    // スワイプインタースティシャル広告のインスタンスを生成します
    AdstirFullscreenView *adView = [[AdstirFullscreenView alloc] initWithView:self.view media:media spot:spot];

    // スワイプインタースティシャル広告のデリゲートを設定します(オプション)
    adView.delegate = self;

    // スワイプインタースティシャル広告をViewに配置します
    [self.view addSubview:adView];
    self.adstir = adView;

    // スワイプインタースティシャル広告の読み込みを開始します
    [adView start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    // デリゲートを解放します。解放を忘れるとクラッシュする可能性があります。
    self.adstir.delegate = nil;
    // 広告ビューを解放します。
    self.adstir = nil;
}

// スワイプインタースティシャル広告のでDelegate(オプション)
#pragma mark AdstirMraidViewDelegate methods

- (void)adstirMraidViewWillLeaveApplication:(AdstirFullscreenView *)mraidView
{
    NSLog(@"広告がタップされてアプリから離れました");
}

@end
```

```swift tab=
import UIKit
import AdstirAds

class ViewController: UIViewController {
    
    var adView: AdstirFullscreenView? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let media = "メディアID";
        let spot = 枠No;
        
        adView = AdstirFullscreenView(view: self.view, media: media, spot: UInt(spot))
        
        self.view.addSubview(adView!)
        adView?.start()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
```

## ライブラリ詳細

[APIリファレンス](../api/index.md#スワイプインタースティシャル広告)をご覧ください。