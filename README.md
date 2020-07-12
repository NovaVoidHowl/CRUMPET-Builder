# 'CRUMPET' builder, an APK builder project for the Tail Company android app

---

## **NOTE**  

``` text
This project is not made by, or endorsed by Tail Company.
It is simply a project made by a fan of their products.

The Tail Company git project this one references can be found
at the following link.
```

 <https://github.com/MasterTailer/CRUMPET>

---

## Shoutouts

Thanks to Leinir (<https://github.com/leinir>) for their help debugging the cmake commands used in this project

---

### APK build

#### Requirements

System:

6 to 8 GB of disk space

Installed programs:

- docker

#### How to use

_note_ These scripts can take a while depending on your internet connection and speed of computer

To use this build environment.  

- First run the ```build_apk_builders.sh``` script, this will make two docker images based off the kde org android build docker images  

- Then run the ```build_apks.sh ~/myapks``` script, this will drop builds of the apks 32 and 64 bit in the defined directory (in this case '~/myapks')

---

### Sending to your android device

#### Requirements

Installed programs:

- adb

#### How to install APK

On your phone/tablet  

- go to the settings menu
- go to system
- go to about
- tap on the build section until it says you have enabled developer features
- go back to system then, go to 'developer options'
- enable 'USB debugging'
- enable 'ADB over network' (take note of the port and ip, if this option is not present you will have to connect the device to your computer with a usb wire)

On your computer (if android device has ADB over network)

- start adb in network mode  
  ``` adb connect <ip of android>:<port of android> ```

On your computer (if android device does not have ADB over network)

- start adb and check if device connects with  
  ``` adb shell ```

On your phone/tablet

- allow the adb connection

Back on the computer

- check the device showed up with
  ```adb devices```
- push the apk of your choice to the  with  
  ```adb install -r -g <path to apk>```

Back on the phone/tablet

- go to the settings menu
- go to system
- go to 'developer options'
- disable 'USB debugging'
