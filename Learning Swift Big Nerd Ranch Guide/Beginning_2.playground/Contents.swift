//: Playground - noun: a place where people can play

import UIKit

///                 LOOPS - next episode

//         REPEAT-WHILE LOOP        - sth like do{...}while(...)
var shileds1 = 10
/* commented out to see othe instructiosns
repeat{
    print("Shooting")
    shileds1 += 1
}while shileds1 < 100*/

print("...")
//  we can use continue/break in loops: (means the same as in Java/C/C++)
 // continue - to skip current iteration and go to the beginning of the loop
// break - to stop the loop
var shields = 5
var blastersOverheating = false
var blasterFireCount = 0
var spaceDemonsDestroyed = 0
/*  commented out to see futher instructions
while shields > 0 {
    if spaceDemonsDestroyed == 500 {
        print("Wygrałeś")
        break
    }
    
    if blastersOverheating {
        print("Broń się przegrzała! Zainicjowano proces schładzania.")
        sleep(5)
        print("Broń jest gotowa fo użycia")
        sleep(1)
        blastersOverheating = false
        blasterFireCount = 0
        continue
    }
    
    if blasterFireCount > 100 {
        blastersOverheating = true
        continue
    }
    
    // Strzelamy !!!
    print("Strzelamy!")
    blasterFireCount += 1
    spaceDemonsDestroyed += 1
}*/
print("...")
//              STRINGS
let playground = "Witaj, playground!" // immutable string
var mutablePlayground = "Witaj, modyfikowalny playground!" // mutable string
// modifying mutable string:
mutablePlayground += "!"

print(mutablePlayground)
// iterating through a string:
for c: Character in mutablePlayground{ // mutablePlaygorund.characters was depreciated
    print("\(c)")
}

// String and Character types can work with Unicode

// ciagi tekstowe w jezyku Swift skladaja sie z tzw skalarow Unicode, skalar Unicode to po prostu 21-bitowa liczba przedstawiajaca
// okreslony znak Unicode np. U+0061 -> a

// skladnia \u{} przedstawia sklad Unicode, ktorego numer szesnastkowy jest umieszczony
// w nawiasie klamrowym
let oneCoolDude = "\u{1F60E}"

// we can combine scalars:

let aAcute = "\u{0061}\u{0301}" // U+0301 is an accent sign and U+0061 is a

// every sign in Swift is "rozszerzony klaster grafu" -> it means that every sign is combined from one or more scalars

// displaying scalars creating string:
for scalar in playground.unicodeScalars{
    print("\(scalar.value)")
}

// aCute and aCutePrecompossed is for Swift the same
let aAcutePrecomposed = "\u{00E1}"

if ( aAcute == aAcutePrecomposed){ // indeed, the same !
    print("True")
}

// count property iterates through scalars but thanks to "odpowiedniki kanoniczne" they consist of exacly 1 char
// characters was depreciated
print("aAcute: \(aAcute.count)")
print("aAcutePrecomposed: \(aAcutePrecomposed.count)")

//                      INDEXES AND RANGES IN STRINGS

// print(playground[3])     // doesn't work !!!

//  Swift  uses String.Index type as indexes ( . - [as always] Index is type defined inside String )
// example  of String.Index usage:
let fromStart = playground.startIndex // startIndex stores the index of first letter
let toPosition = 4 // 0 is the first one
let end = playground.index(fromStart, offsetBy: toPosition) // characters was depreciated
let fifthCharacter = playground[end]
print(fifthCharacter) // j
// range:
let range = fromStart...end // this is range of type String.Index to take 0..4 letters

let firstFive = playground[range] // Witaj
print(firstFive)

// exercise
let witajFromScalars = "\u{0077}\u{0069}\u{0074}\u{0061}\u{006A}"
print(witajFromScalars)

//              OPTIONAL TYPE
// optional type is a special function of Swift language which shows that something may not have value
// Optional type may be used with all types
var errorCodeString: String? // thanks to (like in Kotlin) ? in the end errorCodeString is now Optional type String? != String
//errorCodeString = "404"
print(errorCodeString) // nil

if errorCodeString != nil {
    let theError = errorCodeString! // ! - unwrapping optionl type ; unwrapping can cause error because when Optional type doesn't have
    print(theError)                  // any value
}
// adding optional type -> construction
if let theError = errorCodeString {
    print(theError)
}
// nested Optional type adding with conversion to Int
if let theError = errorCodeString {
    if let errorCodeInteger = Int(theError){
        print("\(theError): \(errorCodeInteger)")
    }
}

// multi Optional type unwrapping using simplified construction
if let theError = errorCodeString, let errorCodeInteger = Int(theError){
    print("\(theError): \(errorCodeInteger)")
}
// we can also add another condition:
if let theError = errorCodeString, let errorCodeInteger = Int(theError), errorCodeInteger == 404{
    print("\(theError): \(errorCodeInteger)")
}
// implict (niejawne) unwrapping
var errorCodeString2: String! // ! -> used only in some specifc cases
errorCodeString = "404"
print(errorCodeString)

// connecting Optional types -> we can combine multiple multiple queries about Optional type
// jesli ktorykolwiek z typ Optional w lancuchu zwroci nil, to wartosc calego lancucha rowniez bedzie nil
// example:
errorCodeString = "404"
var errorDescription: String?
if let theError = errorCodeString, let errorCodeInteger = Int(theError), errorCodeInteger == 404{
    errorDescription = ("\(errorCodeInteger + 200 ): nie  znaleziono żądanego zasobu.")
    // w czasie interpolacji lancucha zwiekszamy wartosc w srodku o 200
}

//uzycie lanczenia typow Optional w celu utworzenia nowego egzemplarza opisu bledu, ale wysweitlanego diuzymi literami
// ? wskazuje ze gdy opis nie ma wartosci ( jest nil) to calosc wyrazenia jest nil-> wiec wynikiem operacji laczenia typow Optional jest rowniez Optional
var upCaseErrorDescription = errorDescription?.uppercased()
//errorDescription


//              MODYFIKACJA TYPU OPTIONAL W MIEJSCU

// ponizsza konstrukcja oznacza, ze jezeli zmienna upCaseErrorDescription zawiera wartosc to nalezy do niej dodac pewien tekst
upCaseErrorDescription?.append(" PROSZĘ SPRÓBOWAĆ PONOWNIE")

//              OPERATOR KOALESCENCJI  -   ??
// sluzy do -> pobrania wartosci jesli istnieje
//      jesli nie istneje to pobierz pewna wartosc domyslna

let description = errorDescription ?? "Brak błędu"
// po lewej stronie operatora ?? musi znajdowac sie typ Optional, natomiast po prawej stronie musi znajdowac sie egzempalrz tego samego typu
// ale juz nieokreslony jako Optional

// exercise:
var variable:String? = nil
// rozpakowujemy -> przymusowo zeby wygenerowac blad
//var someOtherVar = variable! //Fatal error: Unexpectedly found nil while unwrapping an Optional value

//              KOLEKCJE I FUNKCJE

















