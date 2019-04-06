//
//  PreferenceViewController.swift
//  SimpleClock
//
//  Created by 曾天宇 on 2018/10/3.
//  Copyright © 2018 曾天宇. All rights reserved.
//

import Foundation
import Cocoa

protocol PreferencesViewControllerDelegate {
    func preferencesDidUpdate()
}

class PreferenceViewController: NSViewController, NSWindowDelegate{
    
    @IBOutlet weak var ShowAMPM : NSButton!
    @IBOutlet weak var ShowSecond: NSButton!
    @IBOutlet weak var DarkTheme: NSButton!
    @IBOutlet weak var DarkThemeTimer: NSButton!
    @IBOutlet weak var DarkThemeStopwatch: NSButton!
    
    var delegate: PreferencesViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defau = UserDefaults.standard
        let dark = defau.bool(forKey: "DarkTheme?")
        let dark2 = defau.bool(forKey: "DarkThemeTimer?")
        let dark3 = defau.bool(forKey: "DarkThemeStopwatch?")
        let AM = defau.bool(forKey: "ShowAM?")
        let Sec = defau.bool(forKey: "ShowSecond?")
        
        setStatus(ShowAMPM, status: AM)
        setStatus(DarkTheme, status: dark)
        setStatus(DarkThemeTimer, status: dark2)
        setStatus(DarkThemeStopwatch, status: dark3)
        setStatus(ShowSecond, status: Sec)
        
        ShowAMPM.action = #selector(setAMPM)
    }
    
    @objc func setAMPM(){
        let defau = UserDefaults.standard
        defau.setValue(getStatus(button: ShowAMPM), forKey: "ShowAM?")
    }
    
    func setStatus(_ button: NSButton, status: Bool) -> Void {
        if status {
            button.state = .on
        }else{
            button.state = .off
        }
    }
    
    func getStatus(button: NSButton)->Bool{
        if (button.state == .on) {
            return true
        }
        return false
    }
    
    override func viewWillDisappear() {
        let defau = UserDefaults.standard
        defau.setValue(getStatus(button: ShowAMPM), forKey: "ShowAM?")
        defau.setValue(getStatus(button: ShowSecond), forKey: "ShowSecond?")
        defau.setValue(getStatus(button: DarkTheme), forKey: "DarkTheme?")
        defau.setValue(getStatus(button: DarkThemeStopwatch), forKey: "DarkThemeStopwatch?")
        defau.setValue(getStatus(button: DarkThemeTimer), forKey: "DarkThemeTimer?")
        self.delegate?.preferencesDidUpdate()
        super.viewWillDisappear()
    }
    
    @IBAction func clockFontChanger(_ sender: Any) {
    }
    
}
