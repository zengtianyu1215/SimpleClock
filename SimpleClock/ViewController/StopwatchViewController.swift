//
//  TimerViewController.swift
//  SimpleClock
//
//  Created by 曾天宇 on 26/01/2018.
//  Copyright © 2018 曾天宇. All rights reserved.
//

import Cocoa

class StopwatchViewController : NSViewController {
    @IBOutlet weak var TimerLabel: NSTextField!
    
    @IBOutlet weak var TimerStartEnd: NSButton!
    @IBOutlet weak var Pause: NSButton!
    @IBOutlet weak var End: NSButton!
    let timeFormat = DateFormatter()
    var myQueue = OperationQueue()
    let myActivity = ProcessInfo.processInfo.beginActivity(
        options: ProcessInfo.ActivityOptions.userInitiated,
        reason: "Batch processing files")
    @IBOutlet weak var Background: NSVisualEffectView!
    var isStart = Bool(false)
    var isPause = Bool(false)
    var isDark = Bool(true)
    
    var timer : Timer!
    
    var time = Int(0)
    var hour = Int(0)
    var minute = Int(0)
    var second = Int(0)
    var microSecond = Int(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            self.runTimer()
        })
        timer.fireDate = Date.distantFuture
        myQueue.addOperation {
            ProcessInfo.processInfo.beginActivity(options: ProcessInfo.ActivityOptions.idleSystemSleepDisabled, reason: "Timer")
        }
    }
    
    func runTimer() -> Void {
        time += 1000
        if time % 1000 == 0{
            second += 1
        }
        if time % 60000 == 0{
            minute += 1
            second = 0
        }
        if time % (60*60000) == 0{
            hour += 1
            second = 0
            minute = 0
        }
        TimerLabel.stringValue = String(format: "%02d:%02d:%02d", hour,minute,second)
    }
    
    @IBAction func StartTimer(_ sender: NSButton) {
        if isStart == false {
            isStart = true
            second = 0
            time = 0
            hour = 0
            minute = 0
            TimerLabel.stringValue = "00:00:00"
            timer.fireDate = NSDate.init() as Date
            NSSound(named: "Glass.aiff")?.play()
        }else if isPause{
            timer.fireDate = NSDate.init() as Date
            isPause = false
            NSSound(named: "Pop.aiff")?.play()
        }
    }
    
    
    @IBAction func Pause(_ sender: NSButton) {
        if isStart {
            timer.fireDate = Date.distantFuture
            isPause = true
            NSSound(named: "Pop.aiff")?.play()
        }
    }

    @IBAction func End(_ sender: NSButton) {
        if isStart {
            timer.fireDate = Date.distantFuture
            second = 0
            time = 0
            hour = 0
            minute = 0
            isStart = false
            NSSound(named: "Glass.aiff")?.play()
        }
    }
}
