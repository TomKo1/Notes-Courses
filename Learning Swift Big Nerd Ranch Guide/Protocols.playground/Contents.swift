//: Playground - noun: a place where people can play

import UIKit


func printTable(data: [[Int]]){
    for row in data{
        // utworzenie pustego ciagu tekstowego
        var out = ""
        
        //dolaczneie kazdego elementu w tym wierszu do naszego ciagu tekstowego
        for item in row{
            out += " \(item)|"
        }
        
        // wyswietlamy zawartosc
        print(out)
    }
}


let data = [
    [30, 6],
    [40, 18],
    [50, 20]
]

printTable(data: data)

func padding(amount: Int) -> String{
    var paddingString = ""
    for _ in 0 ..< amount{
        paddingString += " "
    }
    
    return paddingString
}

func printTable(rowLabels: [String], data: [[Int]]){
    
    // utworzenie tablicy szerokosci kazdego wiersza etykiety
    let rowLabelWidths = rowLabels.map { $0.count }
    
    // ustalenie dlugosci najdluzszego wiersza etykiety
    guard let maxRowLabelWidth = rowLabelWidths.max() else {
        return
    }
    
    for (i, row) in data.enumerated(){
        // dopelnienie etykiety spacjami, aby wszystkie mialy te sama dlugosc
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(amount: paddingAmount) + " |"
        
        for item in row {
            out += " \(item) |"
        }
        print(out)
    }
    
}


let rowLabels = ["Jan", "Karen", "Franek"]
let data2 = [
    [30, 6],
    [40, 18],
    [50, 20]
]

printTable(rowLabels: rowLabels, data: data2)

// nadanie etykiet kolumnom
func printTable(rowLabels: [String], columnLabels: [String], data: [[Int]]){
    
    let rowLabelWidths = rowLabels.map { $0.count }
    
    guard let maxRowLabelWidth = rowLabelWidths.max() else{
        return
    }
    
    // utworzenie pierwszego wiersza zawierajacego naglowki kolumn
    var firstRow: String = padding(amount: maxRowLabelWidth) + " |"
    
    // monitorowanie dlugosci kazdej kolumny
    var columnWidths = [Int]()
    
    for columnLabel in columnLabels {
        let columnHeader = " \(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnHeader.count)
    }
    
    print(firstRow)
    
    for (i, row) in data.enumerated() {
        // dopelnienie etykiety spacjami aby wszystkie mialy te sama dlugosc
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(amount: paddingAmount) + " |"
        
        // dolaczenie kazdego elementu w tym wierszu do naszego ciagu tekstowego
        for (j, item) in row.enumerated() {
            let itemString = " \(item) |"
            let paddingAmount = columnWidths[j] - itemString.count
            out += padding(amount: paddingAmount) + itemString
        }
        
        print(out)
    }
}

let rowLabels1 = ["Jan", "Karen", "Franek"]
let columnLabels1 = ["Wiek", "Lata doświadczenia"]
let data1 = [
    [30, 6],
    [40, 18],
    [50, 20]
]
print("-------------------")
printTable(rowLabels: rowLabels1, columnLabels: columnLabels1, data: data1)
print("-------------------")

// powyzsze funkcje sa trudne w uzyciu np. trzeba dopilnowac by liczba kolumn
// (danych) zgadzala sie z liczba etykiet (columLabels)
// lepszym rozwiazaniem jest uzycie pewnego modelu danych

