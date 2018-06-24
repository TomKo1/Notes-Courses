//
//  NewContactViewController.swift
//  Contacts
//
//  Created by Tomasz Kot on 24.06.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

import UIKit

class NewContactViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var contactImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contactImageView.image = DefaultImage.generate(of: contactImageView.frame.size)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
