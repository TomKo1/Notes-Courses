import UIKit

class TodoList: NSObject {

    var items: [String] = []
    // prosimy system o katalog w ktorym mozemy przechowywac
    // indywidualne pliki tej aplikacji
    private let fileURL: NSURL = {
        let documentDirectoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectoryURL = documentDirectoryURLs.first!
        return documentDirectoryURL.appendingPathComponent("todolist.items") as NSURL
    }()
    
     init(tableView: UITableView!){
        super.init()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        loadItems()
    }
    
    
    // zapisywanie listy do katalogu
    func saveItems(){
        let itemsArray = items as NSArray
        
        print("Zapis elementów w \(fileURL)")
      
        if !itemsArray.write(to: fileURL as URL, atomically: true){
            print("Error while saving!")
        }
        
    }
    
    func loadItems() {
        if let itemsArray = NSArray(contentsOf: fileURL as URL) as? [String]{
            items = itemsArray
        }
    }
    
    func addItem(item: String){
        items.append(item)
        saveItems()
    }
    
    func removeItemAt(index: IndexPath){
        items.remove(at: index.row)
        saveItems()
    }
    
}


extension TodoList: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel!.text = item
        
        return cell
    }
    
}
