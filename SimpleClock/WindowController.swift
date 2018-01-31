//
//  WindowController.swift
//  SimpleClock
//
//  Created by 曾天宇 on 25/01/2018.
//  Copyright © 2018 曾天宇. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
    
    @IBOutlet weak var SecondChanger: NSSegmentedControl!
    
    @IBOutlet weak var H24Changer: NSSegmentedControl!
    @IBOutlet weak var ModeChanger: NSSegmentedControl!
    @IBAction func ChangeSecond(_ sender: NSSegmentedControl) {
        let rootViewController = NSApplication.shared.mainWindow?.windowController?.contentViewController as! ViewController
        if SecondChanger.isSelected(forSegment: 0) {
            rootViewController.isSecond = true
            rootViewController.setFormatClock(mode: rootViewController.isSecond, is24: rootViewController.is24H)
        }else{
            rootViewController.isSecond = false
            rootViewController.setFormatClock(mode: rootViewController.isSecond, is24:rootViewController.is24H)
        }
        
        rootViewController.SecondChanger.performClick(nil)
        
    }
    
    
    @IBAction func Change24H(_ sender: Any) {
        let rootViewController = NSApplication.shared.mainWindow?.windowController?.contentViewController as! ViewController
        if H24Changer.isSelected(forSegment: 0) {
            rootViewController.is24H = false
        }else{
            rootViewController.is24H = true
        }
    }
    
    
    @IBAction func DarkLight(_ sender: Any) {
        let rootViewController = NSApplication.shared.mainWindow?.windowController?.contentViewController as! ViewController
        if ModeChanger.isSelected(forSegment: 0) {
            rootViewController.isNightMode = true
        }else{
            rootViewController.isNightMode = false
        }
        rootViewController.NightModeChange.performClick(nil)
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
    }
    
}
