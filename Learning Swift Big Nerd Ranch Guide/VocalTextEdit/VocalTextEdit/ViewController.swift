import Cocoa

class ViewController: NSViewController, NSSpeechSynthesizerDelegate {

    @IBOutlet weak var pauseBtn: NSButtonCell!
    @IBOutlet weak var readBtn: NSButtonCell!
    // IBoutlet i IBAction to atrybuty, nie powoduja zmiany kodu w zaden istotny sposob, zmiast tego
    // informuja Xcode ze wskazane wlasciwosci i metody sa powiazane z modulem Interface Builder
    @IBOutlet var textEdit: NSTextView!
    
   
    @IBOutlet weak var progressBar: NSProgressIndicator!
    
    // Cocoa oferuje klase przeznaczona do syntezy mowy o nazwie NSSpeechSynthesizer
    let speechSynthesizer = NSSpeechSynthesizer()
    
    
    var contents: String? {
        get {
            return textEdit.string
        }
        
        set{
            guard let newValueUn = newValue else {
                textEdit.string = ""
                return
            }
           textEdit.string = newValueUn
            
        }
    }
    
  
    
    
    override func viewDidLoad() {
        speechSynthesizer.delegate = self
        super.viewDidLoad()
    }
    
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        readBtn.isEnabled = true
        pauseBtn.isEnabled = false
        progressBar.isHidden = true
    }
 
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, willSpeakWord characterRange: NSRange, of string: String) {
        progressBar.increment(by: 1)
    }
    
    @IBAction func speakButtonClicked(sender: NSButton){
         self.contents = textEdit.string
            let localContents = self.contents?.trimmingCharacters(in: .whitespacesAndNewlines)
            speechSynthesizer.startSpeaking(localContents!)
            readBtn.isEnabled = false
            pauseBtn.isEnabled = true
            progressBar.isHidden = false
            progressBar.startAnimation(self)
            progressBar.maxValue = Double((localContents?.components(separatedBy: " ").count)!)
            progressBar.doubleValue = 0.0
        
    }
    
    @IBAction func stopButtonClicked(sender: NSButton){
        speechSynthesizer.stopSpeaking()
    }
    
    
    

}

