//
//  CalendarViewController.swift
//  SimpleClock
//
//  Created by 曾天宇 on 22/02/2018.
//  Copyright © 2018 曾天宇. All rights reserved.
//

import Cocoa

class CalendarViewController: NSViewController{
    
    @IBOutlet weak var timeLabel: NSTextField!
    
    @IBOutlet weak var collectionView: NSScrollView!
    var date = Date()
    var dateFormatter = DateFormatter()
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (Timer) in self.timerMain()})
        collectionView.backgroundColor = NSColor.darkGray
        timer.fire()
    }
    
    override func viewDidDisappear() {
        timer.invalidate()
    }
    
    func timerMain(){
        dateFormatter.dateFormat = "yyyy/MM/dd eeee"
        timeLabel.stringValue = dateFormatter.string(from: date) as String
    }
}
