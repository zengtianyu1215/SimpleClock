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
    var backgroundColor:NSColor?
    var textColor:NSColor?
    var selectionColor:NSColor?
    var todayMarkerColor:NSColor?
    var dayMakerColor:NSColor?
    var limitedDays:Double?
    fileprivate var dayCells:[[CalendarCell]]?
    fileprivate var dayLabels:[NSTextField]?
    var selectedDate:Date?{
        didSet {
            selectedDate = self.toUTC(selectedDate!)
            
            if !self.isViewLoaded {
                return
            }
            
            self.setCellSelectedStatusBy(selectedDate)
        }
    }
    
    fileprivate func setCellSelectedStatusBy(_ date: Date?) {
        if self.dayCells == nil {
            return
        }
        for row in 0...5 {
            for col in 0...6{
                let cell = self.dayCells![row][col]
                if ((cell.representedDate != nil)&&(date != nil)){
                    let isSelected = isSameDay(cell.representedDate!, d2: date!)
                    cell.selected = isSelected
                }
                else{
                    cell.selected = false
                }
            }
        }
    }
    
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
        backgroundColor = NSColor.white.withAlphaComponent(0.0)
        textColor = MonthLabel.textColor
        selectionColor = NSColor.red.withAlphaComponent(0.0)
        todayMarkerColor = NSColor.black.withAlphaComponent(0.2)
        dayMakerColor = NSColor.white
        DateFormat.dateFormat = NSLocalizedString("TimeFormatWidget", comment: "default")
        MonthLabel.stringValue = DateFormat.string(from: date as Date) as String
        self.dayLabels = [NSTextField]()
        for i in 1...7 {
            let _id = "day\(i)"
            let d = self.viewByID(_id) as! NSTextField
            self.dayLabels!.append(d)
        }
        
        self.dayCells = [[CalendarCell]]()
        for _ in 0...5 {
            self.dayCells!.append([CalendarCell]())
        }
        for row in 0...5 {
            for col in 0...6 {
                let i = row * 7 + col + 1
                let _id = "C\(i)"
                let cell = self.viewByID(_id) as! CalendarCell
                cell.target = self
                cell.id = i-1
                //cell.action = #selector(self.cellClicked(_:))
                self.dayCells![row].append(cell)
                cell.owner = self
            }
        }
        let df = DateFormatter()
        let days = df.shortWeekdaySymbols!
        for i in 0..<days.count {
            let day = days[i].uppercased()
            let col = colForDay(i + 1)
            let tf = self.dayLabels![col]
            tf.stringValue = day
        }
        //let bv = self.view as! CalendarBackgroud
        //bv.backgroundColor = self.backgroundColor
        self.layoutCalendar()
    }
    
    
    
    fileprivate func toUTCDateComponent(_ d:Date) -> DateComponents {
        var cal  = Calendar.current
        cal.timeZone = TimeZone(abbreviation: "UTC")!
        let dateFlag = NSCalendar.Unit.day.rawValue | NSCalendar.Unit.month.rawValue | NSCalendar.Unit.year.rawValue | NSCalendar.Unit.weekday.rawValue
        return (cal as NSCalendar).components(NSCalendar.Unit(rawValue: dateFlag), from: d)
    }
    
    fileprivate func isSameDay(_ d1:Date,d2:Date)->Bool{
        let cal  = Calendar.current
        let result = (cal as NSCalendar).compare(d1, to: d2, toUnitGranularity: NSCalendar.Unit.day)
        if result == ComparisonResult.orderedSame {
            return true
        }
        else {
            return false
        }
    }
    
    func layoutCalendar(){
        for row in 0...5 {
            for col in 0...6 {
                let cell = self.dayCells![row][col]
                cell.representedDate = nil
                cell.selected = false
            }
        }
        
        let components = toUTCDateComponent(self.monthDay(1)!)
        
        let firstDay = components.weekday
        let lastDay = lastDayOfTheMonth()
        var beginCol = colForDay(firstDay!)
        var day = 1
        for row in 0...5 {
            for col in beginCol..<7 {
                if day <= lastDay{
                    let cell = self.dayCells![row][col]
                    let d = self.monthDay(day)
                    cell.representedDate = d
                    cell.selected = true
                    day += 1
                }
            }
            beginCol = 0
        }
    }
    
    func viewByID(_ _id:String) -> NSView?{
        for view in self.view.subviews {
            if view.identifier!.rawValue == _id{
                return view
            }
        }
        return nil
    }
    
    @objc func cellClicked(_ sender: NSButton){
        for row in 0...5 {
            for col in 0...6 {
                self.dayCells![row][col].selected = false
            }
        }
        let cell = sender as! CalendarCell
        cell.selected = true
        self.selectedDate = cell.representedDate
        //        if self.delegate != nil{
        //            if self.delegate!.responds(to: Selector(("didSelectDate:"))){
        //                self.delegate!.didSelectDate(self.selectedDate!)
        //            }
        //        }
    }
    
    func toUTC(_ d:Date)->Date{
        var cal = Calendar.current
        let unitFlag = NSCalendar.Unit.day.rawValue | NSCalendar.Unit.month.rawValue | NSCalendar.Unit.year.rawValue
        let component = (cal as NSCalendar).components(NSCalendar.Unit(rawValue: unitFlag), from: d)
        cal.timeZone = TimeZone(abbreviation: "UTC")!
        return cal.date(from: component)!
    }
    
    func monthDay(_ day: Int)->Date?{
        var cal = Calendar.current
        cal.timeZone = TimeZone(abbreviation: "UTC")!
        let unitFlag = NSCalendar.Unit.day.rawValue | NSCalendar.Unit.month.rawValue | NSCalendar.Unit.year.rawValue
        let components = (cal as NSCalendar).components(NSCalendar.Unit(rawValue: unitFlag), from: self.date!)
        var comps = DateComponents()
        comps.day = day
        comps.year = components.year
        comps.month = components.month
        return cal.date(from: comps)
    }
    
    func lastDayOfTheMonth() -> Int{
        var cal = Calendar.current
        cal.timeZone = TimeZone(abbreviation: "UTC")!
        let daysRange = (cal as NSCalendar).range(of: .day, in: .month, for: self.date!)
        return daysRange.length
    }
    
    func colForDay(_ day:Int)->Int{
        var cal = Calendar.current
        cal.timeZone = TimeZone(abbreviation: "UTC")!
        let firstWeekday = cal.firstWeekday
        var idx = day - firstWeekday
        if idx < 0 {
            idx = idx + 7
        }
        return idx
    }
    
    func stepMonth(_ dm:Int){
        var cal = Calendar.current
        cal.timeZone = TimeZone(abbreviation: "UTC")!
        let unitFlag = NSCalendar.Unit.day.rawValue | NSCalendar.Unit.month.rawValue | NSCalendar.Unit.year.rawValue
        var components = (cal as NSCalendar).components(NSCalendar.Unit(rawValue: unitFlag), from: self.date!)
        var month = components.month! + dm
        var year = components.year!
        if month > 12 {
            month = 1
            year += 1
        }
        if month < 1 {
            month = 12
            year -= 1
        }
        components.year = year;
        components.month = month;
        self.date = cal.date(from: components)
    }
    
    @IBAction func nextMonth(_ sender: NSButton){
        let currentSysTime = toUTCDateComponent(Date())
        let selectSysTime = toUTCDateComponent(self.date!)
        var step = 2
        if currentSysTime.month! < 3 || currentSysTime.month! > 10 {
            step = 3
            
        }
        if selectSysTime.month! < currentSysTime.month! + step {
            self.stepMonth(1)
        }
    }
    
    @IBAction func prevMonth(_ sender: NSButton){
        let currentSysTime = toUTCDateComponent(Date())
        let selectSysTime = toUTCDateComponent(self.date!)
        if selectSysTime.month! > currentSysTime.month! {
            self.stepMonth(-1)
        }
    }
}

