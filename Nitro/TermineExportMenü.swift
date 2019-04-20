//
//  TermineExportMenü.swift
//  Nitro
//
//  Created by Christian Baltzer on 23.02.19.
//  Copyright © 2019 Christian Baltzer. All rights reserved.
//

import Foundation
import QuickTableViewController
import EventKit

final class TermineExportMenü: QuickTableViewController {
    private var SOM2019    = true
    private var WIN201920   = true
    private var SOM20120    = true
    private var WIN202021   = true
    
    @IBOutlet weak var finishedView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableContents = [
            Section(title: "", rows: [
                SwitchRow(title: "Sommersemmester 2019", switchValue: self.SOM2019, action: { _ in self.SOM2019 = !self.SOM2019}),
                SwitchRow(title: "Wintersemester 2019/20", switchValue: self.WIN201920, action: { _ in self.WIN201920 = !self.WIN201920}),
                SwitchRow(title: "Sommersemester 2020", switchValue: self.SOM20120, action: { _ in self.SOM20120 = !self.SOM20120}),
                SwitchRow(title: "Wintersemester 2020/21", switchValue: self.WIN202021, action: { _ in self.WIN202021 = !self.WIN202021})
                ], footer: "Hier können ausgewählte Termine in deinen Kalender exportiert werden"),
            
            Section(title: "", rows: [
                TapActionRow(title: "Exportieren", action: { _ in  self.export()})
                ], footer: "ACHTUNG: Termine können doppelt exportiert werden!"),
            
            
        ]
    }
    
    // MARK: - Actions
    
    private func showAlert(_ sender: Row) {
        
    }
    
    ///Exportiern der Kalenderdaten an den Kalender
    private func export(){
        //Test Event
        //addEventToCalendar(title: "TEST", description: "PREPARE TO die!", startDate: Date.from(year: 2019, month: 04, day: 20)!, endDate: Date.from(year: 2019, month: 04, day: 20)!)

        if (SOM2019){
            //Alle Exportieren die im SOM 2019 passieren
            addEventToCalendar(title: "Bewerbungsfrist", description: "", startDate: Date.from(year: 2018, month: 12, day: 01)!, endDate: Date.from(year: 2019, month: 01, day: 15)!)
            addEventToCalendar(title: "Rückmeldungsfrist Ende", description: "", startDate: Date.from(year: 2019, month: 03, day: 31)!, endDate: Date.from(year: 2019, month: 03, day: 31)!)
            addEventToCalendar(title: "Beginn Sommersemester", description: "", startDate: Date.from(year: 2019, month: 04, day: 01)!, endDate: Date.from(year: 2019, month: 04, day: 01)!)
            addEventToCalendar(title: "Beginn Lehrveranstaltungen", description: "", startDate: Date.from(year: 2019, month: 04, day: 15)!, endDate: Date.from(year: 2019, month: 04, day: 15)!)
            addEventToCalendar(title: "Ende Lehrveranstaltungen", description: "", startDate: Date.from(year: 2019, month: 07, day: 19)!, endDate: Date.from(year: 2019, month: 07, day: 19)!)
            addEventToCalendar(title: "Ende Sommersemester", description: "", startDate: Date.from(year: 2019, month: 09, day: 30)!, endDate: Date.from(year: 2019, month: 09, day: 30)!)
            addEventToCalendar(title: "Vorlesungsfreie Zeit", description: "", startDate: Date.from(year: 2019, month: 04, day: 19)!, endDate: Date.from(year: 2019, month: 04, day: 22)!)
        };if(WIN201920){
            addEventToCalendar(title: "Bewerbungsfrist", description: "", startDate: Date.from(year: 2019, month: 05, day: 02)!, endDate: Date.from(year: 2019, month: 07, day: 15)!)
            addEventToCalendar(title: "Rückmeldefrist Ende", description: "", startDate: Date.from(year: 2019, month: 09, day: 30)!, endDate: Date.from(year: 2019, month: 09, day: 30)!)
            addEventToCalendar(title: "Beginn Wintersemester", description: "", startDate: Date.from(year: 2019, month: 10, day: 01)!, endDate: Date.from(year: 2019, month: 10, day: 01)!)
            addEventToCalendar(title: "Beginn Lehrveranstaltungen", description: "", startDate: Date.from(year: 2019, month: 10, day: 14)!, endDate: Date.from(year: 2019, month: 10, day: 14)!)
            addEventToCalendar(title: "Ende Lehrveranstaltungen", description: "", startDate: Date.from(year: 2020, month: 02, day: 14)!, endDate: Date.from(year: 2020, month: 02, day: 14)!)
            addEventToCalendar(title: "Ende Wintersemester", description: "", startDate: Date.from(year: 2020, month: 03, day: 31)!, endDate: Date.from(year: 2020, month: 03, day: 31)!)
            addEventToCalendar(title: "Vorlesungsfreie Zeit", description: "", startDate: Date.from(year: 2019, month: 12, day: 20)!, endDate: Date.from(year: 2020, month: 01, day: 10)!)
        };if(SOM20120){
            addEventToCalendar(title: "Bewerbungsfrist Sommersemester", description: "", startDate: Date.from(year: 2019, month: 12, day: 01)!, endDate: Date.from(year: 2020, month: 01, day: 15)!)
            addEventToCalendar(title: "Rückmeldungsfrist Sommersemester Ende", description: "", startDate: Date.from(year: 2020, month: 03, day: 31)!, endDate: Date.from(year: 2020, month: 03, day: 31)!)
            addEventToCalendar(title: "Beginn Sommersemester", description: "", startDate: Date.from(year: 2020, month: 04, day: 01)!, endDate: Date.from(year: 2020, month: 04, day: 01)!)
            addEventToCalendar(title: "Beginn Lehrveranstaltungen", description: "", startDate: Date.from(year: 2020, month: 04, day: 14)!, endDate: Date.from(year: 2020, month: 04, day: 14)!)
            addEventToCalendar(title: "Ende Lehrveranstaltungen", description: "", startDate: Date.from(year: 2020, month: 07, day: 17)!, endDate: Date.from(year: 2020, month: 07, day: 17)!)
            addEventToCalendar(title: "Ende Sommersemester", description: "", startDate: Date.from(year: 2020, month: 09, day: 30)!, endDate: Date.from(year: 2019, month: 09, day: 20)!)
        };if(WIN202021){
            addEventToCalendar(title: "Bewerbungsfrist Wintersemester", description: "", startDate: Date.from(year: 2020, month: 05, day: 02)!, endDate: Date.from(year: 2020, month: 07, day: 15)!)
            addEventToCalendar(title: "Rückmeldefrist Ende", description: "", startDate: Date.from(year: 2020, month: 09, day: 30)!, endDate: Date.from(year: 2020, month: 09, day: 30)!)
            addEventToCalendar(title: "Beginn Wintersemester", description: "", startDate: Date.from(year: 2020, month: 10, day: 01)!, endDate: Date.from(year: 2020, month: 10, day: 01)!)
            addEventToCalendar(title: "Beginn Lehrveranstaltungen", description: "", startDate: Date.from(year: 2020, month: 10, day: 12)!, endDate: Date.from(year: 2020, month: 10, day: 12)!)
            addEventToCalendar(title: "Ende Lehrveranstaltungen", description: "", startDate: Date.from(year: 2021, month: 02, day: 12)!, endDate: Date.from(year: 2021, month: 02, day: 12)!)
            addEventToCalendar(title: "Ende Wintersemester", description: "", startDate: Date.from(year: 2021, month: 03, day: 31)!, endDate: Date.from(year: 2021, month: 03, day: 31)!)
            addEventToCalendar(title: "Vorlesungsfreie Zeit", description: "", startDate: Date.from(year: 2020, month: 12, day: 18)!, endDate: Date.from(year: 2021, month: 01, day: 08)!)
        }
        Export_Abgeschlossen()
    }
   /// Ist das Exportieren abgeschlossen, wird eine Kachel geöffnet und wir gehen ins Hauptmenü
    func Export_Abgeschlossen(){
        let alert = UIAlertController(title: "Termine Exportiert", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true)
    }
    
    
    func addEventToCalendar(title: String, description: String?, startDate: Date, endDate: Date, completion: ((_ success: Bool, _ error: NSError?) -> Void)? = nil) {
        let eventStore = EKEventStore()
        
        eventStore.requestAccess(to: .event, completion: { (granted, error) in
            if (granted) && (error == nil) {
                let event = EKEvent(eventStore: eventStore)
                event.title = title
                event.startDate = startDate
                event.endDate = endDate
                event.notes = description
                event.calendar = eventStore.defaultCalendarForNewEvents
                do {
                    try eventStore.save(event, span: .thisEvent)
                } catch let e as NSError {
                    completion?(false, e)
                    return
                }
                completion?(true, nil)
            } else {
                completion?(false, error as NSError?)
            }
        })
    }
}

extension Date {
    
    /// Create a date from specified parameters
    ///
    /// - Parameters:
    ///   - year: The desired year
    ///   - month: The desired month
    ///   - day: The desired day
    /// - Returns: A `Date` object
    static func from(year: Int, month: Int, day: Int) -> Date? {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        return calendar.date(from: dateComponents) ?? nil
    }
}
