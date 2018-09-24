import UIKit

class ItemCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumber: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        nameLabel.adjustsFontForContentSizeCategory = true
        serialNumber.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
        
        valueLabel.text = "Dupa"
        
        valueLabel.addObserver(self, forKeyPath: #keyPath(UILabel.text) , options: [.new], context: nil)
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            if let newValue = change?[.newKey] {
                if let currencyAsDouble = convertCurrencyStringToDouble(value: newValue as! String) {
                    if currencyAsDouble > 50 {
                        valueLabel.textColor = UIColor.green
                    } else {
                        valueLabel.textColor = UIColor.red
                    }
                }
                
            }
        }
    }
    
    
    private func convertCurrencyStringToDouble(value: String) -> Double?{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        if let number = formatter.number(from: value) {
            return number.doubleValue
        }
        return nil
    }
    
}
