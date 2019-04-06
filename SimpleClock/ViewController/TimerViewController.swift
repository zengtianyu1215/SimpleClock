//
//  Timer2ViewController.swift
//  SimpleClock
//
//  Created by 曾天宇 on 26/01/2018.
//  Copyright © 2018 曾天宇. All rights reserved.
//
import AVFoundation
import Cocoa

class TimerViewController : NSViewController, NSUserNotificationCenterDelegate{
    @IBOutlet weak var background: NSVisualEffectView!
    @IBOutlet weak var StartButton: NSButton!
    @IBOutlet weak var PauseButton: NSButton!
    @IBOutlet weak var EndButton: NSButton!
    
    @IBOutlet weak var hourLabel: NSTextField!
    @IBOutlet weak var minuteLabel: NSTextField!
    @IBOutlet weak var secondLabel: NSTextField!
    @IBOutlet weak var TimerText: NSTextField!
    
    @IBOutlet weak var HourText: NSTextField!
    @IBOutlet weak var MinuteText: NSTextField!
    @IBOutlet weak var SecondText: NSTextField!
    
    var isStart = Bool(false)
    var isPause = Bool(false)
    var isDark = Bool(true)
    
    var myQueue = OperationQueue()
    let myActivity = ProcessInfo.processInfo.beginActivity(
        options: ProcessInfo.ActivityOptions.userInitiated,
        reason: "Batch processing files")
    
    @IBOutlet weak var Indicater: NSProgressIndicator!
    var timer : Timer!
    
    var hour = Int(0)
    var minute = Int(0)
    var second = Int(0)
    
