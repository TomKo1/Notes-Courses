//: Playground - noun: a place where people can play

import UIKit

//                              TYPY WYLICZENIOWE, STRUKTURY I KLASY


//                              TYPY WYLICZENIOWE

//      definiowanie typu wyliczeniowego
enum TextAlignment{ // enum musi zawierac co najmniej jedno pole case, deklaraujace mozliwe wartosci
    // tego typu wyliczeniowego
    case Left
    case Right
    case Center
    case Justify
}
//      utworzenie egzemplarza typu TextAlignment
var alignment: TextAlignment = TextAlignment.Left // nie trzeba jawnie podawac typu -> kompilator
// moze jawnie interferowac typ

var interferencyjnyAlignment = TextAlignment.Left
interferencyjnyAlignment  = .Right // interferencja !!!

// interferencja typu podczas porownywania wartosci:
if alignment == .Right{
    print("tekst powinien byc wyrownany do prawej strony!")
}

//  przejscie z konstrukcji if na switch
/*
switch alignment{
case .Left:
        print("Wyrównanie o lewej")
case .Right:
    print("Wyrównanie do prawej!")
case .Center:
    print("Wyśrodkowanie")
    // -> nie ma default a nie wszystkie wartosci wyliczenia TextAlignment sa obluzone casa'mi ->
    // blad w kompilacji
}*/

// istnieje mozliwosc zdefiniowania bloku default w konstrukcji switch obslugujacej typ wyliczeniowy
switch alignment{
case .Left:
    print("Wyrównanie o lewej")
case .Right:
    print("Wyrównanie do prawej!")
default:    // mozna ale - zaleca sie unikanie blolku default w konstruckji switch obslugujacej typ wyliczeniowy
    print("Wyśrodkowanie")
}


//              wartosci pierwotne w typie wyliczeniowym

// typy w jezyku Swift nie dzialaja w opraciu o typ liczb calkowitych !!!
// jednak mozemy zdecydowac sie na otrzymanie takiego samego zachowania przez uzycie w Swifcie
// tak zwanych wartosci pierwotnych ( raw value)

//  uzycie wartosci pierwotnych w typie wyliczeniowym:
enum PrimitiveTetAlignment: Int{
    case Left
    case Right
    case Center
    case Justify
}
// zdefiniowanie typu wartosci pierwotnych dla PrimitiveTetAlignment powoduje przypisanie oddzielnej
// wartosci podanego typu (tutaj Int) kazdemu blokowi case -> domyslne zachowanie to takie, w ktorym
// pierwszy blok otrzymuje wartosc 0

// wyswietlenie wartosci pierwotnych dla typu wyliczeniowego:
print("Left ma wartość pierwotną \(PrimitiveTetAlignment.Left.rawValue).")
print("Right ma wartość pierwotną \(PrimitiveTetAlignment.Right.rawValue).")
print("Center ma wartość pierwotną \(PrimitiveTetAlignment.Center.rawValue).")
print("Justify ma wartość pierwotną \(PrimitiveTetAlignment.Justify.rawValue).")

//      mozemy rowniez okreslac wartosci pierwotne w typie wyliczeniowym
enum PrimitiveTextAlignmentNotDefault: Int{
    case Left = 20
    case Right = 30
    case Center = 40
    case Justify = 50
}

//           konwersja wartosci pierwotnej na typ wyliczeniowy

// utworzenie wartosci pierwotnej
let myRawValue = 20

// proba konwersji wartosci pierwotnej na typ TestAlignment
if let myAlignemnt = PrimitiveTextAlignmentNotDefault(rawValue: myRawValue){
    // poniewaz typem zwracanym PrimitiveTextAlignmentNotDefault(rawValue: ...) jest typ Optional
    // uzywamy mechanizmu dolaczania typu Optional
    // konwersja zakonczyla sie sukcesem
    print("Udalo sie skonwertowac \(myRawValue) na typ PrimitiveTextAlignmentNotDefault.")
}else{
    // konwersja zakonczyla sie niepowodzeniem
    print("\(myRawValue) nie ma odpowiadajacego jej bloku case w typie PrimitiveTextAlignmentNotDefault.")
}

// oczywiscie, uzywajac do konwersji raw value, ktorego nie ma w danym typie wyliczeniowym
// konwersja sie nie powiedzie, powodujac blad

//      utworzenie typu wyliczeniowego wraz z ciagami tekstowymi

enum ProgrammingLanguage: String{
    case Swift = "Swift"
    case ObjectiveC = "Objective-C"
    case C = "C"
    case Cpp = "C++"
    case Java = "Java"
}

// utworzenie typu wyliczeniowego wraz z ciagami tekstowymi
let myFavouriteLanguage = ProgrammingLanguage.Swift
print("Moim ulubionym językiem programowania jest: \(myFavouriteLanguage.rawValue)")
// sytuacja gdy nie wszystkie maja przypisane raw values:
enum NotRawProgrammingLanguage: String{
    case Swift
    case ObjectiveC = "Objective-C"
    case C
    case Cpp
    case Java
}
let NotRawMyFavouriteLanguage = ProgrammingLanguage.Swift
print("Moim ulubionym językiem programowania jest: \(NotRawMyFavouriteLanguage.rawValue)")
// wtedy i tak zostanie wyswietlona nazwa ktora wystepuje po odpowiednim case ( jako nazwa odpowiedniego typu wyliczeniowego)

//                          metody
enum Lightbulb{
    case On
    case Off
    
