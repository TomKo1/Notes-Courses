//: Playground - noun: a place where people can play

import UIKit


// Swift oferuje dwa protokoly przeznaczone do sprawdzania rownosci i porownywalnosci:
//      -> Equatable
//      -> Comparable

struct Point: Equatable, Comparable, CustomStringConvertible {
    let x: Int
    let y: Int
    
    var description: String {
               return "(\(x), \(y))"
        }
}

func ==(lhs: Point, rhs: Point) -> Bool {
    return (lhs.x == rhs.x) && (lhs.y == rhs.y)
}

let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)

// aby 'nauczyc' strukture porownywania egzemplarzy jej typu, konieczne jest zapewnienie
// zgodnosci tej struktury z protokolem Equatable
let abEqual = ( a == b )
// uwaga: operator == musi byc zaimplementowany w zasiegu globalnym -> poza definicja Point

// operatory dzialajace na dwoch egzemplarzach sa nazywane OPERATORAMI INFIKS


// Biblioteka standardowa jezyka Swift dostarcza domyslna implementacje funkcji != zalezna
// od definicji ==. To zachowanie oznacza, ze jesli typ jest zgodny z protokolem Equatable
// na skutek implementacji wlasnej wersji == to ma rowniez prawidlowo dzialajaca implementacje
// funkcji !=

let abNotEqual = ( a != b)

// w celu sprawdzania czy punkt jest mniejszy/wiekszy itd. dany punkt musi byc zgodny
// z protokolem Comparable
func <(lhs: Point, rhs: Point) -> Bool {
    return (lhs.x < rhs.x) && (lhs.y < rhs.y)
}

let c = Point(x: 2, y: 6)
let d = Point(x: 3, y: 7)

let cdEqual = ( c == d)
let cLessThanD = (c < d)


// podobnie jak w przypadku Equatable implementacja jednej funkcji moze dostarczyc znacznie
// wiecej funkcjonalnosci; Biblioteka standardowa jezyka Swift definiuje operatory <,>= i <=
// w kategoriach operatorow < i ==

let cLessThanEqualD = ( c <= d )
let cGreaterThanD = ( c > d )
let cGreaterThanEqualD = (c >= d )
//                  DZIEDZICZENIE LOGIKI POROWNANIA

// w rzeczywistosci protokol Comparable dziedziczy po Equatable ->
//      w celu zapewnienia zgodnosci z protokolem Comparable, konieczne jest rowniez
//          zapewnienie zgodnosci z protokolem Equatable
//      -> brak koniecznosci wyraznego deklarowania zgodnosci z Equatable, jesli
//              jest zadeklarowana zgodnosc z protokolem Comparable

// exercise
func+(lhs: Point,rhs:Point)->Point{
    let newX = lhs.x + rhs.x
    let newY = lhs.y + rhs.y
    return Point(x: newX ,y: newY)
}

let pointA = Point(x: 1, y: 1)
let pointB = Point(x: 1, y: 1)
let addedPoint = pointA + pointB
print(addedPoint)

class Person: Equatable {
    var name: String!
    var age: Int!
    
    init(namaeOfPerson name: String!, ageOfPerson age: Int!){
        self.name = name
        self.age = age
    }
}

func== (lhs: Person, rhs: Person) -> Bool {
    return (lhs.age == rhs.age) && (lhs.name == rhs.name)
}

let personA = Person(namaeOfPerson: "Tomek", ageOfPerson: 20)
let personB = Person(namaeOfPerson: "Agata", ageOfPerson: 19)

var personArray = [Person]()

personArray.append(personA)
personArray.append(personB)
// Person needs to conform to the Comparable protocol in order to use index(of:).
print(personArray.index(of: personB))

//              DLA BARDZIEJ DOCIEKLIWYCH -> WLASNE OPERATORY

// mozemy np. tworzyc wlasne operatory postaci +++
class NewPerson: Equatable {
    var name: String
    weak var spouse: NewPerson?
    
    init(name: String, spouse: NewPerson?){
        self.name = name
        self.spouse = spouse
    }
    
}


func ==(lhs: NewPerson, rhs: NewPerson) -> Bool {
    return (lhs.name == rhs.name) && (lhs.spouse?.name == rhs.spouse?.name)
}

let matt = NewPerson(name: "Mateusz",spouse: nil)
let drew = NewPerson(name: "Dorota", spouse: nil)

//      DEKLARACJA WLASNEGO OPERATORA!
infix operator +++

func +++(lhs: NewPerson, rhs: NewPerson) {
    lhs.spouse = rhs
    rhs.spouse = lhs
}

// proba nowego operatora:
matt +++ drew
matt.spouse?.name
drew.spouse?.name


// ogolnie rzecz biorac odradza sie deklarowanie wlasnych oepratorow 
