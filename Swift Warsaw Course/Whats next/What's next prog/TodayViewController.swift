//
//  TodayViewController.swift
//  What's next prog
//
//  Created by Tomasz Kot on 16.06.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

import UIKit
import NotificationCenter
import EventKit

class TodayViewController: UIViewController, NCWidgetProviding {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view from its nib.
    }
    
    @IBOutlet weak var eventAlarmSwitch: UISwitch!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventTile: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    var displayEvent: EKEvent?
    var eventStore: EKEventStore?

    
    @IBAction func swtchTriggered(_ sender: Any) {
        
        if let uiswitch = self.eventAlarmSwitch {
            if uiswitch.isOn {
                // ustaw alarm
                var alarm = EKAlarm(relativeOffset: -60.0*60)
                self.displayEvent?.alarms = [alarm]
                // ewentualnie jesli nie chcemy kasowac to uzywamy add
            }else{
                // skasuj alarm
                self.displayEvent?.alarms = nil
                
            }
            
            do{
                try self.eventStore?.save(self.displayEvent!, span: .thisEvent)
            }catch{
                
            }
                
        }
        
        
    }
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        eventTile.text = "Wydarzenie"
        eventDate.text = "Za chwilę"
        eventAlarmSwitch.setOn(false, animated: true)
        
        let eks = EKEventStore()
        self.eventStore = eks
        eks.requestAccess(to: .event) {approved, _ in
            
            if(approved){
                let cals = eks.calendars(for: .event)
                let pred = eks.predicateForEvents(withStart: Date(), end: Date().addingTimeInterval(60.0*60.0*24.0), calendars: cals)
                
                let events = eks.events(matching: pred)
                if let event = events.first {
                    self.eventTile.text = event.title
                    self.eventDate.text = event.startDate.description
                    
                    if let alarm = event.alarms?.first {
                        self.eventAlarmSwitch.setOn(true, animated: true)
                        self.displayEvent = event
                        }else{
                            self.eventAlarmSwitch.setOn(false, animated: true)
                        }
                }else{
                    self.eventTile.text = "Brak"
                    self.eventDate.text = "---"
                }
            }
        }
        /*
            Info.plist must contain an NSCalendarsUsageDescription key with a string value explaining !!! 
        */
        
        
        completionHandler(NCUpdateResult.newData)
    }
    
    
    
    
    
    
}
