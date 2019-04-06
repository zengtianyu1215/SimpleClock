//
//  TimerWindowController.swift
//  SimpleClock
//
//  Created by 曾天宇 on 27/01/2018.
//  Copyright © 2018 曾天宇. All rights reserved.
//

import Cocoa

class TimerWindowController: NSWindowController {
    
    @IBOutlet weak var StartB: NSButton!
    @IBOutlet weak var PauseB: NSButton!
    @IBOutlet weak var EndB: NSButton!
    @IBOutlet weak var ModeChanger: NSSegmentedControl!
    
    @IBAction func Start(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name.init("SCTIMERSTART"), object: nil)
    }
    
    @IBAction func Pause(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name.init("SCTIMERPAUSE"), object: nil)
    }
    
    @IBAction func End(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name.init("SCTIMEREND"), object: nil)
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        let defau = UserDefaults.standard
        let dark = defau.bool(forKey: "DarkThemeTimer?")
        if !dark {
            ModeChanger.selectedSegment = 0
        }
    }
    
    @IBAction func ChangeMode(_ sender: Any) {
        if ModeChanger.isSelected(forSegment: 0) {
            NotificationCenter.default.post(name: NSNotification.Name.init("SCTIMERLIGHT"), object: nil)
        }else{
            NotificationCenter.default.post(name: NSNotification.Name.init("SCTIMERDARK"), object: nil)
        }
    }
}