struct Person{
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department{
    let name: String
    var people = [Person]()
    init(name: String){
        self.name = name
    }
    mutating func addPerson(person: Person){
        people.append(person)
    }
}

var department = Department(name: "Inżynieria")
department.addPerson(person: Person(name: "Jan", age: 30, yearsOfExperience: 6))
department.addPerson(person: Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.addPerson(person: Person(name: "Franek", age: 50, yearsOfExperience: 20))


// chcemy miec mozliwosc wyswietlania informacji szczegolowych
// o danej osobie za pomoca printTable -> ale nie mamy odpowiedniej jej "wersji"
// tak by podawac tylko argument typou Department zamiast 3 argumentow
// jednak biezaca implementacja printTable moze byc wykorzystana do wyswietlenia
// wszelkiego rodzaju danych tabelarycznych -> moze nam pomoc w tym protokol

//PROTOKOL POZWALA NA ZDEFINIOWANIE INTERFEJSU, KTORY MA BYC ZAPEWNIONY PRZEZ TYP
// JEZELI TYP SPELNIA WYMAGANIA PROTOKOLU, MOWIMY ZE JEST ZGODNY Z PROTOKOLEM

protocol TabularDataSource{
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    
    func itemForRow(row: Int, column: Int) -> Int
}


// protokol TabularDataSource wskazuje, ze kazdy zgodny z nim typ musi:
//  1. miec dwie wlasciwosci: numberOfRows i numberOfColumns -> { get } oznacza
//      ze wymnienione wlasciwosci mozna odczytywac
//  // jezeli wlasciwosc jest przeznaczona do odczytu i zapisu to nalezy uzyc skladni { get set }
//  2. musi miec trzy wymienione metody z dokladnie tymi samymi typami

// struct zgodny z protokolem:
struct DepartmentTwo: TabularDataSource{
    let name: String
    var people = [Person]()
    
    init(name: String){
        self.name = name
    }
    
    mutating func addPerson(person: Person){
        people.append(person)
    }
    
    var numberOfRows: Int{
        return people.count
    }
    
    var numberOfColumns: Int{
        return 2
    }
    
    func labelForRow(row: Int) -> String {
        return people[row].name
    }
    
    func labelForColumn(column: Int) -> String {
        switch column{
        case 0: return "Wiek"
        case 1: return "Lata doświadczenia"
        default: fatalError("Nieprawidłowa kolumna!")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> Int {
        let person = people[row]
        switch column{
        case 0: return person.age
        case 1: return person.yearsOfExperience
        default: fatalError("Nieprawidłowa kolumna!")
        }
    }
    
}

// modyfikacja funkcji printTable tak by pobierala obiekty zgodne z protokolem TabularDataSource
func printTable(dataSource: TabularDataSource){
    // utworzenie tablic etykiet dla wierszy i kolumn
    let rowLabel = ( 0 ..< dataSource.numberOfRows).map { dataSource.labelForRow(row: $0)}
    
    let columnLabels = ( 0 ..< dataSource.numberOfColumns).map {
        dataSource.labelForColumn(column: $0)
    }
    
    let rowLabelWidths = rowLabels.map { $0.count }
    
    guard let maxRowLabelWidth = rowLabelWidths.max() else {
        return
    }
    
    var firstRow: String = padding(amount: maxRowLabelWidth) + " |"
    
    var columnWidths = [Int]()
    
    for columnLabel in columnLabels {
        let columnHeader = " \(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnHeader.count)
    }
    
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows {
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(amount: paddingAmount) + " |"
        
        for j in 0 ..< dataSource.numberOfColumns {
                let item = dataSource.numberOfColumns
                let itemString = " \(item) |"
                let paddingAmount = columnWidths[j] - itemString.characters.count
                out += padding(amount: paddingAmount) + itemString
            }
            print(out)
        }
}


var department2 = DepartmentTwo(name: "Inżynieria")
department2.addPerson(person: Person(name: "Jan", age: 30, yearsOfExperience: 6))
department2.addPerson(person: Person(name: "Karen", age: 40, yearsOfExperience: 18))
department2.addPerson(person: Person(name: "Franek", age: 50, yearsOfExperience: 20))
print("-------")
printTable(dataSource: department2)
print("-------")
//                      ZGODNOSC Z PROTOKOLOEM

//  WSZYSTKIE TYPY MOGA BYC ZGODNE Z PROTOKOLAMI
//  TYPY WYLICZENIOWE I KLASY ROWNIEZ MOGA BYC ZGODNE Z PROTOKOLAMI
//
//  ISTNIEJE ROWNIEZ MOZLIWOSC ZE TYP BEDZIE ZGODNY Z WIELOMA PROTOKOLAMI

struct DepartmentThree: TabularDataSource, CustomStringConvertible{
    // CustomStringConvertible jest protokolem sprawdzanym np. przez funkcje print()
    let name: String
    var people = [Person]()
    
    var description: String{
        return "Department \(name)+ \(people)"
    }
    
    mutating func addPerson(person: Person){
        people.append(person)
    }
    init(name: String){
        self.name = name
    }
    
    var numberOfRows: Int{
        return people.count
    }
    
    var numberOfColumns: Int{
        return 2
    }
    
    func labelForRow(row: Int) -> String {
        return people[row].name
    }
    
    func labelForColumn(column: Int) -> String {
        switch column{
        case 0: return "Wiek"
        case 1: return "Lata doświadczenia"
        default: fatalError("Nieprawidłowa kolumna!")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> Int {
        let person = people[row]
        switch column{
        case 0: return person.age
        case 1: return person.yearsOfExperience
        default: fatalError("Nieprawidłowa kolumna!")
        }
    }
    
}

var departmentThree: DepartmentThree = DepartmentThree(name: "Ministerstwo")
departmentThree.addPerson(person: Person(name: "Tomek", age: 20, yearsOfExperience: 0))
print("**************")
print(departmentThree)

/*
 Jesli klasa nie ma superklasy to skladnia jest nastepujaca:
 class NazwaKlasy: ProtokolPierwszy, ProtokolDrugi{
    //...
 }

 natomiast jesli klasa ma superklase to jej nazwa jest podawana jako pierwsza, a dopiero po niej wymieniamy
 nazwy protokolow:
 class NazwaKlasy: SuperKlasa, ProtokolPierwszy, ProtokolDrugi{
 
 
 }
*/

//                      DZIEDZICZENIE PROTOKOLU

/*
    jezyk Swift obsluguje dziedziczenie protokolu... protokol dziedziczacy po innym protokole wymaga aby zgodny z nim typ
    implementowal wszystkie wlasciwosci i metody wymagane przez zarowno dany protokol jak i ten po ktorym on dziedziczy
 */

protocol NewTabularDataSource: CustomStringConvertible {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    
    func itemForRow(row: Int, column: Int) -> Int
}

// teraz kazdy typ zgodny z NewTabularDataSource musi b yc rowniez zgodny z CustomStringConvertible


//  PROTOKOL MOZE DZIEDZICZYC PO WIELU INNYCH PROTOKOLACH
/*
 protocol MojProtokol: MojInnyProtokol, CustomStringConvertible {
        // wielodziedziczenie w protokolach
 }
 */

// kompozycja protokolu:
/*
 argument funkcji printTable(dataSource: ) staje sie zgodny z protokolem CustomServiceConvertible
 func printTable(dataSource: TabularDataSource & CustomStringConvertible) {
    //....
 }
 
 kompozycje protokolow mozna przygotowac z wiecej niz tylko dwoch protokolow,
    wystarczy je rozdzielic operatorem &
 */

protocol Toggleable {
    mutating func toggle() // jezeli chcemy by metoda definiowana przez dany protokol byla mutujaca to musimy to jawnie pokazac!!!
}


enum Lightbulb: Toggleable{
    
    case On
    case Off
    
    mutating func toggle() {
        switch self {
        case .On :
            self = .Off
        case .Off:
            self = .On
        }
    }
}


















