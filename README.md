# ansible_Mac

![2018-03-26 13 25 29](https://user-images.githubusercontent.com/5633085/37886882-2bb49378-30f9-11e8-8e90-b305484ed28d.png)

##  Used
ansible Mac
Homebrew、application install & homedirectory
> please my blog

https://blog.adachin.me/wordpress/archives/5040

## My Environment

・nvim/dein.vim  
・zsh  
・tmux/powerline  

![2018-04-05 13 52 03](https://user-images.githubusercontent.com/5633085/38347784-8c831c88-38d8-11e8-9f96-724292627670.png)

## Preparation

## 1.git clone/fork ansible_Mac/Xcode install
````
$ git clone https://github.com/RVIRUS0817/ansible_Mac.git or Fork
$ sudo xcodebuild -license
````

## 2.Homebrew install
````
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
````

## 3.ansible install
````
$ brew update
$ brew install ansible
````

## change application

## 1.roles/homedirectory/files/
Please put it in the above directory such as .vimrc managed in the home directory and manage it.

## 2.roles/homebrew/tasks/main.yml
Insert the package you want to install with homebrew

## 3.roles/homebrew-cask/tasks/main.yml
Insert the application you want to install with homebrew-cask

## 4.dry-run
````
$ ansible-playbook -i hosts mac.yml --ask-sudo-pass --check
````

## 5.run
````
$ ansible-playbook -i hosts mac.yml --ask-sudo-pass
````
## 6.reboot Mac

