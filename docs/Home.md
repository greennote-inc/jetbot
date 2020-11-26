# グリーンノート　AI自動運転カー学習キット

グリーンノートAI自動運転カー学習キットの情報を集めたサイトです。
何か問題がありましたらお知らせください。 [（Issueに移動）](https://github.com/greennote-inc/jetbot/issues)!

## 留意事項

本Wikiの内容は、NVIDIAが提供するオリジナルJetbotの内容を参考に、株式会社グリーンノートが日本語訳、および独自のコンテンツを追加するなどの変更を行ったものです。

## 重要な注意事項

**macOS Catalina以降をご利用の方は必ずお読みください。**

macOS CatalinaからUSBを利用したEhternetの仕様が変更になり、NVIDIAが提供するJetBotソフトウェアに使用されているECMモード（Ethernet Connection Model)が無効となり、より新しい規格（Ethernet以外の通信方式にも対応）であるNCMモード（Network Connection Model）を利用することになりました。このため、macOS Catalina以降をお使いの場合は一部の設定手順が変更となりますので、作業の際はこの資料を注意深く読んでください。

## はじめに

> まず最初に [Getting Started with Jetson Nano Developer Kit](https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit) を読んでおくと良いでしょう。Jetson nanoの標準的な使い方を知ることができます。

時間に余裕があれば、[紹介動画](https://bit.ly/GreennoTube)を見ておくことをお勧めします。

下記の手順に従ってALGYANオリジナルJetbotを準備してください。

1. ALGYANオリジナルJetbot Kitを [入手する](https://jetbot.algyan.biz)
2. キットの[組み立て](Hardware-Setup.md)
3. ソフトウェアの[セットアップ](Software-Setup.md)
4. [事例集](Examples.md)を試してみる

### ALGYAN Jetbotとの関わり方

質問、示唆などは

* [issue](https://github.com/greennote-inc/jetbot/issues)を起票する

### お役立ち

* [NVIDIA オリジナルjetbot](https://github.com/NVIDIA-AI-IOT/jetbot)
* [jetbot_ros - Robot Operating System (ROS) port](https://github.com/dusty-nv/jetbot_ros)
