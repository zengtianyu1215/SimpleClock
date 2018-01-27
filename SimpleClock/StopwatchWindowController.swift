//
//  StopwatchWindowController.swift
//  SimpleClock
//
//  Created by 曾天宇 on 27/01/2018.
//  Copyright © 2018 曾天宇. All rights reserved.
//

import Cocoa
class StopwatchWindowController: NSWindowController {
    
    
   
    @IBAction func Start(_ sender: Any) {
        let rootViewController = NSApplication.shared.mainWindow?.windowController?.contentViewController as! TimerViewController
        rootViewController.TimerStartEnd.performClick(nil)
    }
    
    @IBAction func Pause(_ sender: Any) {
       let rootViewController = NSApplication.shared.mainWindow?.windowController?.contentViewController as! TimerViewController
        rootViewController.Pause.performClick(nil)
    }
    
    
    @IBAction func End(_ sender: NSButtonCell) {
        let rootViewController = NSApplication.shared.mainWindow?.windowController?.contentViewController as! TimerViewController
        rootViewController.End.performClick(nil
        )
    }
    
    
    
    override func windowDidLoad() {
        super.windowDidLoad()
    }
}
