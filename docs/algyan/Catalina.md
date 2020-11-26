# macOS Catalina以降への対応について

既に述べたとおり、macOS Catalina以降ではUSBイーサネットのうちECMモードが無効となっています。一方、Jetson nano/JetBotはECMモード以外にNCMモードも使用することが可能ですので、設定ファイルを書き換えてから再起動することでこれまで通りの利用が可能になります。

## 作業手順について

作業手順は[NVIDIA開発者フォーラムの記事](https://forums.developer.nvidia.com/t/ssh-into-jetson-nano-through-mac-os-catalina/83405)で解説されています。誤りと思われる部分を修正し、一部手順を追加したものを下記に日本語で掲載しておきます。

### 作業手順（日本語訳 + グリーンノート加筆）

* macとJetBotをUSBケーブルで接続する
  * JetBotのマイクロUSB端子とmacのUSB端子（必要に応じてアダプタ使用）を接続してください。
* JetBotが接続されているポートを確認する

  ```sh
  $ ls /dev/tty.usb*
  /dev/tty.usbmodem123456 （番号はそれぞれ異なります）
  ```

* screenなどのターミナルソフトを使い、上で確認したポートに115,200bpsで接続する

  ```sh
  $ screen /dev/tty.usbmodem123456 115200
  Ubuntu 18.04.2 LTS jetbot ttyGS0
  jetbot- login: （ユーザー　jetbot / パスワード　jetbot でログイン）
  ```

* viなどのエディタを用いて`/opt/nvidia/l4t-usb-device-mode/nv-l4t-usb-device-mode.sh`を編集する
  * 変更点(1)
      `func=functions/ecm.usb0`
      を
      `func=functions/ncm.usb0`
      に変更
  * 変更点(2)　**書き換え箇所が2つあるので注意！**
      `/sbin/brctl addif l4tbr0 “(cat functions/ecm.usb0/ifname)" /sbin/ifconfig "(cat functions/ecm.usb0/ifname)” up`
      を
      `/sbin/brctl addif l4tbr0 “(cat functions/ncm.usb0/ifname)" /sbin/ifconfig "(cat functions/ncm.usb0/ifname)” up`
      に変更

これで再起動すればmacOS Catalina以降でもJetBotをUSB経由でネットワーク接続することが可能になります。

## 追記

上記の変更作業は必ずしもmacOS Catalinaそのもので実行する必要はありません。もしそれ以外の作業用PCを確保出来るのであれば、そのPCとJetBotをUSB経由でネットワーク接続すればSSHが使えますので、より作業が簡単になるかと思います。この辺はお使いの環境に合わせて進めてください。

-----

以上
