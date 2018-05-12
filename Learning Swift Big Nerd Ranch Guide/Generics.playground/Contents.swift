//: Playground - noun: a place where people can play

import UIKit




struct Stack {
    var items = [Int]()
    
    mutating func push(newItem: Int){
        items.append(newItem)
    }
    
    mutating func pop() -> Int? {
        guard !items.isEmpty else{
            return nil
        }
        return items.removeLast()
    }
    
}

var intStack = Stack()
intStack.push(newItem: 1)
intStack.push(newItem: 2)

print(intStack.pop())
print(intStack.pop())
print(intStack.pop())


// stos mogacy przechowywac dowolne elementy:
struct StackGeneric<Element> {
    var items = [Element]()
    
    mutating func push(newItem: Element){
        items.append(newItem)
    }
    
    mutating func pop() -> Element?{
        guard !items.isEmpty else{
            return nil
        }
        
        return items.removeLast()
    }
    
    func map<U>(f: (Element) -> U) -> StackGeneric<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        
        return StackGeneric<U>(items: mappedItems)
    }
}

var intStackGenric = StackGeneric<Int>()
intStack.push(newItem: 1)
intStack.push(newItem: 2)

var stringStack = StackGeneric<String>()



// klasy i typy wyliczeniowe moga byc rowniez generykami, do ich zdefiniowania wykorzystuje sie
// taka sama skladnie jak w pprzypadku struktur
var doubleStack = intStackGenric.map(f: { 2 * $0 })

// brak wiedzy o typie jaki zostanie przekazany do typu generycznego powoduje ze np. nie mozemy sprawdzic
// czy dwie wartosci sa sobie rowne -> bo moze to nie miec sensu dla danego typu :)

// ograniczenie typu - mozemy nalozyc ograniczenia na konkretne typy ktore moga byc przekazywane do funkcji generycznej

// istnieja dwa rodzaje ograniczen typu:
//      1. typem moze byc podklasa wskaznej klasy
//      2. typ musi byc zgodny z pewnym protokolem(lub kompozycja protokolow)

// protokol Equatable - daje mozliwosc sprawdzenia czy dwie wartosci sa rowne


func checkIfEqual <T: Equatable>(first: T, _ second: T) -> Bool {
    return first == second
}

print(checkIfEqual(first: 1, 1))
print(checkIfEqual(first: "ciąg tekstowy", "ciąg tekstowy"))
print(checkIfEqual(first: "ciąg tekstowy", "inny ciąg tekstowy"))

// funkcja sprawdzajaca czy dwie wartosci CustomStringConveritable maja ten sam opis
func checkIfDescriptionMatch <T: CustomStringConvertible, U: CustomStringConvertible>(first: T, _ second: U) -> Bool {
        return first.description == second.description
}
//print(checkIfEqual(first: Int(1), UInt(1)))
print(checkIfEqual(first: 1, 1.0))
//print(checkIfEqual(first: Float(1.0), Double(1.0)))


// PROTOKOLY NIE MOGA BYC GENERYCZNE, JEDNAK OBSLUGUJA PODOBNA FUNKCJE NAZYWANA TYPAMI POWIAZANYMI
// ponizsza struktura stanowi opakowanie dla Stack i generuje wartosci przez usuwanie elementow
// ze stosu
struct StackGenerator<T>: IteratorProtocol {
    typealias Element = T
    
    var stack: StackGeneric<T>
    // metoda next jest wymagana przez IteratorProtocol :)
    mutating func next() -> Element? {
        return stack.pop()
    }
}


var myStack = StackGeneric<Int>()
myStack.push(newItem: 10)
myStack.push(newItem: 20)
myStack.push(newItem: 30)

var myStackGenerator = StackGenerator(stack: myStack)
while let value = myStackGenerator.next() {
    print("Otrzymana wartosc to: \(value)")
}


// mozemy usunac polecenie typealias oraz wskazac ze wartosc zwrotna metody next() jest typ T?

/*
 struct StackGenerator<T>: IteratorProtocol {
 
 var stack: StackGeneric<T>
    // metoda next jest wymagana przez IteratorProtocol :)
    mutating func next() -> T? {
        return stack.pop()
    }
 }
 */


// wedlug dokumentacji Apple jezeli zapewniamy wlasnemu typowi zgodnosc z protokolem Sequence
// to otiweramy przed nim mozliwosc przeprowadzania wielu uzytecznych operacji, takich jak
// zastosowanie petli for-in oraz metody contains
//,
struct StackGenericTwo<Element>: Sequence, IteratorProtocol {
    var items = [Element]()
    
    mutating func push(newItem: Element){
        items.append(newItem)
    }
    
    mutating func pop() -> Element?{
        guard !items.isEmpty else{
            return nil
        }
        
        return items.removeLast()
    }
    
    func map<U>(f: (Element) -> U) -> StackGeneric<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        
        return StackGeneric<U>(items: mappedItems)
    }
    
    mutating func next() -> Element?{
        guard !items.isEmpty else {
            return nil
        }
        
        return items.removeLast()
    }
}

// teraz mozemy przeprowadzic iteracje:
for value in myStack.items {
    print("Wartosc pochodzaca z petli for-in: \(value)")
}

// jezeli protokol jest typu powiazanego to niem ozna go uzyc jako typu
// konkretnego np. nie ma mozliwosci zadeklarowania zmiennej typi IteratorProtocol lub funkcji
// akceptujacej argument typu IteratorProtocol poniewaz jest to typ powiaany


// umieszcze elemnty tablicy na stosie
func pushItemsOntoStack<Element, S: Sequence>
    (stack: inout StackGenericTwo<Element>, fromSequence sequence: S) where S.Iterator.Element == Element {
    
        for item in sequence {
            stack.push(newItem: item)
        }
}
// podazajac za  miejscami zarezerowowanymi dla typow klauzula where naklada kolejne ograniczenia
// Skladnia S.Iterator.Element odwoluje sie do typu Element powiazanego z type Iterator, ktory z kolei
// jest powiazany z S,
// OGRANICZENIE W POSTACI S.Iterator.Element= Element wymaga aby konkretny typ uzyty jako typ powiazany z Element
// ODPOWIADAL KONKRETNEMU TYPOWI ZASTOSOWANEMU W Element

var myStack2 = StackGenericTwo<Int>()
myStack2.push(newItem: 10)
myStack2.push(newItem: 20)
myStack2.push(newItem: 30)

pushItemsOntoStack(stack: &myStack2, fromSequence: [1, 2, 3])

for value in myStack2.items {
    print("Po umieszczeniu na stosie: otrzymano wartosc \(value).")
}








