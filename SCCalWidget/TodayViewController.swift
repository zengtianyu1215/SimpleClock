//
//  TodayViewController.swift
//  SCCalendarWidget
//
//  Created by 曾天宇 on 2019/1/17.
//  Copyright © 2019 曾天宇. All rights reserved.
//

import Cocoa
import NotificationCenter

class TodayViewController: NSViewController, NCWidgetProviding {
    
    @IBOutlet weak var MonthLabel: NSTextField!
    
    let DateFormat = DateFormatter()
    var date:Date!
    
    override var nibName: NSNib.Name? {
        return NSNib.Name("TodayViewController")
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Update your data and prepare for a snapshot. Call completion handler when you are done
        // with NoData if nothing has changed or NewData if there is new data since the last
        // time we called you
        completionHandler(.noData)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        date = Date()
        DateFormat.dateFormat = NSLocalizedString("TimeFormatWidget", comment: "default")
        MonthLabel.stringValue = DateFormat.string(from: date as Date) as String
    }
    
}
