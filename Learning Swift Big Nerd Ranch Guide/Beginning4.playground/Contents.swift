//: Playground - noun: a place where people can play

import UIKit

//                      FUNKCJE

//         prosta funkcja:
func printGreetings(){
    print("Witaj w playground!")
}
// wywolanie takiej
printGreetings()
//         parametry funkcji
func printPersonalGreetings(name: String){
    print("/(name), witaj w pliku typu playground")
}
// wywolanie takiej funkcji:
printPersonalGreetings(name: "Mateusz")

//przykladowa funkcja przeprowadzajaca dzielnie:
func divisionDescription(num: Double,den: Double ){
    print("\(num) dzielenie przez \(den) daje \(num / den) ")
}
// wywolanie
divisionDescription(num: 9.0, den: 3.0)
//          nazwa parametrow (nazy zewnetrzne)
func divisionDescriptionNamed(forNumerator num: Double, andDenominator den: Double){
    print("\(num) dzielenie przez \(den) daje \(num / den) ")
}
// wywolanie takiej funkcji -> uzywamy teraz jawnie tych zewnetrznych nazw

divisionDescriptionNamed(forNumerator: 9.0, andDenominator: 3.0)

//parametry wariadyczne (variadic)

func printPersonalGreetings(names: String...){
    for name in names{
        print("\(name), witaj w pliku typu playground!")
    }
}
printPersonalGreetings(names: "Aleksy","Krzysztof","Dorota","Paulina")
//         wartość domyślna parametru
func divisionDescription2(forNumerator num: Double, andDenominator den: Double, withPunctuation punctuation: String = "."){
    print("\(num) dzielone przez \(den) daje \(num / den)\(punctuation)")
}
divisionDescription2(forNumerator: 9.0, andDenominator: 3.0)
divisionDescription2(forNumerator: 9.0, andDenominator: 3.0,withPunctuation: "!")
//      parametry in-out
// czsami istnieje powod, aby funkcja, tak zwane parametry in-out pozwalaja funkcji miec wplyw na zmienna
// pozostajaca poza definicja funkcji
// trzeba jednak pamietac o:
// 1. Parametr in-out nie moga miec wartosci domyslnych
// 2. Parametry wariadyczne nie moga byc oznaczane jako inout.

var error = "Żądanie zakończyło się niepowodzeniem: "
func appendErrorCode(code: Int, toErrorString errorString: inout String){
    if code == 400{
        errorString += " nieprawidłowe żądanie"
    }
}

appendErrorCode(code: 400, toErrorString: &error)
print(error)
//      zwrot wartości przez funkcje
func divisionWithReturnString(forNumerator num: Double, andDenominator den: Double, withPunctuation punctuation: String = ".") -> String{
    return "\(num) dzielone przez \(den) daje \(num / den)\(punctuation)"
}
var returnedValue = divisionWithReturnString(forNumerator: 9.0, andDenominator: 3.0,withPunctuation: "!")
print(returnedValue)
//      funkcje zagnieżdżone i zasięg

// uzyteczne gdy potrzebna jest funkcja do wykonania pewnego zadania ale
// tylko wewnatrz innej funkcji
func areaOfTriangle(withBase base: Double, andHeight height: Double) -> Double{
    let numerator = base * height
    func divide() -> Double{
        return numerator / 2
    }
    return divide()
}

areaOfTriangle(withBase: 3.0, andHeight: 5.0)

//     zwrot wielu wartosci
// zwrot weilu wartosci w jezyku Swift umozliwia krotka
// jedynym argumentem tej funkcji jest tablica licz calkowitych
// wartoscia zwrotna funkcji jest tzw. nazwana krotka
// mozemy powiedziec ze krotka jest nazwana, bo tworzace ja elementy sa nazwane
func sortEvenOdd(numbers: [Int]) -> (evens: [Int], odds: [Int]){
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers{
        if number % 2 == 0{
            evens.append(number)
        }else{
            odds.append(number)
        }
    }
    return (evens, odds)
}
// wywolanie:
let aBunchOfNumbers = [10, 1, 4, 3, 57, 43, 84, 27, 156, 111]
let theSortedNumbers = sortEvenOdd(numbers: aBunchOfNumbers)
print("Liczbami parzystymi sa: \(theSortedNumbers.evens) liczbami; nieparzystymi sa: \(theSortedNumbers.odds)")
//          wartosc zwrotna typu Optional
// wykorzystujemy to gdy chcemy aby w pewnych sytuacjach wartoscia zwracana funkcji moze byc typ nil

// funkcja ta jako argument pobiera krotke typu (String, String?, String)
// egzempalrz drugiego String zostal zdefiniowany jako Optional -> moze byc, a moze nie

func grabMiddleName(name: (String, String?, String) ) -> String?{
    return name.1 // zwracamy drugi String -> czasami moze to byc Nil -> musimy zwrocic Optional
}

let middleName = grabMiddleName(name: ("Mateusz", nil, "Mateuszewski"))
if let theName = middleName{
    print(theName)
}

//         wczesniejsze zakonczenie wykonywania funkcji
func greetMiddleNameEarly(name: (first: String, middle: String?, last: String)){
    // funkcja guard pozwala na wczesniejsze zakonczenie wykonywania
    //funkcji, jesli pewien warunek nie zostal spelniony
    guard let middleName = name.middle else{ // jesli typ Optional nie bedzie zawieral wartosci
        // to nastapi wykoanie kodu zdefiniowanego w poleceniu guard
        print("Witaj!")
        return
    }
    print("Czesc, \(middleName)!")
}

//          typy funkcji

// na typ funkcji skladaja sie typy parametrow i wartosci zwracane funkcji
// funkcja sortEvenOdds(numbers: [Int]) -> (evens: [Int], odds: [Int])
// funkcja ta pobiera tablice liczb calkowitych i zwraca krotke wraz z dwiema tablicami liczb calkowitych
// -> jej typ to ([Int]) -> ([Int], [Int])

// TYPY FUNKCJI MOZNA PRZYPISYWAC ZMIENNYM -> COS JAK WSK DO FUNKCJI W C/C++
let evenOddFunction: ([Int]) -> ([Int],[Int]) = sortEvenOdd
// teraz mozemy taka funkcje wywolywac jak nizej:
evenOddFunction([1,2,3])
//                 zadanie na brazowy medal
// zmodyfikowac greetByName o klauzule where w guard ktora sprawdza czy drugie imie sklada sie z mniej
// niz 4 znakow

func greetByMiddleName1( name: (first: String, middle: String?,
                             last: String) )                         {
                                
                                guard let middleName = name.middle,
                                        name.middle!.count < 4 else  {
                                        
                                        print("Hej!")
                                        
                                        return
                                        
                                }
                                
                                print("Hej, \(middleName)!")
    
}
// proba:
greetByMiddleName1(name: (first: "Tomek", middle: "Marek", last: "Kot"))
greetByMiddleName1(name: (first: "Tomek", middle: "Jan", last: "Kot"))

//      zadanie na srebny medal
func beanSifter(groceryList groceryListP: [String]) -> (beans: [String], otherGroceries: [String]){
    var beans = [String]()
    var otherGroceries = [String]()
    
    for item in groceryListP{
        if item.hasSuffix("fasola"){
            beans.append(item)
        }else{
            otherGroceries.append(item)
        }
    }
    return (beans, otherGroceries)
}



let result = beanSifter(groceryList: ["zielona fasola",
                                      "mleko",
                                      "czarna fasola",
                                      "fasola pinto",
                                      "jabłka"])
print(result.beans)
print(result.otherGroceries)





