//
//  AppDelegate.swift
//  SimpleClock
//
//  Created by 曾天宇 on 25/01/2018.
//  Copyright © 2018 曾天宇. All rights reserved.
//

import Cocoa
import Foundation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var windowController: NSWindowController?

    @IBOutlet weak var SimpleGithub: NSMenuItem!
    @IBAction func SimpleGithubView(_ sender: NSMenuItem) {
        let url = URL.init(string: "https://zengtianyu1215.github.io/SimpleClock/")
        NSWorkspace.shared.open(url!)
        
    }
    @IBOutlet weak var DevGithub: NSMenuItem!
    @IBAction func DevGithubView(_ sender: NSMenuItem) {
        let url = URL.init(string: "https://zengtianyu1215.github.io/Zengtianyu.io/")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func CheckUpdate(_ sender: Any) {
        let url = URL.init(string: "https://github.com/zengtianyu1215/SimpleClock/releases")
        NSWorkspace.shared.open(url!)
    }
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        let windowController = WindowController()
        windowController.showWindow(self)
        self.windowController = windowController
        
        if #available(OSX 10.12.2, *) {
            NSApplication.shared.isAutomaticCustomizeTouchBarMenuItemEnabled = true
        }
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

