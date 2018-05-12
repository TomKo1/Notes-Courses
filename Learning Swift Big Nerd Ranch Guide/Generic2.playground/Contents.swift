//: Playground - noun: a place where people can play

import UIKit


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
    
    func map<U>(f: (Element) -> U) -> StackGenericTwo<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        
        return StackGenericTwo<U>(items: mappedItems)
    }
    
    mutating func next() -> Element?{
        guard !items.isEmpty else {
            return nil
        }
        
        return items.removeLast()
    }
}

var myStack2 = StackGenericTwo<Int>()
myStack2.push(newItem: 10)
myStack2.push(newItem: 20)
myStack2.push(newItem: 30)

// teraz mozemy przeprowadzic iteracje:
for value in myStack2.items {
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



pushItemsOntoStack(stack: &myStack2, fromSequence: [1, 2, 3])

for value in myStack2.items {
    print("Po umieszczeniu na stosie: otrzymano wartosc \(value).")
}


// przyklad inny:
var myOtherStack = StackGenericTwo<Int>()
pushItemsOntoStack(stack: &myOtherStack, fromSequence: [1, 2, 3])
pushItemsOntoStack(stack: &myStack2, fromSequence: myOtherStack)
for value in myStack2.items {
    print("Po umieszczeniu elementow na stosie otrzymujemy wartosc: \(value)")
}


// typ optional:
/*
 enum Optional<T> {
    case None
    case Some(T)
 }
 
 */
