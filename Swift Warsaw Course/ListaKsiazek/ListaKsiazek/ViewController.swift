//
//  ViewController.swift
//  ListaKsiazek
//
//  Created by Tomasz Kot on 16.06.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

import UIKit

struct Book{
    let author:String
    let title:String
}


//ksiazka
class ViewController: UIViewController,
    UITableViewDelegate,
    UITableViewDataSource{
    
    
    
    var books = [
        Book(author: "Dougle Adams", title: "Dirk Gently's holistic detective agency"),
        Book(author: "Stieg Larson", title: "Milenium"),
        Book(author: "Autor 123", title: "Ksiazka123")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // pobieramy ze storyboarda
        let cell = tableView.dequeueReusableCell(withIdentifier: "ksiazka")
        
        cell?.textLabel?.text = "\(indexPath.row)"
        cell?.detailTextLabel?.text = books[indexPath.row].author
        
        // bad practice! -> najlepiej stworzyc podklase i dopiero :)
        if let subviews = cell?.contentView.subviews{
            for sw in subviews {
                if let uiswitch = sw as? UISwitch{
                    uiswitch.setOn(false,animated: false)
                }
            }
        }
        
        
        return cell!
    }
    
}

