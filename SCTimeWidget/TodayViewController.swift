//
//  TodayViewController.swift
//  SCTfimeWidget
//
//  Created by 曾天宇 on 2019/1/3.
//  Copyright © 2019 曾天宇. All rights reserved.
//

import Cocoa
import NotificationCenter

class TodayViewController: NSViewController, NCWidgetProviding {
    
    var timer = Timer()
    let timeFormat = DateFormatter()
    let timeFormat2 = DateFormatter()
    
    @IBOutlet weak var Callabel: NSTextField!
    @IBOutlet weak var Clabel: NSTextField!
    
    override var nibName: NSNib.Name? {
        return NSNib.Name("TodayViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeFormat.dateFormat = "HH:mm"
        timeFormat2.dateFormat = "yyyy-MM-dd EEEE zz"
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.timerMain()
        })
        timer.fire();
    }
    
    override func viewDidDisappear() {
        timer.fireDate = .distantFuture
        super.viewDidDisappear()
    }
    
    func timerMain() -> Void {
        let time = Date()
        //self.setFormatClock(mode: self.isSecond, is24: self.is24H)
        self.Clabel.stringValue = self.timeFormat.string(from: time as Date) as String
        self.Callabel.stringValue = self.timeFormat2.string(from: time as Date ) as String
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Update your data and prepare for a snapshot. Call completion handler when you are done
        // with NoData if nothing has changed or NewData if there is new data since the last
        // time we called you
        completionHandler(.noData)
    }
    
}
