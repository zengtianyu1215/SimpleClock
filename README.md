![Title](https://raw.githubusercontent.com/zengtianyu1215/SimpleClock/master/SamplePic/Screen%20Shot%202018-01-26%20at%2016.25.36-7.jpg)
# SimpleClock
### TabletClock is for Android & SimpleClock is for macOS
[![GitHub release](https://img.shields.io/github/release/zengtianyu1215/SimpleClock.svg)](https://github.com/zengtianyu1215/SimpleClock/releases)
[![Language](https://img.shields.io/badge/language-swift-orange.svg)](https://github.com/zengtianyu1215/SimpleClock)
[![GitHub top language](https://img.shields.io/github/languages/top/zengtianyu1215/SimpleClock.svg)](https://github.com/zengtianyu1215/SimpleClock)
[![license](https://img.shields.io/github/license/zengtianyu1215/SimpleClock.svg)]()
[![GitHub forks](https://img.shields.io/github/forks/zengtianyu1215/SimpleClock.svg?style=social&label=Fork&style=flat-square)]()
[![GitHub stars](https://img.shields.io/github/stars/zengtianyu1215/SimpleClock.svg?style=social&label=Stars&style=flat-square)]()
<br>

## Abstract

SimpleClock, SC in short, is a macOS application which can bring basic time functions but with better user experience. This app is fully built with Swift 3.0 in Xcode on High Sierra platform. 
<br>

## Function
### 1. Time Showing
Because macOS doesn't have an application called "Clock", each time I called Siri to show me the time in Guangzhou or other places, I find it hard to make the robot to understand "Guangzhou" but not "Guam Joe". So, I built this app for time showing.
This app is of the latest design of Apple on Mac, such as Blurry Background, Multi-Touch Bar, etc.. And I make it into this app.

![avatar](https://raw.githubusercontent.com/zengtianyu1215/SimpleClock/master/SamplePic/Screen%20Shot%202018-01-26%20at%2016.18.43.png)
<center>Light Blurry Background of SimpleClock</center>

![avatar](https://raw.githubusercontent.com/zengtianyu1215/SimpleClock/master/SamplePic/Screen%20Shot%202018-01-26%20at%2016.18.36.png)
<center>Dark Blurry Background of SimpleClock</center>

SimpleClock can change between Hour-Minute Mode and Hour-Minute-Second Mode by clicking the time. And you can also change it by switching the toggle on your Macbook Pro Multi-Touch Bar. You can change the theme by clicking the upper-right corner of the window. What's more, you can also change the 12/24H with your touch bar.

### 2. Timer & Stopwatch
Because the Timer and Stopwatch are also important in our daily life, SimpleClock will make them in the future. The pictures of Timer and Stopwatch are here:
<br>

![avatar](https://raw.githubusercontent.com/zengtianyu1215/SimpleClock/master/SamplePic/Screen%20Shot%202018-01-26%20at%2016.16.48.png)
<center>Stopwatch in SimpleClock</center>

![avatar](https://raw.githubusercontent.com/zengtianyu1215/SimpleClock/master/SamplePic/Screen%20Shot%202018-01-27%20at%2014.59.20.png)
<center>Timer in SimpleClock</center>

And in Timer, I designed a Progressbar to show the position of the time. What's more, if you input the time like 100 seconds, the Timer will correct the mistake automatically. 
These functions can be called by clicking SimpleClock->Timer or SimpleClock->Stopwatch. These windows are also with the design features. You can use it as your working timer or life stopwatch.
<br>

### 3. Fullscreen
When you toggle the fullscreen, the app will become a locker-like application. And this make your MBP into a "Big iPad".
<br>

![avatar](https://raw.githubusercontent.com/zengtianyu1215/SimpleClock/master/SamplePic/Screen%20Shot%202018-01-26%20at%2016.16.35-2.jpg)
<center>SimpleClock in Fullscreen Mode</center>

![avatar](https://raw.githubusercontent.com/zengtianyu1215/SimpleClock/master/SamplePic/Screen%20Shot%202018-01-26%20at%2016.16.56-4.jpg)
<center>Timer/Stopwatch in Fullscreen Mode</center>

### 4. Multi-Touch Bar Function
As an application designed on High Sierra, SimpleClock provides several Touch Bar functions. With Multi-Touch Bar, we can give some settings to the app. 
<br>

![avatar](https://raw.githubusercontent.com/zengtianyu1215/SimpleClock/master/SamplePic/Touch%20Bar%20Shot%202018-01-27%20at%2014.58.33.png)
<center>Clock Touch Bar</center>

![avatar](https://raw.githubusercontent.com/zengtianyu1215/SimpleClock/master/SamplePic/Touch%20Bar%20Shot%202018-01-27%20at%2014.59.05.png)
<center>Timer Touch Bar</center>

![avatar](https://raw.githubusercontent.com/zengtianyu1215/SimpleClock/master/SamplePic/Touch%20Bar%20Shot%202018-01-27%20at%2014.59.00.png)
<center>Stopwatch Touch Bar</center>

### 5. Calendar Display

After several iterations of SimpleClock, making a calendar display function was taken into consideration. To toggle this function, just right-click on the panel of Clock interface and click show calendar. Current month's calendar will be shown in a popup window as following.

![avatar](https://raw.githubusercontent.com/zengtianyu1215/PersonalPics/master/img/Screen%20Shot%202018-11-04%20at%2023.11.18.png)



## RELEASE: SimpleClock 2.0(10)

### Link: <https://github.com/zengtianyu1215/SimpleClock/releases>
# SimpleClock 2.0(10) Release ChangeLog::

**Time: 2019/01/18 15:21:26**

>**Content**
>1.  Fixed Time Lapse Bugs in Issue #2 (Issue #2 Fixed).
>2. Fixed Bugs in Timer and Clock (Issue #2 Fixed).
>3. Improve SimpleClock Efficiency in CPU Time.
>4. Fixed Bugs in Clock Interface Right-Click Menu.
>5. Improve the Performance of Right-Click Menu.
>6. Add Auto-Update Framework, Sparkle. The Download Source is from GitHub.
>7. Add Time Today Widget.
>8. Add Calendar Today Widget.
>9. Add Validating Condition to Timer Input.
>10. Update SimpleClock Homepage.
>11. Improve Today Widget Performance in Battery and CPU Time.
>12. Improve Preference Saving Method.
>13. Add More Localization Files.
>14. Fixed Bugs on Sending Notifications.
>15. Now SimpleClock Total Download Rate has Reached 750+. 🎉 Thanks! 
>*If you have problems when you are using SimpleClock, please post an issue on SimpleClock.*
---
**编译时间: 2019/01/18 15:21:26**

>**更新内容**
>1.  修复了 Issue #2 中有关时间延迟的问题；
>2. 修复了 Issue #2 中在时钟和定时器的问题；
>3. 改进了 SimpleClock 在 CPU 时间上面的表现，能耗进一步降低；
>4. 修复了右键菜单与 Touch Bar 的交互问题；
>5. 修复了当前界面失焦适用右键菜单造成的闪退问题;
>6. 添加了 Sparkle 自动更新框架，更新源为本 GitHub 网站。从 2.0 版本开始，可以使用 Sparkle 进行更新；
>7. 添加了时钟小部件，无需打开应用即可查看时间，在通知栏中的今天部分可以添加；
>8. 添加了日历小部件，无需打开应用即可查看日历，在通知栏中的今天部分可以添加；
>9. 添加了定时器输入验证功能，防止非法时间输入；
>10.  更新了 SimpleClock 主页；
>11. 改进了时钟和日历部件的性能，整体性能与系统部件一致；
>12. 改进了设置保存方法；
>13. 添加了本地化文件；
>14. 修复了定时器的通知发出问题；
>15.  到现在，SimpleClock 的总共下载量已经超过了750次，24星，4个分支。🎉 
>
>*如果在使用过程中遇到无法解决的Bug，欢迎在 Issue 中提出*
<br>

## Requirements
1. macOS Version: macOS High Sierre (Recommended) (10.12+ is supported)
2. Touch bar: Macbook Pro 2016 or 2017 (Recommended) (Previous version will be supported in the future)
3. RAM Space: 4GB+
<br>

## About SimpleClock Maker: Zeng Tianyu
Zeng Tianyu, a student in SYSU, Guangzhou, China. For more detail? Here is the link:
* **<https://zengtianyu1215.github.io/>**
<br>
<br>
<br>
<div style="text-align:center"><img src ="https://raw.githubusercontent.com/zengtianyu1215/SimpleClock/master/icon.png" /></div>
<br>
<center>SimpleClock</center>
<br>
<br>
<br>

