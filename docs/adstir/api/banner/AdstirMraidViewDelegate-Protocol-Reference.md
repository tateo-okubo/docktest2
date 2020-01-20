# AdstirMraidViewDelegate Protocol Reference

バナー広告とスワイプインタースティシャル広告のデリゲートです。

## Instance Methods
* [-adstirMraidViewWillPresentScreen:](#-adstirmraidviewwillpresentscreen)
* [-adstirMraidViewDidPresentScreen:](#-adstirmraidviewdidpresentscreen)
* [-adstirMraidViewWillDismissScreen:](#-adstirmraidviewwilldismissscreen)
* [-adstirMraidViewWillLeaveApplication:](#-adstirmraidviewwillleaveapplication)

***

### -adstirMraidViewWillPresentScreen:
エキスパンド広告が表示される前に呼び出されます。

```objc
- (void)adstirMraidViewWillPresentScreen:(AdstirMraidView *)mraidView;
```

#### Parameters
* _mraidView_
    * バナー広告

***

### -adstirMraidViewDidPresentScreen:
エキスパンド広告が表示された後に呼び出されます。

```objc
- (void)adstirMraidViewDidPresentScreen:(AdstirMraidView *)mraidView;
```

#### Parameters
* _mraidView_
    * バナー広告

***

### -adstirMraidViewWillDismissScreen:
エキスパンド広告が閉じられる前に呼び出されます。

```objc
- (void)adstirMraidViewWillDismissScreen:(AdstirMraidView *)mraidView;
```

#### Parameters
* _mraidView_
    * バナー広告

***

### -adstirMraidViewWillLeaveApplication:
広告がクリックされ、遷移する前に呼び出されます。
`スワイプインタースティシャル広告はこちらのDelegateのみ呼び出されます。`

```objc
- (void)adstirMraidViewWillLeaveApplication:(AdstirMraidView *)mraidView;
```

### Parameters
* _mraidView_
    * バナー広告

***

