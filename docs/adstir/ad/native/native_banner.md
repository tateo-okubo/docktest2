# ネイティブライクバナー

## 一般的な掲載方法

ネイティブライクバナーは、簡単に掲載することが可能です。  
アプリ内でテンプレートに合ったサイズのWebViewを作成していただき、そこに管理画面で取得できるタグを記述したHTMLファイルを表示するだけです。  
なお、綺麗なサイズで表示するためには、marginやpaddingを初期化する必要があります。

```HTML
<style type="text/css">
html,body { margin:0; padding:0 } /* marginとpaddingを0に */
</style>
<script type="text/javascript">
var adstir_vars = {
  ver: "4.0",
  type: "native",
  app_id: "MEDIA-aeeaa332",
  ad_spot: 3,
  async: false,
};
</script>
<script type="text/javascript" src="https://js.ad-stir.com/js/adstir_native.js"></script>
```

## バナーサイズのリサイズ

ネイティブライクバナーは、自由にリサイズをすることが可能です。  
下記の様に、幅とスケールを指定することで、基本サイズ(テンプレート選択画面に記載)からリサイズできます。

```HTML
<style type="text/css">
html,body { margin:0; padding:0 } /* marginとpaddingを0に */
#adstir_native_widget_wrapper {
    width: 150px;
    height: 100px;
}
#adstir_native_widget {
    transform: scale(0.5);
    -webkit-transform: scale(0.5); /* 古いバージョンのOSに対応させる場合に必須 */
}
</style>
<script type="text/javascript">
var adstir_vars = {
  ver: "4.0",
  type: "native",
  app_id: "MEDIA-aeeaa332",
  ad_spot: 3,
  async: false,
};
</script>
<script type="text/javascript" src="https://js.ad-stir.com/js/adstir_native.js"></script>
```

## IDFA（Advertising Identifier）の使用

アプリに掲載する広告は、広告識別子を送信することでさらなる収益化が可能になる場合があります。 

広告識別子の取得方法は、下記取得サンプルと、[公式ドキュメント(英語)](https://developer.apple.com/library/ios/documentation/AdSupport/Reference/ASIdentifierManager_Ref/)をご覧下さい。

```swift tab=
// AdSupport.frameworkが必要です
import AdSupport
...
let identifierManager = ASIdentifierManager()
if(identifierManager.isAdvertisingTrackingEnabled) {
    let idfa = identifierManager.advertisingIdentifier
}
```

```objective-c tab=
// AdSupport.frameworkが必要です
@import AdSupport;
...
ASIdentifierManager *identifierManager = [ASIdentifierManager sharedManager];
if ([identifierManager isAdvertisingTrackingEnabled]) 
    NSString *idfa = identifierManager.advertisingIdentifier.UUIDString;
}
```


HTMLを生成する際に`{{ここに広告識別子を書き出す}}`の部分を、取得した広告識別子で置換してください。なお、広告識別子は、IDFAの使用に記載の通り、オプトアウトされている場合の利用が制限されております。下記コードのコメントに記載の通り、適切な対応をお願い致します。 

```HTML
<style type="text/css">
html,body { margin:0; padding:0 } /* marginとpaddingを0に */
</style>
<script type="text/javascript">
var adstir_vars = {
  ver: "4.0",
  type: "native",
  app_id: "MEDIA-aeeaa332",
  ad_spot: 3,
  async: false,
  lmt: false, // ユーザーがオプトアウトしている場合は、trueを設定してください
  id: "apple", // 広告識別子の種類(Apple - IDFA)
  uid: "{{ここに広告識別子を書き出す}}", // 広告識別子
};
</script>
<script type="text/javascript" src="https://js.ad-stir.com/js/adstir_native.js"></script>
```


## よくある質問

### User−Agentの変更について

User-Agentを標準のものから変更された場合、正常に広告は配信されません。

独自のUser-Agentをご利用になられる場合には、既存のUser-Agentの末尾に、文字列を追加して頂くようにお願い致します。

例：
Mozilla/5.0 (iPhone; CPU iPhone OS 10_0_1 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) Mobile/14A403 **AdStir-IOS com.ad-stir.appli/2.7.2** <- 太字部分を追加
