//
//  StopwatchWindowController.swift
//  SimpleClock
//
//  Created by 曾天宇 on 27/01/2018.
//  Copyright © 2018 曾天宇. All rights reserved.
//

import Cocoa
class StopwatchWindowController: NSWindowController {
    
    @IBOutlet weak var ModeChanger: NSSegmentedControl!
    
    @IBAction func Start(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name.init("SCSTOPWATCHSTART"), object: nil)
    }
    
    @IBAction func Pause(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name.init("SCSTOPWATCHPAUSE"), object: nil)
    }
    
    @IBAction func End(_ sender: NSButtonCell) {
        NotificationCenter.default.post(name: NSNotification.Name.init("SCSTOPWATCHEND"), object: nil)
    }
    
    @IBAction func Changeback(_ sender: Any){
        if ModeChanger.isSelected(forSegment: 0) {
            NotificationCenter.default.post(name: NSNotification.Name.init("SCSTOPWATCHLIGHT"), object: nil)
        }else{
            NotificationCenter.default.post(name: NSNotification.Name.init("SCSTOPWATCHDARK"), object: nil)
        }
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        let defau = UserDefaults.standard
        let dark = defau.bool(forKey: "DarkThemeStopwatch?")
        if !dark {
            ModeChanger.selectedSegment = 0
        }
    }
}
