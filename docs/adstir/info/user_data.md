# ユーザデータアクセス許可に関する設定

ユーザデータにアクセスするライブラリをご利用される場合、`Info.plist`ファイルに使用理由を記載する必要があります。  
利用するライブラリに対する、`Info.plist`ファイルのキーと記載例を記載しておりますのでご参考にしてください。

## CoreLocation.framework

キー | 内容 | 記載例
---|---|---
NSLocationAlwaysUsageDescription | 位置情報への持続的アクセス | 適切な広告を表示するために位置情報を利用します。
NSLocationWhenInUseUsageDescription | アプリ使用中の位置情報へのアクセス | 適切な広告を表示するために位置情報を利用します。

## CoreMotion.framework

キー | 内容 | 記載例
---|---|---
NSMotionUsageDescription | 加速度計へのアクセス | 高品質な広告を提供するために加速度計を利用します。