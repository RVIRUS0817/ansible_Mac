![スクリーンショット 2019-07-12 8 59 47](https://user-images.githubusercontent.com/5633085/61093278-b3c23b80-a484-11e9-974f-ca173732bc5d.png)

#  Used
Homebrew、application install & homedirectory

> please read my blog

https://blog.adachin.me/archives/5040

# LT

https://speakerdeck.com/rvirus0817/macwoansiblede-gou-cheng-guan-li-sitiyatutaohua

# My Environment


- iTerm2 color schema Japanesque
- zsh
- tmux/powerline
- peco/ghq (control + h(history),j(ssh)/repo


![ansible_mac](https://user-images.githubusercontent.com/5633085/84591635-05382f00-ae7b-11ea-9ac4-47041903c1c7.jpg)


# How to

## 1.fork run first.sh  
````
- Fork!!!!

- install xcode

$ ./scripts/first.sh
````

## 2.roles/homedirectory/files/
Please put it in the above directory such as .vimrc managed in the home directory and manage it.

## 3.group_vars/all
Insert the package you want to install with pip,homebrew,homebrew-tap,homebrew-cask,homedirectory

## 4.dry-run
````
$ ansible-playbook -i hosts mac.yml -KD -C
````

## 5.run
````
$ ansible-playbook -i hosts mac.yml -KD
````
## 6.reboot Mac

😎

## tag run

If you want to run each role after the second time, you can also run with tags.

- homebrew
```
$ ansible-playbook -i hosts mac.yml --tags homebrew -KD

```
- homebrew-cask
```
$ ansible-playbook -i hosts mac.yml --tags homebrew-cask -KD

```
- homedirectory
```
$ ansible-playbook -i hosts mac.yml --tags homedirectory -KD

```
