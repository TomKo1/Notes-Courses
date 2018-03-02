//: Playground - noun: a place where people can play

import UIKit

//                  DOMKNIECIA
//  Domkniecia to odzzielne pakiety funkcjonalnosci, ktora mozna wykorzystac w aplikacji do wykonania
// okreslonych zadan ; funkcje mozna potraktowac jako nazwane domkniecie

//      skladnia domkniecia
// Przyklad sortowanie:
// funkcja sort(isOrderedBefore:) pobiera 1 argument bedacy domknieciem okreslajacym w jaki
// sposob w jaki przeprowadza sie sortowanie
var volunteerCounts = [1,3,40,32,2,53,77,13]

func sortAscending(i: Int, j: Int) -> Bool {
    return i<j
}
let volunteersSorted = volunteerCounts.sorted(by: sortAscending)
//      skladnia wyrazenia domkniecia
/*
 { (parametry) -> typ wartości zwrotnej in
        // kod
 }
 */
// refakotryzacja kodu odpowiedzialnego za sortowanie tablicy:
let volunteersSortedSimplified = volunteerCounts.sorted(by:  {
    (i: Int, j: Int) -> Bool in
            return i < j
})
/*
for number in volunteersSortedSimplified{
    print(number)
}
*/

// wykorzystanie zalet interferencji typu
let volunteersSortedSimplifiedVol2 = volunteerCounts.sorted(by: { i, j in i < j} )
// mozemy pozbyc sie informacji o typie wartosci zwrotnej, poniewaz kompilator wie
// ze wynikiem sprawdzenia i < j jest Bool
// slowo kluczowe return zostalo usuniete poniewaz "cialo" sklada sie tylko z jednego wiersza
// jak jest wiecej to trzeba dac return

// Swift oferuje skroty nazw argumentow, do ktorych mozna sie odwolywac w osadzonym wyrazeniu domkniecia
// np. w powyzszym przykladzie domkniecie ma 2 argumenty -> mozna sie do nich odnosic w postaci:
// $0 ( pierwszy ) i $1 ( drugi )
let volunteerSortedShortcuts = volunteerCounts.sorted(by: { $0 < $1 })

// jezeli domkniecie jest przekazywane jako ostatni argument funkcji moze byc zapisane
// w postaci osadzonej -> na zewnatrz i po nawiasie funkcji
let volunteerSortedTheMostSimplified = volunteerCounts.sorted { $0 < $1 }
print(volunteerSortedTheMostSimplified)
print("----------------")

//          funkcja jako typ wartosci zwrotnej

// w jezyku Swift funkcje są obiektami pierwszej klasy, jedna z implantacji tego faktu jest to, ze funkcja moze zwrocic inna
// funkcje jako swoj typ wartosci zwrotnej

// w ponizszym przykladzie zwracana funkcja jest funkcja zagniezdzona o nazwie buildRoads(lightsToAdd: toLights); typ jej argumentow i wartosci
// zwrotnej pasuja do zadeklarowanych w makeTownGrand()

func makeTownGrand() -> (Int, Int) -> Int {
    func buildRoads(lightsToAdd: Int, toLights: Int) -> Int{
        return toLights + lightsToAdd
    }
    return buildRoads
}

// przyklad uzycia powyzszych funkcji:
var stoplights = 4
let townPlan = makeTownGrand()
stoplights = townPlan(4, stoplights)
print("Knowhere ma \(stoplights) skrzyżowań z sygnalizacją świetlną.")
//         funkcja jako argument
print("----------------")

// zwracamy typ Optional bo funkcja jest zwracana tylko jesli spelnionty jest condition (miasto ma środki na budowe dróg)
func makeTownGrandNew(budget: Int, condition: (Int) -> Bool) -> ((Int, Int) -> Int)?{
    if condition(budget){
        func buildRoads(lightsToAdd: Int, toLights: Int) -> Int{
            return toLights + lightsToAdd
        }
        return buildRoads
    }else{
        return nil
    }
}

func evaluateBudget(budget: Int) -> Bool{
    return budget > 10000
}

