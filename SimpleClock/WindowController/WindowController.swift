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
    var pop : NSPopover?
    var datee = Date()
    var calendar : LunarCalendarView!
    var dateFormatter:DateFormatter!
    
    override func windowWillLoad() {
        let defau = UserDefaults.standard
        let dark = defau.bool(forKey: "DarkTheme?")
        let AM = defau.bool(forKey: "ShowAM?")
        let Sec = defau.bool(forKey: "ShowSecond?")
        if !dark {
            ModeChanger.selectedSegment = 0
        }
        if !AM {
            H24Changer.selectedSegment = 0
        }
        if Sec {
            SecondChanger.selectedSegment = 1
        }
        super.windowWillLoad()
    }
    
    @IBAction func ChangeSecond(_ sender: NSSegmentedControl) {
        let rootViewController = NSApplication.shared.mainWindow?.windowController?.contentViewController as! ViewController
        if SecondChanger.isSelected(forSegment: 0) {
            rootViewController.isSecond = true
            rootViewController.setFormatClock(mode: rootViewController.isSecond, is24: rootViewController.is24H)
        }else{
            rootViewController.isSecond = false
            rootViewController.setFormatClock(mode: rootViewController.isSecond, is24:rootViewController.is24H)
        }
        rootViewController.ChangeSecond(Any.self)
    }
    
    
    @IBAction func Change24H(_ sender: Any) {
        let rootViewController = NSApplication.shared.mainWindow?.windowController?.contentViewController as! ViewController
        if H24Changer.isSelected(forSegment: 0) {
            rootViewController.is24H = false
            rootViewController.AMInMenu.state = .off
        }else{
            rootViewController.is24H = true
            rootViewController.AMInMenu.state = .on
        }
    }
    
    
    @IBAction func DarkLight(_ sender: Any) {
        let rootViewController = NSApplication.shared.mainWindow?.windowController?.contentViewController as! ViewController
        if ModeChanger.isSelected(forSegment: 0) {
            rootViewController.isNightMode = true
        }else{
            rootViewController.isNightMode = false
        }
        rootViewController.ClickToChangeBackground(Any.self)
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
    }
    
    func createCalenderPopover(){
        var myPopover = self.pop
        if(myPopover == nil){
            myPopover = NSPopover()
            self.calendar = LunarCalendarView()
            myPopover!.contentViewController = self.calendar
            if #available(OSX 10.14, *) {
                myPopover!.appearance = NSAppearance(named: NSAppearance.Name.darkAqua)
            } else {
                // Fallback on earlier versions
                myPopover!.appearance = NSAppearance(named:
                    NSAppearance.Name(rawValue: "NSAppearanceNameAqua"))
            }
            myPopover!.animates = true
            myPopover!.behavior = NSPopover.Behavior.transient
        }
        self.pop = myPopover
    }
    
    func openCal(_ sender: Any){
        self.createCalenderPopover()
        let vc = NSApplication.shared.mainWindow?.windowController?.contentViewController as! ViewController
        
        let date = datee
        self.calendar.date = date
        self.calendar.selectedDate = date
        self.calendar.show()
        let cellRect = vc.CalendarLabel.bounds
        self.pop?.show(relativeTo: cellRect, of: vc.CalendarLabel, preferredEdge: .maxY)
        
    }
    
}
