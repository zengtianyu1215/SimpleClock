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
    @IBAction func Start(_ sender: Any) {
        let rootViewController = NSApplication.shared.mainWindow?.windowController?.contentViewController as! Timer2ViewController
        rootViewController.StartButton.performClick(nil)
        
    }
    
    @IBAction func Pause(_ sender: Any) {
        let rootViewController = NSApplication.shared.mainWindow?.windowController?.contentViewController as! Timer2ViewController
        rootViewController.PauseButton.performClick(nil)
    }
    
    @IBAction func End(_ sender: Any) {
        let rootViewController = NSApplication.shared.mainWindow?.windowController?.contentViewController as! Timer2ViewController
        rootViewController.EndButton.performClick(nil)
    }
    override func windowDidLoad() {
        super.windowDidLoad()
    }
}
