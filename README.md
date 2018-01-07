# ansible_Mac

##  Used  
ansible Mac  
Homebrew、application install & homedirectory
> please my blog 
https://blog.adachin.me/wordpress/archives/5040

## Preparation  

## 1.git clone/fork ansible_Mac/Xcode install  
````
$ git clone https://github.com/RVIRUS0817/ansible_Mac.git
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
