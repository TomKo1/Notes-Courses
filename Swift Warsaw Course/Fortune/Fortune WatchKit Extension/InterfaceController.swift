//
//  InterfaceController.swift
//  Fortune WatchKit Extension
//
//  Created by Tomasz Kot on 17.06.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    
    @IBOutlet var citeLabel: WKInterfaceLabel!
    
    
    @IBAction func refClicked() {
        getNewContext()
    }
    
    func getNewContext() {
        citeLabel.setText("...")
        // tutaj powinno byc JSON Decoder
        let x = try! String(contentsOf: URL(string: "http://swift3.itcourse.pl/7//f.php")!)
        
       let decoded = decodeJSON(data: x.data(using: .unicode))
        
        citeLabel.setText(decoded)
    }
    
    func decodeJSON(data: Data?) ->String {
        let decoder = JSONDecoder()
        do{
            let w = try decoder.decode(Cite.self, from: data!)
            return w.quote
        }catch{
            return "..."
        }
        
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        getNewContext()
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
