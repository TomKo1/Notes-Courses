import Cocoa

class Document: NSDocument {

    var contents: String = ""
    
    override class var autosavesInPlace: Bool {
        return true
    }

    
    override func makeWindowControllers() {
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        
        let viewController = windowController.contentViewController as! ViewController
        viewController.contents = contents
        
        self.addWindowController(windowController)
    }

    // za kazdym razem gdy zachodzi potrzeba zapisania dokumentu
    override func data(ofType typeName: String) throws -> Data {
        let windowController = windowControllers[0]
        let viewController = windowController.contentViewController as! ViewController
        
        let contents = viewController.textEdit.string
        if let data = contents.data(using: String.Encoding.utf8){
            return data
        }else{
            let userInfo = [
                NSLocalizedFailureErrorKey:
                "Pliku nie mozna zapisac jako UTF-8"
                ]
            throw NSError(domain: NSOSStatusErrorDomain, code: 0, userInfo: userInfo)
        }
    }

    // wczytywanie dokumentu
    override func read(from data: Data, ofType typeName: String) throws {
        if let contents = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as? String {
            self.contents = contents
        }else{
            let userInfo = [
                NSLocalizedFailureErrorKey: "To nie jest poprawny plik UTF-8."
            ]
            throw NSError(domain: NSOSStatusErrorDomain, code: 0, userInfo: userInfo)
        }
        
    }


}

