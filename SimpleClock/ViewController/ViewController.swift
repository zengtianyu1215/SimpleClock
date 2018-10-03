//
//  ViewController.swift
//  SimpleClock
//
//  Created by 曾天宇 on 25/01/2018.
//  Copyright © 2018 曾天宇. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var ClockLabel: NSTextField!
    @IBOutlet weak var CalendarLabel: NSTextField!
    @IBOutlet weak var BackgroundView: NSVisualEffectView!
    var timer = Timer()
    let timeFormat = DateFormatter()
    let timeFormat2 = DateFormatter()
    var isNightMode = Bool(true)
    var isSecond = Bool(false)
    var is24H = Bool(true)
    @IBOutlet weak var ThemeChanger: NSClickGestureRecognizer!
    @IBOutlet weak var Background: NSVisualEffectView!
    var isLoading = Bool(true)
    @IBOutlet weak var SecondInMenu: NSMenuItem!
    @IBOutlet weak var AMInMenu: NSMenuItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defau = UserDefaults.standard
        let dark = defau.bool(forKey: "DarkTheme?")
        let AM = defau.bool(forKey: "ShowAM?")
        let Sec = defau.bool(forKey: "ShowSecond?")
        
        timeFormat.dateFormat = "HH:mm  aa"
        timeFormat2.dateFormat = "yyyy/MM/dd EEEE  zzzz ZZZZ"
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { (timer) in
            self.timerMain()
        })
        
        if !dark{
            ClickToChangeBackground(Any.self)
        }
        if !AM {
            Change_AM_PM(Any.self)
        }
        if Sec {
            ChangeSecond(Any.self)
        }
        timer.fire();
        isLoading = false
    }
    
    override func viewWillDisappear() {
        let defau = UserDefaults.standard
        defau.setValue(is24H, forKey: "ShowAM?")
        defau.setValue(isSecond, forKey: "ShowSecond?")
        defau.setValue(isNightMode, forKey: "DarkTheme?")
        super.viewWillDisappear()
    }
    
    @IBAction func ShowCalInMain(_ sender: Any) {
        let window = NSApplication.shared.mainWindow?.windowController as! WindowController
        window.openCal(Any.self)
    }
    
    @IBAction func Change_AM_PM(_ sender: Any) {
        Change24H()
        
    }
    
    @IBAction func ChangeSecond(_ sender: Any) {
        if isSecond {
            isSecond = false
            SecondInMenu.state = .off
            if(!isLoading){
                let Window = NSApplication.shared.mainWindow?.windowController as! WindowController
                Window.SecondChanger.selectedSegment = 0
            }
        }else{
            isSecond = true
            SecondInMenu.state = .on
            if(!isLoading){
                let Window = NSApplication.shared.mainWindow?.windowController as! WindowController
                Window.SecondChanger.selectedSegment = 1
            }
        }
    }
    
    func Change24H() -> Void {
        if is24H {
            is24H = false
            AMInMenu.state = .off
            if !isLoading{
                let Window = NSApplication.shared.mainWindow?.windowController as! WindowController
                Window.H24Changer.selectedSegment = 0
            }
        }else{
            is24H = true
            AMInMenu.state = .on
            if !isLoading{
                let Window = NSApplication.shared.mainWindow?.windowController as! WindowController
                Window.H24Changer.selectedSegment = 1
            }
        }
    }
    @IBAction func ClickToChangeBackgroundInWindow(_ sender: Any) {
        ClickToChangeBackground(Any.self)
    }
    
    @IBAction func ClickToChangeBackground(_ sender: Any) {
        if isNightMode {
            BackgroundView.material =  NSVisualEffectView.Material.mediumLight
            ClockLabel.textColor = NSColor.black
            CalendarLabel.textColor = NSColor.black
            isNightMode = false
            if !isLoading{
                let Window = NSApplication.shared.mainWindow?.windowController as! WindowController
                Window.ModeChanger.selectedSegment = 0
            }
        }else{
            BackgroundView.material =  NSVisualEffectView.Material.dark
            ClockLabel.textColor = NSColor.white
            CalendarLabel.textColor = NSColor.white
            isNightMode = true
            if !isLoading{
                let Window = NSApplication.shared.mainWindow?.windowController as! WindowController
                Window.ModeChanger.selectedSegment = 1
            }
        }
    }
   
    
    func timerMain() -> Void {
        let time = Date()
        self.setFormatClock(mode: self.isSecond, is24: self.is24H)
        self.ClockLabel.stringValue = self.timeFormat.string(from: time as Date) as String
        self.CalendarLabel.stringValue = self.timeFormat2.string(from: time as Date ) as String
    }
    
    override func viewDidDisappear() {
        self.timer.invalidate();
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
