# ネイティブ広告の導入

コンテンツにマッチしたレイアウトで掲載できるネイティブ広告の導入方法です。

## 広告の設置

### Viewの作成

Viewの作成に関しては、ご自由に実装して頂いて構いません。  
実装方法に制限はありません。ただし、作成したViewは、[ネイティブ広告ガイドライン](https://github.com/united-adstir/AdStir-Integration-Guide-Web/wiki/%E3%83%8D%E3%82%A4%E3%83%86%E3%82%A3%E3%83%96%E5%BA%83%E5%91%8A%E3%82%AC%E3%82%A4%E3%83%89%E3%83%A9%E3%82%A4%E3%83%B3)に従っている必要があります。　　

### 広告の取得

viewDidLoad等で広告のリクエストおよびレスポンスの処理を設定します。  
このコードは実装の全体をつかむためのサンプルですので、この通りに実装しても動作しません。  
実際に広告を実装する際は、ライブラリ詳細の項目をよく確認して必要なパラメータの設定及び処理を記述する必要があります。  
各メソッドの詳細は[APIリファレンス](../../api/index.md#ネイティブ広告)をご覧ください。

```objective-c tab=
#import "FooViewController.h"
@import AdstirAds;

@interface FooViewController () <AdstirNativeAdDelegate>
@property (strong, nonatomic) AdstirNativeAd* nativead;
@property (strong, nonatomic) AdstirNativeAdResponse* nativeadResponse;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *sponsoredLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIButton *ctaButton;
@property (weak, nonatomic) IBOutlet UIButton *optoutButton;
@end

@implementation FooViewController
- (void)viewDidLoad {
	[super viewDidLoad];
	// インスタンス生成
	self.nativead = [[AdstirNativeAd alloc] init];
	self.nativead.media = @"メディアID";
	self.nativead.spot = 枠No;

	// ガイドラインで規定されているスポンサー表記を実装した通りに設定してください
	self.nativead.sponsoredText = @"スポンサー表記";
	// 広告枠登録時に設定した広告要素が配信されます

	// 広告レスポンスを受け取るDelegateを設定します
	self.nativead.delegate = self;

	// ネイティブ広告を読み込みます
	[self.nativead getAd];
}

/* Delegateを実装 ここから */
- (void)adstirNativeAdDidReceiveAd:(AdstirNativeAd*)ad response:(AdstirNativeAdResponse*)response{
	// 広告レスポンスが正常に取得できた時に行う処理を実装します
	// AdstirNativeAdDelegateのメソッドはすべてバックグラウンドスレッドで動作します
	self.nativeadResponse = response;
	dispatch_sync(dispatch_get_main_queue(), ^(void){
		// タイトルを設定します。
		self.titleLabel.text = response.title;
		// 説明文を設定します
		self.textLabel.text = response.descriptionText;
		// 広告であることを表示します
		self.sponsoredLabel.text = ad.sponsoredText;
		// CTAボタンにCTAテキストを設定します
		[self.ctaButton setTitle:response.cta forState:UIControlStateNormal];
		// アイコン画像をImageViewに設置します
		[response bindSmallImageToImageView:self.iconView];
		// バナー画像をImageViewに設置します
		[response bindImageToImageView:self.imageView];
		// オプトアウトボタンにオプトアウト画像を設定できます。
		[response bindOptoutImageToButton:self.optoutButton];
	});
	// 広告を表示するときにimpressionを呼び出します
	[response impression];
}

- (void)adstirNativeAdDidFailToReceiveAd:(AdstirNativeAd*)ad{
	// 広告レスポンスが正常に取得できなかった時に行う処理を実装します
	// AdstirNativeAdDelegateのメソッドはすべてバックグラウンドスレッドで動作します

}
/* Delegateを実装 ここまで */

- (IBAction)adClick:(id)sender {
	// 広告がクリックされたときはclickを呼び出します
	[self.nativeadResponse click];
}

- (IBAction)optoutClick:(id)sender {
    // オプトアウトボタンがクリクされた時はclickOptoutを呼び出します
    [self.nativeadResponse clickOptout];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (void)dealloc {
	// デリゲートを解放します。
	self.nativead.delegate = nil;
	self.nativead = nil;
	self.nativeadResponse = nil;
}
@end
```

```swift tab=
import UIKit
import AdstirAds;

class ViewController: UIViewController, AdstirNativeAdDelegate {
    
    var nativead: AdstirNativeAd?
    var nativeadResponse: AdstirNativeAdResponse?
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var sponsoredLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var iconView: UIImageView!
    @IBOutlet var ctaButton: UIButton!
    @IBOutlet var optoutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // インスタンス生成
        self.nativead = AdstirNativeAd()
        self.nativead?.media = "メディアID"
        self.nativead?.spot = 枠No
        
        // ガイドラインで規定されているスポンサー表記を実装した通りに設定してください
        self.nativead?.sponsoredText = "スポンサー表記"
        // 広告枠登録時に設定した広告要素が配信されます

        // 広告レスポンスを受け取るDelegateを設定します
        self.nativead?.delegate = self

		// ネイティブ広告を読み込みます
        self.nativead?.getAd()
    }

    // MARK: AdstirNativeAdDelegateの実装
    func adstirNativeAdDidReceive(_ nativeAd: AdstirNativeAd, response: AdstirNativeAdResponse) {
        // 広告レスポンスが正常に取得できた時に行う処理を実装します
        // AdstirNativeAdDelegateのメソッドはすべてバックグラウンドスレッドで動作します
        self.nativeadResponse = response
        DispatchQueue.main.async {
            // タイトルを設定します。
            self.titleLabel.text = response.title;
            // 説明文を設定します
            self.textLabel.text = response.descriptionText;
            // 広告であることを表示します
            self.sponsoredLabel.text = nativeAd.sponsoredText;
            // CTAボタンにCTAテキストを設定します
            self.ctaButton.setTitle(response.cta, for: .normal)
            // アイコン画像をImageViewに設置します
            response.bindSmallImage(to: self.iconView)
            // バナー画像をImageViewに設置します
            response.bindImage(to: self.imageView)
            // オプトアウトボタンにオプトアウト画像を設定できます。
            response.bindOptoutImage(to: self.optoutButton)
        }
        
        // 広告を表示するときにimpressionを呼び出します
        response.impression()
    }
    
    func adstirNativeAdDidFail(toReceive nativeAd: AdstirNativeAd) {
        // 広告レスポンスが正常に取得できなかった時に行う処理を実装します
        // AdstirNativeAdDelegateのメソッドはすべてバックグラウンドスレッドで動作します
    }
    
    // MARK: ボタンの実装
    @IBAction func adClick(sender:AnyObject) {
        // 広告がクリックされたときはclickを呼び出します
        self.nativeadResponse?.click()
    }
    
    @IBAction func optoutClick(sender:AnyObject) {
        // オプトアウトボタンがクリクされた時はclickOptoutを呼び出します
        self.nativeadResponse?.clickOptout()
    }
}
```

## ライブラリ詳細

[APIリファレンス](../../api/index.md#ネイティブ広告)をご覧ください。