class CalendarBackgroud:NSView
{
    var backgroundColor:NSColor?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.commonInit()
    }
    
    fileprivate func commonInit(){
        self.backgroundColor = NSColor.white
    }
    
    override func draw(_ dirtyRect: NSRect) {
        self.backgroundColor?.set()
        __NSRectFill(self.bounds)
    }
}



class CalendarCell:NSButton
{
    weak var owner:TodayViewController!
    var id = Int()
    var representedDate:Date?{
        didSet{
            self.needsDisplay = true
        }
        willSet(newValue){
            if let date = newValue {
                let components = toUTCDateComponent(date)
                //self.lunarStr = LunarSolarConverter.Conventer2lunarStr(date)
                self.solarStr = "\(components.day!)"
            }
        }
    }
    
    fileprivate var solarStr:String!
    fileprivate var lunarStr:String!
    
    var selected:Bool = false {
        didSet{
            self.needsDisplay = true
        }
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    fileprivate func commonInit(){
        self.isBordered = false
    }
    
    fileprivate func isToday()->Bool{
        let calendar  = Calendar.current
        return calendar.isDateInToday(self.representedDate!)
    }
    
    fileprivate func toUTCDateComponent(_ d:Date) -> DateComponents {
        var cal  = Calendar.current
        cal.timeZone = TimeZone(abbreviation: "UTC")!
        let dateFlag = NSCalendar.Unit.day.rawValue | NSCalendar.Unit.month.rawValue | NSCalendar.Unit.year.rawValue | NSCalendar.Unit.weekday.rawValue
        return (cal as NSCalendar).components(NSCalendar.Unit(rawValue: dateFlag), from: d)
    }
    
    fileprivate func isDate(_ d1:Date,beforeDate d2:Date)->Bool{
        let cal  = Calendar.current
        let result = (cal as NSCalendar).compare(d1, to: d2, toUnitGranularity: NSCalendar.Unit.day)
        if result == ComparisonResult.orderedAscending {
            return true
        }
        else {
            return false
        }
    }
    
    fileprivate func beforeToday()->Bool{
        return isDate(self.representedDate!, beforeDate: Date())
    }
    
    fileprivate func isDate(_ d1:Date,inLimitDays days:Double)->Bool{
        let limitedDate = Date(timeIntervalSinceNow: days * 24.0 * 3600)
        let cal  = Calendar.current
        let result = (cal as NSCalendar).compare(d1, to: limitedDate, toUnitGranularity: NSCalendar.Unit.day)
        if result == ComparisonResult.orderedAscending {
            return true
        }
        else {
            return false
        }
    }
    
    fileprivate func isInLimitedDate()->Bool{
        var days = 60.0
        if self.owner.limitedDays != nil {
            days = self.owner.limitedDays!
        }
        return isDate(self.representedDate!, inLimitDays: days)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        if  self.representedDate != nil {
            NSGraphicsContext.saveGraphicsState();
            let bounds = self.bounds
            self.owner.backgroundColor!.set()
            __NSRectFill(bounds)
            
            if self.selected {
                var circleRect = NSInsetRect(bounds, 3.5, 3.5)
                circleRect.origin.y += 1
                let bzc = NSBezierPath(ovalIn: circleRect)
                self.owner.selectionColor!.set()
                bzc.fill()
            }
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineBreakMode = .byWordWrapping
            paragraphStyle.alignment = .center
            
            //today
            if self.isToday(){
                self.owner.todayMarkerColor!.set()
                let bottomLine = NSBezierPath()
                bottomLine.move(to: NSMakePoint(NSMinX(bounds), NSMaxY(bounds)))
                bottomLine.line(to: NSMakePoint(NSMaxX(bounds), NSMaxY(bounds)))
                bottomLine.lineWidth = 2*(NSMaxY(bounds)-NSMinY(bounds))
                bottomLine.stroke()
            }
            
            //solar
            let solarFont = NSFont(name: self.font!.fontName, size: 15)!
            var textColor: NSColor!
            if (self.beforeToday() || (!self.isInLimitedDate())) {
                textColor = self.owner.MonthLabel.textColor?.withAlphaComponent(0.5)
                self.isEnabled = false
            }
            else {
                textColor = self.owner.MonthLabel.textColor
                self.isEnabled = true
            }
            let attrs = [NSAttributedString.Key.paragraphStyle:paragraphStyle,
                         NSAttributedString.Key.font:solarFont,
                         NSAttributedString.Key.foregroundColor: textColor]
            let size = (self.solarStr as NSString).size(withAttributes: attrs as [NSAttributedString.Key : Any])
            let r = NSMakeRect(bounds.origin.x,
                               bounds.origin.y + (bounds.size.height - size.height)/2.0-1,
                               bounds.size.width, bounds.size.height)
            (self.solarStr as NSString).draw(in: r, withAttributes: attrs as [NSAttributedString.Key : Any])
            
            NSGraphicsContext.restoreGraphicsState()
        }
        else {
            self.isEnabled = false
            if((id)/7 == 5){
                self.isHidden = true
            }
        }
        
    }
    
}
