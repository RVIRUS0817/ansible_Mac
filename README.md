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

![2018-09-20 23 37 48](https://user-images.githubusercontent.com/5633085/45825886-38916c80-bd2e-11e8-83ff-7fd3bb51b12c.jpg)


## Preparation

## 1.git clone/fork run first.sh  
````
$ git clone https://github.com/RVIRUS0817/ansible_Mac.git or Fork
$ ./scripts/first.sh
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

😎
