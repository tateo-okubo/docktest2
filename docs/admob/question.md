# よくある質問

## アプリケーション起動時にクラッシュしてしまう

Info.plistにAdMobアプリIDを記述しなければアプリケーション起動時にクラッシュいたします。
[こちら](https://developers.google.com/admob/ios/quick-start?hl=ja#update_your_infoplist)を参考にInfo.plistの更新をお願いします。

## アプリケーションのビルドに失敗してしまう

```
Undefined symbols for architecture arm64:
  "_OBJC_CLASS_$_GADMediatedUnifiedNativeAdNotificationSource", referenced from:
      objc-class-ref in libAdMobMediationAdapter-AdstirAds.a(libAdMobMediationAdapter-AdstirAds.a)
```

上記のようなエラーメッセージの場合、GoogleMobilAds SDKのバージョンが古い可能性がございます。
GoogleMobilAds SDKのバージョンが[こちら](index.md#事前準備)に書かれているバージョンよりも新しいことを確認してください。

## 広告の読み込みに失敗してしまう

アプリケーションをリリースする前に同じ端末等のみで広告を読み込み続けた場合、広告配信が停止してしまう可能性がございます。
[テストデバイスを追加する](https://developers.google.com/admob/ios/test-ads#add_your_test_device)より、広告リクエスト時にデバイスIDの設定をおこなってください。
こちらの設定をおこなった際には、アプリケーションのリリース前には該当コードの削除をお願いいたします。
