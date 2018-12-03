import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let studentClassName: String = String(describing: Student.self)
        let courseClassName: String = String(describing: Course.self)
        
        let student: Student = NSEntityDescription.insertNewObject(forEntityName: studentClassName,into:    DatabaseController.getContext()) as! Student
        student.firstName = "John"
        student.lastName = "Smith"
        student.age = 23
        
        let course: Course = NSEntityDescription.insertNewObject(forEntityName: courseClassName, into: DatabaseController.getContext()) as! Course
        course.courseName = "Coumputer Science 402"
        
        student.addToCourses(course)
//        course.addToStudents(student)
        
        DatabaseController.saveContext()
        
        makeRequestToDatabase(andDelete: student)
    }
    
    private func makeRequestToDatabase(andDelete studentToDelete: Student) {
        
        let fetchRequest: NSFetchRequest<Student> = Student.fetchRequest()
        do {
            let searchResults = try DatabaseController.getContext().fetch(fetchRequest)
            print("number of results: \(searchResults.count)")
            for result in searchResults as [Student] {
                print("\(result.firstName!) \(result.lastName!) \(result.age)")
            }
        } catch {
            print(error)
        }
        
        DatabaseController.getContext().delete(studentToDelete)
        
    }
    


}

