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
・peco/ghq (control + h(history),j(ssh)/repo   

![2018-04-05 14 08 57](https://user-images.githubusercontent.com/5633085/38348117-ee9d3c4e-38da-11e8-9a9e-6d40173133a2.png)


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

## 2.group_vars/all
Insert the package you want to install with homebrew,homebrew-cask,homedirectory

## 3.dry-run
````
$ ansible-playbook -i hosts mac.yml -KD -C
````

## 4.run
````
$ ansible-playbook -i hosts mac.yml -KD
````
## 5.reboot Mac

