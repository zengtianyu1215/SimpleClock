//
//  AppDelegate.swift
//  SimpleClock
//
//  Created by 曾天宇 on 25/01/2018.
//  Copyright © 2018 曾天宇. All rights reserved.
//

import Cocoa
import Foundation
import Sparkle

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, SUUpdaterDelegate {
    
    var windowController: NSWindowController?
     
    @IBOutlet weak var Check4Update: NSMenuItem!
    @IBOutlet weak var dockMenu: NSMenu!
    @IBOutlet weak var SimpleGithub: NSMenuItem!
    
    @IBAction func SimpleGithubView(_ sender: NSMenuItem) {
        let url = URL.init(string: "https://zengtianyu1215.github.io/SimpleClock/")
        NSWorkspace.shared.open(url!)
        
    }
    @IBOutlet weak var DevGithub: NSMenuItem!
    
    @IBAction func DevGithubView(_ sender: NSMenuItem) {
        let url = URL.init(string: "https://zengtianyu1215.github.io/")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func CheckUpdates(_ sender: Any) {
        let su = SUUpdater()
        su.delegate = self
        su.feedURL = URL.init(string: "https://raw.githubusercontent.com/zengtianyu1215/SimpleClock/master/appcast.xml")
        su.sendsSystemProfile = true
        su.checkForUpdates(Any?.self)
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    @IBAction func CheckUpdate(_ sender: Any) {
//        self.updater = GitHubUpdater.init()
//        self.updater.user = "zengtianyu1215"
//        self.updater.repository = "SimpleClock"
//        self.updater.checkForUpdates(Any?.self)
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
    
    func applicationDockMenu(_ sender: NSApplication) -> NSMenu? {
        return dockMenu
    }
    
}

