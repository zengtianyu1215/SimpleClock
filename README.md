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

<center>

![avatar](https://raw.githubusercontent.com/zengtianyu1215/PersonalPics/master/img/Screen%20Shot%202018-11-04%20at%2023.11.18.png)

</center>



## RELEASE: SimpleClock 1.8(8)

### Link: <https://github.com/zengtianyu1215/SimpleClock/releases>
# Release ChangeLog::

**Time: 2018/10/01 13:44:26**

>**Content**
>1. Add Supports for Mac OS X 10.14 Mojave;
>2. Full Theme Mode switch in Clock, Timer and Stopwatch;
>3. Add Right-Click Menu in Clock interface, which can help iMac and Macbook Pro without Multi-Touch Bar to use the functions provided in Multi-Touch Bar; (Issue #1 Fixed)
>4. Add Triple-Click Gesture Recognizer to change the light / dark theme;
>5. Add Calendar Part in Clock's Calendar label;
>6. Delete Calendar from App Menu;
>7. Add Sparkle Auto-Update Framework; (Now it is under testing...)
>8. Optimized with battery and CPU; (Issue #1 Fixed)
>9. Fix CPU bugs and multi-threads bugs; (Issue #1 Fixed)
>10. Add Constrains in all interface;
>11. Use New Dark Mode of Mac OS X 10.14 Mojave
>12. Fix the bug on starting scene;
>13. Fix display bugs on Multi-touch Bar;
>14. Now SimpleClock support Mac OS X 10.12;
>15. Reach 600+ users, 4 forks and 19 stars on Github. Thanks!
>
>*If you have problems when you are using SimpleClock, please post an issue on SimpleClock.*

**编译时间: 2018/10/01 13:44:26**

>**更新内容**
>
>1. 现已支持 Mac OS X 10.14 Mojave；
>2. 全面改进的界面，在时钟、计时器、秒表都有改进；
>3. 在时钟界面添加了右键菜单，能够让 iMac 和没有 Multi-Touch Bar 的 Macbook / Macbook Pro 使用相应的功能，如主题转换、开关；（Issue #1 已修复）
>4. 在时钟界面，添加了三击手势检测，能够快速转换明亮和暗色主题；
>5. 在时钟界面，添加了日历模块，利用右键菜单即可打开；
>6. 删除了日历界面；
>7. 添加了 Sparkle 自动更新框架； (正在测试中)
>8. 提省了 SimpleClock 在 CPU 和电池方面的性能 (Issue #1 已修复)
>9. 修复了 CPU 和多线程的相关错误 (Issue #1 已修复)
>10. 在界面中添加了相关的约束条件；
>11. 暗色界面采用了来自 Mac OS X 10.14 Mojave 的新材质；
>12. 减少启动过程中的错误和重复项；
>13. 修复了在 Multi-Touch Bar 上的显示错误；
>14. SimpleClock 在 Mac OS X 10.12 上会获得更好的支持；
>15. 现在 SimpleClock 已经有 600+ 位用户，在 GitHub 上有 4 个分支和 19 星的评价，感谢各位！
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