var stoplightsNew = 4
if let townPlan = makeTownGrandNew( budget: 1000,condition:  evaluateBudget){
    stoplightsNew = townPlan(4, stoplights)
}
print("Knowhere ma \(stoplightsNew) skrzyżowań z sygnalizacją świetlną.") // tyle samo co w linii z deklaracja bo warunek nie byl spelniony
print("----------------")
if let townPlan = makeTownGrandNew( budget: 10500,condition:  evaluateBudget){
    stoplightsNew = townPlan(4, stoplights)
}
print("Knowhere ma \(stoplightsNew) skrzyżowań z sygnalizacją świetlną.") // tutaj warunek spelniony wiec liczba swiatel sie zwiekszy
print("----------------")
//          wartosci przechwytywane przez domkniecie
func makeGrowthTracer(forGrowth growth: Int ) -> () -> Int{
    var totalGrowth = 0
    func growthTracer() -> Int{
        totalGrowth += growth
        return totalGrowth
    }
    return growthTracer
}
var currentPopulation = 5422
let growBy500 = makeGrowthTracer(forGrowth: 500)
// funckja growthTracer monitoruje (inkrementuje o 500 w kazdym wywolaniu) wartosc zmiennej totalGrowth
// wywolujemy f. growBy500() 4 razy celem zwiekszenia zmiennej totalGrowth do 2000
growBy500()
growBy500()
growBy500()


currentPopulation += growBy500() // dodajemy 2000 -> currentPopulation wynosi teraz 7422
//          domkniecie jako typ odwolania

// domkniecia sa typami odwolania, to oznacza, ze po przypisaniu funkcji do stalej lub zmiennej tak naprawde
// wskazujemy tej stalej lub zmiennej odwolanie do danej funkcji -> nie tworzymy oddzielnej kopii funkcji

//aby to pokazac:
let anotherGrowBy500 = growBy500
anotherGrowBy500() // wartosc totalGrow teraz to 2500 -> czyli jest odolanie bo inkrementujemy od 2000 a nie od 0
// ale (sprobujmy stworzyc teraz nowe domkniecie przechwytujace wartosci) -> bedziemy inkrementowac jakby od 0 znowu
var someOtherPopulation = 4061981
let growBy10000 = makeGrowthTracer(forGrowth: 10000)
someOtherPopulation += growBy10000()
currentPopulation // currentPopulation nie uleglo zmianie
//              Programowanie funkcyjne
// Funkcje pierwszej klasy - funkcje moga byc przekazywane jako argumenty innych funkcji, przechowywanie w zmiennych itd. Po prostu sa traktowane tak samo
// jak kazdy inny typ

// Swift oferuje kilka tzw. funkcji wyzsego rzedu -> sa to np. funkcje jak map(_:), filter(_:) czy reduce(_:)

//              funkcje wyzszego rzedu
// funkcje wyzszego rzedu pobieraja przynajmniej jedna funkcje jako dane wejsciowe

//              funkcja map(_:)
// funkcja map jest uzywana do transofmacji zawartosci tablicy, przeprowadza sie tzw. mapowanie zawartosci tablicy z jednej wartosci na inna
// i umieszcza sie nowe wartosci w nowej tablicy
// jest to funkcja wyzszego poziomu -> dostarcza sie jej inna funkcje okreslajaca sposob transformacji zawartosci tablicy

let percintPopulations = [1244, 2021, 2157]
let projectedPopulations = percintPopulations.map{
    (population: Int) -> Int in
    return population * 2
}
projectedPopulations
// domkniecie funkcji map bierze za argument parametr population typu Int i dla kazdego elementu tablicy na ktorej zostala wywolana
// funkcja (metoda) map stosuje przekazane domkniecie -> w wyniku tej operacji powstaje nowa tablica

//          funkcja filter(_:)
// zadaniem tej funkcji jest filtrowanie tablicy na podstawie pewnych kryteriow


let bigProjections = projectedPopulations.filter{
    (projection: Int) -> Bool in
    return projection > 4000
}
bigProjections // w tablicy bigProjections znalazly sie tylko elementy ktore byly wieksze od 4000
//          funkcja reduce(_:combine)
// zadaniem funkcji reduce jest redukcja wartosci w kolekcji do pojedynczej wartosci zwroconej przez funkcje
let totalProjection = projectedPopulations.reduce(0) {
    (accumulatedProjection: Int, precinctProjection: Int) -> Int in
    return accumulatedProjection + precinctProjection // pierwszy argument (to 0) to wartosc poczatkowa natepnie domkniecie przekazane akumuluje poszczegolne elmenty ( tutaj: dodaje je do siebie)
}
totalProjection

//                  EXERCISE
let myTotalProjection = projectedPopulations.reduce(0) { $0 + $1 }
  print(myTotalProjection)

//                              TYPY WYLICZENIOWE, STRUKTURY I KLASY








