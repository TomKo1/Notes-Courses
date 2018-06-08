import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var todoList: TodoList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        todoList = TodoList(tableView: tableView)
        tableView.dataSource = todoList
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    @IBAction func addButtonPressed(_ sender: Any) {
        
        guard let text = itemTextField.text else {
            return
        }
        
        todoList.addItem(item: text)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todoList.removeItemAt(index: indexPath)
        print("click")
        tableView.reloadData()
    }
    
}

