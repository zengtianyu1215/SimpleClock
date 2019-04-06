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
        let rootViewController = contentViewController as! TimerViewController
        rootViewController.StartButton.performClick(Any.self)
        
    }
    
    @IBAction func Pause(_ sender: Any) {
        let rootViewController = contentViewController as! TimerViewController
        rootViewController.PauseButton.performClick(Any.self)
    }
    
    @IBAction func End(_ sender: Any) {
        let rootViewController = contentViewController as! TimerViewController
        rootViewController.EndButton.performClick(Any.self)
    }
    override func windowDidLoad() {
        super.windowDidLoad()
    }
    
    @IBOutlet weak var ModeChanger: NSSegmentedControl!
    
    @IBAction func ChangeMode(_ sender: Any) {
        let rootViewController = contentViewController as! TimerViewController
        if ModeChanger.isSelected(forSegment: 0) {
            rootViewController.background.material = NSVisualEffectView.Material.mediumLight
            rootViewController.TimerText.textColor = NSColor.black
            rootViewController.hourLabel.textColor = NSColor.black
            rootViewController.minuteLabel.textColor = NSColor.black
            rootViewController.secondLabel.textColor = NSColor.black
            rootViewController.HourText.textColor = NSColor.black
            rootViewController.MinuteText.textColor = NSColor.black
            rootViewController.SecondText.textColor = NSColor.black
        }else{
            rootViewController.background.material = NSVisualEffectView.Material.dark
            rootViewController.TimerText.textColor = NSColor.white
            rootViewController.hourLabel.textColor = NSColor.white
            rootViewController.minuteLabel.textColor = NSColor.white
            rootViewController.secondLabel.textColor = NSColor.white
            rootViewController.HourText.textColor = NSColor.white
            rootViewController.MinuteText.textColor = NSColor.white
            rootViewController.SecondText.textColor = NSColor.white
        }
    }
}
