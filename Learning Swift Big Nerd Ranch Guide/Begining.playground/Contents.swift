//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

str+="!"
print(str)
// declaration of const
let numberOfStoplights: Int = 4
print(numberOfStoplights)

let townName: String = "Knowhere"
var population: Int //uninitialized

population=5422 //now initialized


//interpolation of strings in swift
// \(name_of_var/const ) // here variabiles are put (interpolated)

//example of interpolation:

let townDescription = "Populacja miasta \(townName) wynosi \(population)"

//example of usage

print(townDescription)
// if-else construction in Swift
var population1: Int=5422
var message: String

if population<10000{
    message="Populacja \(population1) wskazuje na małe miasto"
}else{
    message="Populacja \(population1) wskazuje na całkiem duże miasto!"
}

print(message)

//      "comparing" arguments
//      < <= > >= > == !=  - the same meaning as in Java
//      === - checks if two var  are referring to the same obejct
//      !=== - checks if two var are not referring to the same object

var hasPostOffice: Bool=true
if !hasPostOffice {
    print("Gdzie można kupić znaczki pocztowe?")
}

//      Logical operators:
//      && - logical and
//      || - logical or
//      ! - logical negation

//     Conditional operator

message=population1<10000 ? "Populacja \(population1) wskazuje na małe miasto" : "Populacja \(population1) wskazuje na całkiem duże miasto!"
print(message)
// nested if construction

if population<10000{
    message="Populacja \(population1) wskazuje na małe miasto"
}else{
    if population1>=10000 && population < 50000{
        message="Populacja \(population1) wskazuje na średniej wielkości miasto!"
        
    }else{
    
        message="Populacja \(population1) wskazuje na całkiem duże miasto!"
    }
        
    }

print(message)

// else if construction

if population<10000{
    message="Populacja \(population1) wskazuje na małe miasto"
}else if population1 >= 10000 && population1 < 50000{
    message="Populacja \(population1) wskazuje na średniej wielkości miasto!"
}else{
    message="Populacja \(population1) wskazuje na całkiem duże miasto!"
}
print(message)

// in macOS Int by default is 64 bit

print("Wartość maksymalna typu Int wynosi \(Int.max)") // max value of default int
print("Wartość minimalna typu Int wynosi \(Int.min)")// min value of defaul int
// there are also:
// Int8 Int16 Int32 Int64
//  and unsigned "options"
//  UInt UInt8  UInt16 UInt32 UInt64

//      few basic examples of good/bad usage
let numberOfPeople: UInt = 40
let volumeAdjustement: Int32 = -10000
// bad !!!
// let firstBadValue: UInt=-1
// let secondBadValue: UInt8=200

//          arithmetic operators:
//          + - * / %


//              !!! Shortcuts of operators !!!
var x = 10
// x++ x--  // not working from Swift3 - use +=1 and -=1

//              overflow operator
let y: Int8 = 120
//let z = y + 10 // error - Execution was interrupted
// in Swift we have to allow the overflow:
let z = y &+ 10
print(z)

//          conversion between integer types:
let a: Int16 = 200
let b: Int8 = 50
// let c = a + b // bad idea !!!
// we have to allow for that
let c = a + Int16(b) // good idea !!!

//              floating point numbers
//              float - 32 bit
//              double - 64 bit
let d1 = 1.1 // niejawna deklaracja typu Double
let d2: Double = 1.1
let f1: Float = 100.3
//                      Switch construction

//  BASIC SYNTAX

var statusCode: Int = 404
var errorString: String

switch statusCode {
    case 400:
        errorString = "Nieprawidłowe żądanie"
    case 401:
        errorString = "Brak autoryzacji"
    case 403:
        errorString = "Brak dostępu"
    case 404:
        errorString = "Nie znaleziono"
    default:
    errorString = "Inny błąd"
}

print(errorString)


// we can have few values together as follows:
switch statusCode{
    case 400, 401, 403, 404:
        errorString = "Wystąpił błąd podczas wykonywania żądania"
        fallthrough                                                 // !!! we say that next block of code (default) has to be done, even when the condition is not satisfied
default:
    errorString += " Proszę przeanalizować żądanie i spróbować ponownie."
}
print(errorString)

// swtich-case with ranges
errorString = "Żądanie zakończyło się niepowodzeniem z powodu: "

