//
//  ViewController.swift
//  SimpleClock
//
//  Created by 曾天宇 on 25/01/2018.
//  Copyright © 2018 曾天宇. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    @IBOutlet weak var NightModeChange: NSButton!
    
    @IBOutlet weak var ClockLabel: NSTextField!
    @IBOutlet weak var CalendarLabel: NSTextField!
    @IBOutlet weak var BackgroundView: NSVisualEffectView!
    
    @IBOutlet weak var SecondChanger: NSButton!
    
    var timer = Timer()
    let timeFormat = DateFormatter()
    let timeFormat2 = DateFormatter()

    
    var isNightMode = Bool(true)
    var isSecond = Bool(false)
    var is24H = Bool(true)
    
    @IBOutlet weak var Background: NSVisualEffectView!
    
    
    @IBAction func ChangeSecond(_ sender: Any) {
        if isSecond {
            isSecond = false
        }else{
            isSecond = true
        }
    }
    
    func Change24H() -> Void {
        if is24H {
            is24H = false
        }else{
            is24H = true
        }
    }
    
    @IBAction func ClickToChangeBackground(_ sender: NSButton) {
        if isNightMode {
            BackgroundView.material =  NSVisualEffectView.Material.mediumLight
            ClockLabel.textColor = NSColor.black
            CalendarLabel.textColor = NSColor.black
            isNightMode = false
        }else{
            BackgroundView.material =  NSVisualEffectView.Material.menu
            ClockLabel.textColor = NSColor.white
            CalendarLabel.textColor = NSColor.white
            isNightMode = true
        }
    }
    
    let codeTimer = DispatchSource.makeTimerSource(queue:      DispatchQueue.global())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeFormat.dateFormat = "HH:mm  aa"
        timeFormat2.dateFormat = "yyyy/MM/dd EEEE  zzzz ZZZZ"
        var timeCount = 60
        codeTimer.schedule(deadline: .now(), repeating: .microseconds(200))
        codeTimer.setEventHandler(handler: {
            timeCount = 60
            DispatchQueue.main.async {
                let time = Date()
                self.setFormatClock(mode: self.isSecond, is24: self.is24H)
                self.ClockLabel.stringValue = self.timeFormat.string(from: time as Date) as String
                self.CalendarLabel.stringValue = self.timeFormat2.string(from: time as Date ) as String
            }
            if timeCount <= 0 {
                self.codeTimer.cancel()
            }
        })
        // 启动时间源
        self.codeTimer.resume()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear() {
        self.codeTimer.cancel()
    }

    func setFormatClock(mode: Bool, is24: Bool) -> Void {
        if mode {
            if is24{
                timeFormat.dateFormat = "HH:mm:ss  aa"
            }else{
                timeFormat.dateFormat = "h:mm:ss  aa"                
            }
        }else{
            if is24{
                timeFormat.dateFormat = "HH:mm  aa"
            }else{
                timeFormat.dateFormat = "h:mm  aa"
            }
        }
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
}
