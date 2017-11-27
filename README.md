#  用途
ansibleでMacの環境セットアップ  
Homebrew、アプリケーションインストール自動化&ホームディレクトリに必要なものも全て管理
>以下ブログより  
https://blog.adachin.me/wordpress/archives/5040

# 事前準備
## 1.git clone/fork ansible_Mac/Xcodeのインストール
````
$ git clone https://github.com/RVIRUS0817/ansible_Mac.git

※git clone時にxcodeもインストールされるので以下のコマンドは必要ないかも。
$ sudo xcodebuild -license
````

## 2.Homebrewのインストール
````
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
````

## 3.ansibleのインストール
````
$ brew update
$ brew install ansible
````

# 各パッケージ、アプリケーションの変更
## 1.roles/homedirectory/files/
ホームディレクトリで管理している.vimrcなど上記のディレクトリに置いて管理してください。

## 2.roles/homebrew/tasks/main.yml
homebrewでインストールしたいパッケージを挿入

## 3.3.3.roles/homebrew-cask/tasks/main.yml
homebrew-caskでインストールしたいアプリケーションを挿入

## 4.dry-run
````
$ ansible-playbook -i hosts mac.yml --ask-sudo-pass --check
````

## 5.run
````
$ ansible-playbook -i hosts mac.yml --ask-sudo-pass
````
## 6.Mac再起動

