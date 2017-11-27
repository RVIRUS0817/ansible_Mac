#  用途
ansibleでMacの環境セットアップ  
ホームディレクトリに必要なものも全て管理
>以下ブログより  
https://blog.adachin.me/wordpress/archives/5040

# 事前準備
## git clone/fork ansible_Mac/Xcodeのインストール
````
$ git clone https://github.com/RVIRUS0817/ansible_Mac.git

※git clone時にxcodeもインストールされるので以下のコマンドは必要ないかも。
$ sudo xcodebuild -license
````

## Homebrewのインストール
````
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
````

## ansibleのインストール
````
$ brew update
$ brew install ansible
````

# 各パッケージ、アプリケーションの変更
## roles/homedirectory/files/
ホームディレクトリで管理している.vimrcなど上記のディレクトリに置いて管理してください。

## roles/homebrew/tasks/main.yml
homebrewでインストールしたいパッケージを挿入

## roles/homebrew-cask/tasks/main.yml
homebrew-caskでインストールしたいアプリケーションを挿入

## dry-run
````
$ ansible-playbook -i hosts mac.yml --ask-sudo-pass --check
````

## run
````
$ ansible-playbook -i hosts mac.yml --ask-sudo-pass
````

