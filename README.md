# Amazon Linux WSL Setup

## Intro
An automated script to create Amazon Linux 2023 to be used in Windows WSL subsystem with predefined packages in Dockerfile. 


## Preparation

### Install and setup WSL 2 on Windows

**Note:This is one-time process if WSL is not activated**

Run in a commandline (requires elevated privileges)

```bash
wsl --install
wsl --set-default-version 2
```
Complete setup by creating new Username and password for Ubuntu. 
After installation a reboot is needed. This installs ubuntu by default.
After reboot open Powershell and type 
```bash
wsl
```
This will start Ubuntu by default. Exit the bash using **exit** command



### Setup Powershell
To permit executing powershell script , run following command using Powershell as admin

```bash
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```
**OR**

```bash
 Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```




### Setup Amazon Linux as WSL instance for Developement

####  Setup not using Docker Desktop

This will create and mount new image of Amazon Linux 2023 on WSL and set it by default. You need to run it only once, unless you want new image.

- Open powershell in root diretory of this repo
- Open Ubuntu using **wsl** command ( go to root diretory of this repo ) 
- Type **sed -i -e 's/\r$//' Linux_scripts/Ubuntu/createAmazonLinux.sh** and then **exit** to exit Ubuntu
- 
From the root directory of this repo run
```bash
 .\PowershellScript\createAmazonLinux.ps1
```
Enter password for Ubuntu when prompted.

.

To use AmazonLinux, type simply **wsl** or **wsl -d AmazonLinux** in powershell window.

To know which packages are installed in Amazon Linux , please refer **Dockerfile**

### Configure Amazon Linux

#### Setup git
Git operations (clone, pull, push) on the source code require to do that inside of the linux instance. Otherwise there might be issues caused by line ending differences between Linux and Windows.