    func surfaceTemperatureForAmbientTemperature(ambient: Double) -> Double{
        switch self{        // self to jak w Ruby lub this w Javie :)
            case .On:
                return ambient + 150.0
            case .Off:
                return ambient
        }
    }
    
    // zmienia (probuje) zmienic stan zarowki
    mutating func toggle(){     // musimy oznaczyc metode jako mutating po to by mogla ona modyfikowac self
        switch self{
        case .On:
            self = .Off
        case .Off:
            self = .On
        }
    }
    
}


// modelowanie wlaczenia zarowki
var bulb = Lightbulb.On
let ambientTemperature = 77.0
var bulbTemeprature = bulb.surfaceTemperatureForAmbientTemperature(ambient: ambientTemperature)
print("Temepratura żarówki wynosi \(bulbTemeprature).")

// testowanie toggle()
bulb.toggle()
var bulbTemeprature1 = bulb.surfaceTemperatureForAmbientTemperature(ambient: ambientTemperature)
print("Temepratura żarówki wynosi \(bulbTemeprature1).")

//                  powiazanie wartosci

// powiazane wartosci pozwalaja na dolaczenie danych do egzemplarzy typu wyliczeniwego, a
// poszczegolne bloki case moga miec inne typy powiazanych wartosci

enum ShapeDimension{
    // punkt nie ma powiazanej z nim wartosci, jest pozbawiony wymiarow
    case Point
        // wartosc powiazana z kwadratem to dlugosc jego boku
    case Square(Double)
        // wartosci powiazane z prostokatem to szerokosc i wysokosc
    case Rectangle(width: Double, height: Double)
    
    // uzywanie powiazanej wartosci do obliczenia powierzchni figury
    func area() -> Double{
        switch self{
        case let .Square(side):
            return side * side
        case let .Rectangle(width: w, height: h):
            return w * h
        case .Point:
            return 0
        }
    }
}

// tworzenie egzemplarzy z wartoscia pwoiazana (ShapeDimension)
var squareShape = ShapeDimension.Square(10.0)
var rectShape = ShapeDimension.Rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimension.Point

// obliczanie powierzchni figur:
print("Powierzchnia kwadratu = \(squareShape.area())")
print("Powierchnia prostokąta = \(rectShape.area())")
print("Powierzchnia punktu = \(pointShape.area())")
//          rekurencyjny typ wyliczeniowy


// towrzymy jakby drzewo
/*enum FamilyTree{
    case NoKnownParents
    case OneKnownParents(name: String, ancestors: FamilyTree)
    case TwoKnownParents(fatherName: String, fatherAncestors: FamilyTree,
        motherName: String, motherAncestors: FamilyTree)
} */


// blad kompilaji -> "Rekurencyjny typ wyliczeniowy 'FamilyTree' nie zostal oznaczony slowem
// kluczowym indirect" -> typ wyliczeniowy FamilyTree jest "rekurencyjny" poniwaz jego bloki
//  case maja powiazane wartosci, rowniez bedace typu FamilyTree
// trzeba okreslic ten enum jako indirect poniewaz kompilator nie wie ile pamieci bedzie musial
// przeznaczyc na pojedynczy egzemplarz FamilyTree

// Swift nie pozwala na jawne uzywanie wskaznikow ale tutaj pod maska tak wlasnie jest


// ponizej prawidlowy sposob zadeklarowania takiego drzewa:
indirect enum FamilyTree{
 case NoKnownParents
 case OneKnownParents(name: String, ancestors: FamilyTree)
 case TwoKnownParents(fatherName: String, fatherAncestors: FamilyTree,
 motherName: String, motherAncestors: FamilyTree)
 }


// nie trzeba calego typu wyliczeniowego oznaczac slowem kluczowym indirect -> mozna
// je zastosowac rowniez tylko dla poszczegolnych blokow case
 enum FamilyTreeSimplified{
             case NoKnownParents
   indirect  case OneKnownParents(name: String, ancestors: FamilyTree)
   indirect  case TwoKnownParents(fatherName: String, fatherAncestors: FamilyTree,
        motherName: String, motherAncestors: FamilyTree)
}

// utworzenie egzemplarza typu FamilyTree
let fredAncestors = FamilyTree.TwoKnownParents(fatherName: "Fred Senior", fatherAncestors: .OneKnownParents(name: "Beata", ancestors: .NoKnownParents), motherName: "Marta", motherAncestors: .NoKnownParents)


//          exercise:

enum ExerciseShapeDimension{
    case Point
    case Square(Double)
    case Rectangle(width: Double, height: Double)
    
    func area() -> Double{
        switch self{
        case let .Square(side):
            return side * side
        case let .Rectangle(width: w, height: h):
            return w * h
        case .Point:
            return 0
        }
    }
    
    // added function below
    func perimeter() -> Double{
        switch self{
        case let .Square(side):
            return 4 * side
        case let .Rectangle(width: w, height: h):
            return 2 * (w +  h)
        case .Point:
            return 0
        }
    }
}
let shapeDimension: ExerciseShapeDimension = ExerciseShapeDimension.Point
let shapeDimension1: ExerciseShapeDimension = ExerciseShapeDimension.Square(2.0)
let shapeDimension2: ExerciseShapeDimension = ExerciseShapeDimension.Rectangle(width: 2.0, height: 3.0)
print("\(shapeDimension.perimeter())  | \(shapeDimension1.perimeter()) | \(shapeDimension2.perimeter())")

//      STRUKTURY I KLASY








