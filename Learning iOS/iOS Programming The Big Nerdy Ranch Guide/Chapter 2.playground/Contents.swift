//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
str = "Hello Swift"
let constStr = "Hello, world!"
// Float - 32-bit, Double - 64-bit, Float80 - 80-bit
// Arrays are strongly typed, once you declare an array as containing
// elements of say Int, you cannot add String to it

// dictionary - unordered collection of key-values pairs
// dictionaries are strongly typed and can only contain keys and values of the
// declared type
var arrayOfInts: [Int]
//var dictionaryOfCapitalsByCountry: Dictionary<String, String>
//var shotrcutDictionary: [String:String]
// Set - unordered and unique
var winningLotteryNumbers: Set<Int>

// shoortcuts:
let countingUp = ["one", "two"]
let numberbyParkingspace = [13: "Alice", 27: "Bob"]
// Initializers:
let emptyString = String()
let emptyArrayOfInts = [Int]()
let emptySetOfFloats = Set<Float>()
// some may have pre-defined values:
let defaultlNumber = Int()
let defaultBool = Bool()
// default floating-point is Double
// a property is a value associated with an instance of a type
// for example String has the property isEmpty

// Swift types can be optional, which is indicated by appending ? to a type name
// before you can read an optional value you have to unwrap it

// the result of subscripting (indeksowanie) beyond its bounds returns nil (not trap like array)

// Swift does not have the traditional C-style for loop instead we have for-in:
let range = 0...10
for i in range {
    print("Swift \(i)")
}
// Swift's enumerated() function returns a sequence of integers and values from its argument
// enumerated() returns tuples:
let nameByParkingSpace = [13: "Alice", 27: "Bob"]
for (space, name) in nameByParkingSpace {
    _ = "Space \(space): \(name)"
}

// enumerations:
enum PieType {
    case apple
    case cherry
    case pecan
}

let favouritePie = PieType.apple
// switch statement is great for matching on enum values:
let name: String
switch favouritePie {
case .apple:
    name = "Apple"
case .cherry:
    name = "Cherry"
case .pecan:
    name = "Pecan"
}
// if we need the fall-through behaviour of c in switch we should use fallthrough keyword

// Swift enums can have raw values associated with their cases:
enum PieType2: Int {
    case apple = 0
    case cherry
    case pecan
}
// we can then ask for the raw value:
let pieRawValue = PieType.pecan.rawValue