    var totalSecond = Int(0)
    var total = Int(0)
    var runningSec = Int(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defau = UserDefaults.standard
        let dark = defau.bool(forKey: "DarkThemeTimer?")
        if !dark {
            changeLight()
        }else{
            changeDark()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(changeDark), name: NSNotification.Name.init("SCTIMERDARK"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeLight), name: NSNotification.Name.init("SCTIMERLIGHT"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(start), name: NSNotification.Name.init("SCTIMERSTART"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(pause), name: NSNotification.Name.init("SCTIMERPAUSE"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(end), name: NSNotification.Name.init("SCTIMEREND"), object: nil)
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            self.timerMain()
        })
        timer.fireDate = Date.distantFuture
        myQueue.addOperation {
            ProcessInfo.processInfo.beginActivity(options: ProcessInfo.ActivityOptions.idleSystemSleepDisabled, reason: "Timer")
        }
    }
    
    override func viewWillDisappear() {
        let defau = UserDefaults.standard
        defau.setValue(isDark, forKey: "DarkThemeTimer?")
        super.viewWillDisappear()
    }
    
    @objc func changeDark(){
        background.material = NSVisualEffectView.Material.dark
        TimerText.textColor = NSColor.white
        hourLabel.textColor = NSColor.white
        minuteLabel.textColor = NSColor.white
        secondLabel.textColor = NSColor.white
        HourText.textColor = NSColor.white
        MinuteText.textColor = NSColor.white
        SecondText.textColor = NSColor.white
        isDark = true
    }
    
    @objc func changeLight(){
        background.material = NSVisualEffectView.Material.mediumLight
        TimerText.textColor = NSColor.black
        hourLabel.textColor = NSColor.black
        minuteLabel.textColor = NSColor.black
        secondLabel.textColor = NSColor.black
        HourText.textColor = NSColor.black
        MinuteText.textColor = NSColor.black
        SecondText.textColor = NSColor.black
        isDark = false
    }
    
    func timerMain() -> Void {
        if TimerText.stringValue == "00:00:00" {
            timer.fireDate = Date.distantFuture
            TimerText.textColor = NSColor.red
            NSSound(named: "Glass.aiff")?.play()
            let userNotification = NSUserNotification()
            userNotification.title = NSLocalizedString("TimeUp", comment: "default")
            userNotification.subtitle = String(format: NSLocalizedString("TimeUpA", comment: "default"), total)
            userNotification.informativeText = String(format: NSLocalizedString("TimeUpB", comment: "default"), total, runningSec - 1)
            let userNotificationCenter = NSUserNotificationCenter.default
            userNotificationCenter.scheduleNotification(userNotification)
        }else{
            Indicater.doubleValue = Double(totalSecond)
            hour = totalSecond / 3600
            minute = totalSecond % 3600 / 60
            second = totalSecond % 3600 % 60
            TimerText.stringValue = String(format: "%02d:%02d:%02d", hour, minute, second)
            totalSecond -= 1
            runningSec += 1
            if hour == 0 && minute == 0 && second == 0{
                timer.fireDate = Date.distantFuture
                TimerText.textColor = NSColor.red
                NSSound(named: "Glass.aiff")?.play()
                let userNotification = NSUserNotification()
                userNotification.title = NSLocalizedString("TimeUp", comment: "default")
                userNotification.subtitle = String(format: NSLocalizedString("TimeUpA", comment: "default"), total)
                userNotification.informativeText = String(format: NSLocalizedString("TimeUpB", comment: "default"), total, runningSec - 1)
                let userNotificationCenter = NSUserNotificationCenter.default
                userNotificationCenter.scheduleNotification(userNotification)
            }
        }

    }
    
    @objc func start(){
        StartTimer(Any.self)
    }
    
    @IBAction func StartTimer(_ sender: Any) {
        if isStart==false{
            isStart = true
            if(SecondText.stringValue.count>10 || MinuteText.stringValue.count>10 || HourText.stringValue.count>10){
                return;
            }
            if HourText.stringValue == ""{
                HourText.stringValue = "0"
            }
            if MinuteText.stringValue == ""{
                MinuteText.stringValue = "0"
                
            }
            if SecondText.stringValue == ""{
                SecondText.stringValue = "0"
            }
            totalSecond = Int(self.HourText.stringValue)!*3600 + Int(self.MinuteText.stringValue)!*60 + Int(self.SecondText.stringValue)!
            total = totalSecond
            hour = totalSecond / 3600
            minute = totalSecond % 3600 / 60
            second = totalSecond % 3600 % 60
            TimerText.stringValue = String(format: "%02d:%02d:%02d", hour, minute, second)
            //计时器启动
            let userNotification = NSUserNotification()
            userNotification.title = "Timer Start / 启动 / 啟動"
            let userNotificationCenter = NSUserNotificationCenter.default
            userNotificationCenter.scheduleNotification(userNotification)
            Indicater.doubleValue = Double(totalSecond)
            Indicater.maxValue = Double(totalSecond)
            timer.fireDate = NSDate.init() as Date
            TimerText.textColor = NSColor.white
            NSSound(named: "Glass.aiff")?.play()
            runningSec = 0
        }else if isPause{
            timer.fireDate = NSDate.init() as Date
            isPause = false
            NSSound(named: "Pop.aiff")?.play()
        }
    }
    
    @objc func pause(){
        PauseTimer(Any.self)
    }
    
    @IBAction func PauseTimer(_ sender: Any) {
        if isStart {
            isPause = true
            timer.fireDate = Date.distantFuture
            NSSound(named: "Pop.aiff")?.play()
        }
    }
    
    @objc func end(){
        EndTimer(Any.self)
    }
    
    @IBAction func EndTimer(_ sender: Any) {
        if isStart {
            isStart = false
            timer.fireDate = Date.distantFuture
            hour = 0
            minute = 0
            second = 0
            TimerText.stringValue = "00:00:00"
            Indicater.doubleValue = 0
            TimerText.textColor = NSColor.white
            NSSound(named: "Glass.aiff")?.play()
            
            let userNotification = NSUserNotification()
            userNotification.title = NSLocalizedString("TimeUp", comment: "default")
            userNotification.subtitle = String(format: NSLocalizedString("TimeUpA", comment: "default"), total)
            userNotification.informativeText = String(format: NSLocalizedString("TimeUpC", comment: "default"), runningSec - 1)
            let userNotificationCenter = NSUserNotificationCenter.default
            userNotificationCenter.scheduleNotification(userNotification)
            totalSecond = 0
        }
    }
    
    func userNotificationCenter(_ center: NSUserNotificationCenter, shouldPresent notification: NSUserNotification) -> Bool {
        return true
    }
    
}
