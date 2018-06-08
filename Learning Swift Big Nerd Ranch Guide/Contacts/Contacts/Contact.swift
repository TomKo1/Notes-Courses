//
//  Contact.swift
//  Contacts
//
//  Created by Tomasz Kot on 07.06.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

import Foundation



class Contact: NSObject {
    let name: String
    init(contactName: String){
        name = contactName
        super.init()
    }
}
