#  用途   
ansibleでMacの環境セットアップ  

# 事前準備  
## Xcodeのインストール  
$ sudo xcodebuild -license  

## Homebrewのインストール  
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  

## ansibleのインストール  
$ brew update  
$ brew install ansible

というかこれシェルスクリプトでいいじゃん。  

## dry-run  
$ ansible-playbook -i hosts mac.yml --ask-sudo-pass --check  

## run  
$ ansible-playbook -i hosts mac.yml --ask-sudo-pass   
