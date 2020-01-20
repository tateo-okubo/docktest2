# Amazonモバイル広告の導入

## 対応OS

iOS 8.0以降

## SDKの準備

バンドル版の入手は、担当または[お問い合わせフォーム](https://ja.ad-stir.com/contact "お問い合わせフォーム")よりご連絡ください。

## プロジェクトへのSDKの追加

1. `AmazonAds.framework`、`libAdstirAdsMediationAdapter-Amazon.a`を、プロジェクト内の任意の箇所にドラッグ&ドロップします。
1. `Copy items if needed`にチェックを入れます。
1. `Add to targets`欄で、AdStir SDKを利用するすべてのターゲットにチェックを入れます。
1. `Finish`をクリックします。

## ビルド設定の変更

1. プロジェクトファイル設定画面を開きます。
1. 動画広告を組み込むビルドターゲットを選択します。
1. **Build Target**タブを選択します。
1. 画面右側の検索窓に**Other Linker Flags**と入力し、検索します。
1. **Other Linker Flags**欄に、**-ObjC**と設定します。  
Amazonモバイル広告を利用するためには、この設定が必須となり、設定がされていない場合は、案件切れ扱いとなってしまいます。
1. 組み込む対象の全てのビルドターゲットに、同じ設定を行います。  
もしくは、この設定はプロジェクト単位で設定することも可能です。

## 依存Framework/Libraryの追加

名前|ステータス
----|----
CoreLocation.framework|Required
EventKit.framework|Required
EventKitUI.framework|Required
JavaScriptCore.framework|Required

`CoreLocation.framework`を追加しても、エンドユーザー様に無断で位置情報を取得することはございません。

## Info.plistの変更

EventKit.frameworkをリンクする場合、XCode8以降でビルドしたアプリを申請する際に、`Info.plistにPrivacy - Calendars Usage Description(NSCalendarsUsageDescription)`キーを追加し、使用理由を説明する必要があります。  
Amazonモバイル広告を利用される場合はInfo.plistに下記の記述をお願いいたします。
```xml
<key>NSCalendarsUsageDescription</key>
<string>APP would like to schedule events on your calendar.</string>
```