switch statusCode{
    case 100, 101:
        errorString += " Informacyjny, \(statusCode)."       // with interpolation
    case 204:
        errorString += "Sukces, ale brak treści, 204."
    case 300...307:             // all numbers between 300 and 307, including them
        errorString += " Prziekierowanie, 3xx."
    case 400...417:
        errorString += " Błąd po stronie klienta, 4xx"
    case 500...505:
        errorString += " Błąd po stronie servera, 5xx"
    case let unknownCode:       //this const is available in this block, it is initialized only if remaming blocks doesnt satisfy the var statusCode
            errorString += "\(unknownCode) to jest nieznany kod błędu"
}

//                  where clause
var statusCode1: Int = 204
errorString = "Żądanie zakończyło się niepowodzeniem z powodu: "

switch statusCode1{
case 100, 101:
    errorString += "Informacyjny, \(statusCode)"
case 204:
    errorString += "Sukces ale brak treści, 204."
case 300...307:
    errorString += " Przekierowanie, \(statusCode)"
case 400...417:
    errorString += "Błąd po stronie klienta, \(statusCode)"
case 500...505:
    errorString += " Błąd po stronie servera, \(statusCode)"
case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505:                  // this is where clause - it is like if in the end of the line in Ruby
    errorString = "\(unknownCode) to jest nieznany kod błędu"
default:
    errorString = "Wystąpił nieoczekiwany błąd"
}

print(errorString)

//                 " krotka " - in order to combine to seoarate variables

statusCode = 418

switch statusCode {
case 100, 101:
    errorString += "Informacyjny, \(statusCode)"
case 204:
    errorString += "Sukces ale brak treści, 204."
case 300...307:
    errorString += " Przekierowanie, \(statusCode)"
case 400...417:
    errorString += "Błąd po stronie klienta, \(statusCode)"
case 500...505:
    errorString += " Błąd po stronie servera, \(statusCode)"
case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505:
    errorString = "\(unknownCode) to jest nieznany kod błędu"
default:
    errorString = "Wystąpił nieoczekiwany błąd"
}


let error = (statusCode, errorString)   // we assign "krotka" to the error variable
print("-----")
                    // we gain access to the "krotka" interior by indexes
print(error.0)
print(error.1)
print("-----")
print("-----")
                // we can also assign names instead of indexes and gain access through them
let error1 = (code: statusCode, error: errorString)
print(error1.code)
print("-----")
print(error1.error)
print("-----")

//                     MATCHING OF PATTERN USING "KROTKA" AND SWITCH-CASE

let firstErrorCode = 404
let secondErrorCode = 200
let errorCodes = (firstErrorCode, secondErrorCode)  // krotka

switch errorCodes {
case (404, 404):                    // when there is a pair of (404,404)
    print("Nie znaleziono elementów")
case (404, _):                      // _ sign is a sign representing the fact that any value can occure there
    print("Nie znaleziono pierwszego elementu.")
case (_,404):
    print("Nie znaleziono drugiego elemntu")
default:
    print("Znaleziono wszystkie elementy")
}

//                                  if-case construction

let age = 25
if case 18...35 = age {             // this construction checks if age const is between 18 and 35
    print("Doskonały zakres demograficzny")
}

// if-case is useful to use when we have switch-case block with only one case inside
//          if-case construction with additional condition
if case 18...35 = age, age >= 21{
    print("To doskonały zakres demograficzny i możesz spożywać alkohol")
}

// simple exercise

let point = (x: 1, y: 4)

switch point{
case let q1 where (point.x > 0 ) && (point.y > 0):
    print("\(q1) to jest kwadrat 1.")
case let q2 where (point.x < 0 ) && (point.y > 0):
    print("\(q2) to jest kwadrat 2.")
case let q3 where (point.x < 0 ) && (point.y < 0):
    print("\(q3) to jest kwadrat 3.")
case let q4 where (point.x > 0 ) && (point.y < 0):
    print("\(q4) to jest kwadrat 4.")
case (_, 0):
    print("\(point) znajduje sie na osi X.")
case (0,_):
     print("\(point) znajduje sie na osi Y.")
default:
    print("Inny przypadek")
}

            //      LOOPS
//      FOR-IN LOOP - almost normal for loop
var myFirstInt:Int = 0
for i in 1...5{
    myFirstInt += 1
    print(myFirstInt)
}

for _ in 1...5{
    print("For loop with _")
}

//      FOR-CASE LOOP
for case let i in 1...100 where i % 3 == 0{
    print(i)
}
// above loop is the same as:
//for i in 1...100 {
//    if(i%3 == 0){
//        print(i)
//    }
//}

// since Swift 3 classic for loop (know for example from C) in no longer available

//for var i = 1; i < 6 ; i+=1{
//    myFirstInt+=1
//    print(myFirstInt)
//}

//      while loop
var i = 1
while i<6 {
    myFirstInt+=1
    print(myFirstInt)
    i+=1
}
print("......")










