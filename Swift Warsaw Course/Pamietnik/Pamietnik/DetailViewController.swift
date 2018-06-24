//
//  DetailViewController.swift
//  Pamietnik
//
//  Created by Tomasz Kot on 16.06.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

import UIKit

// szczegoly dla listy 
class DetailViewController: UIViewController,
    UITextViewDelegate{

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var detailContentTextView: UITextView!
    
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.timestamp!.description
                
            }
            // tu jest jakis error
            if let tv = detailContentTextView {
                tv.text = detail.content
            }
        }
    }

    // tutaj bedziemy zapisywac za kazdym razem jak uzytkownik cos robi
    func textViewDidChange(_ textView: UITextView) {
        if let detail = detailItem {
            detail.content = textView.text
            do{
                // moze powodowac wyjatek
                try detail.managedObjectContext?.save()
            }catch{
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Event? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

