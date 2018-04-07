//: Playground - noun: a place where people can play

import UIKit

// typ wartosci -> na przyklad struktura
// typ odwolania -> na przyklad klasa

var str = "Witaj, playground"
var playgroundGreeting = str

playgroundGreeting += "! Jak się dzisiaj czujesz?"

str
// pomimo zminy wartosci zmiennej playgroundGreeting wartosc egzemplarza str
// pozostala taka sama -> wynika to z SEMANTYKI WARTOSCI

// mozna na podstawie dokumentacji dowiedziec sie ze String jest implementowany jako struktura
// w bibliotece standardowej jezyka Swift; co wiecej String jest typem wartosci

// TYPY WARTOSCI SA ZAWSZE KOPIOWANE PODCZAS ICH PRZYPISYWANIA EGZEMPLARZOWI
// LUB PRZEKAZYWANIA W POSTACI ARGUMENTU FUNKCJI

// PODSTAWOWE TYPY JEZYKA SWIFT NP. Array, Dictionary, Int, String ITD. SA IMPLEMENTOWANE
// JAKO STRUKTURY, CZYLI TYPY WARTOSCI

//                  SEMANTYKA ODWOLANIA

// w przypadku semantyki odwolania w czasie przekazywania jej jako argumentu funkcji czy
// podczas przypisywania jej do nowej zmiennej czy stalej operacje te powoduja utworzenie
// dodatkowego odwolania do tego samego egzemplarza

class GreekGod{
    var name: String
    init(name: String){
        self.name = name
    }
}

let hecate = GreekGod(name: "Hekate")
let anotherHecate = hecate
// w tym momencie mamy dwie stale (hecate i anotherHecate) wskazujace na ten sam
// egzemplarz klasy GreekGod

anotherHecate.name = "InnaHecate"
anotherHecate.name
hecate.name
//              WARTOSC STALEJ I TYP ODWOLANIA

struct Panthenon{
    var chiefGod: GreekGod
}

let pantheon = Panthenon(chiefGod: hecate)
let zeus = GreekGod(name: "Zeus")
//panthenon.chiefGod = zeus
// w przypadku typow wartosci zadeklarowanych jako stale nie mozna zmieniac ich
// wlasciwosci, nawet jesli w implementacji zostaly zdefiniowane za pomoca slowa kluczowego var


// to nie wynika z let -> pomimo, ze zeus jest zadeklarowany jako let to kompilator nie zglasza
// absolutnie zadnych zastrzezen
zeus.name = "Zeus Jr."
zeus.name
//              UZYCIE TYPOW WARTOSCI I ODWOLANIA RAZEM

// mozna umieszczac typ odwolania wewnatrz typu wartosci i odwrotnie
// nalezy zachowac duza ostroznosc podczas uzywania typu odwolania wewnatrz typu wartosci

pantheon.chiefGod.name // "InnaHekate"
let greekPantheon = pantheon // pantheon to typ wartosci -> powinienem oczekiwac otrzymania przez greekPantheon kopii panthon
hecate.name = "Triwium"
greekPantheon.chiefGod.name

// "NIESPODZIANKA"  wlasciwosc chefGod jest typu GreekGod -> to klasa, a wiec typ
// odwolania -> wiec zmiana stalej hecate spowoduje zmianne tez "srodka" tej struktury

// obrazuje to trudnosci zwiazane z umieszczaniem typu odwolania wenwatrz typu
// wartosci


//                      NIEMODYFIKOWALNE TYPY ODWOLANIA

// nejlepiej omijac umieszczanie typow odowlania wewnatrz typow wartosci -> moizemy miec potem "klopoty"
// JEZELI ZAJDZIE POTRZEBA UMIESZCZENIA WLASCIWOSCI TYPU ODWOLANIA WEWNATRZ STRUKTURY
// TO NAJLEPSZYM ROZWIAZANIEM BEDZIE ZASTOSOWANIE NIEMODYFIKOWALNEGO EGZEMPLARZA

struct SecondPantheon{
    let chiefGod: GreekGod
    let dateCreated = NSDate() // NsDate zwraca bierzaca date -> nie zawiera zadnych modyfikowalnych
    // wlasciwosci -> nie mozna jej zmodyfikowac
}
//                  KOPIOWANIE

// SWIFT NIE OFERUJE NA POZIOMIE JEZYKA ZADNEJ OBSLUGI DO TWORZENIA KOPII GLEBOKIEJ
// CZYLI WSZYSTKIE UTWORZONE W Swifcie kopie sa plytkie

let athena = GreekGod(name: "Athena")
let gods = [athena, hecate, zeus]
let godsCopy = gods
gods.last?.name = "Jowisz"
gods
godsCopy

// tablice to typy wartosci i oczekiwaniem jest to aby tablica godsCopy byla oddzielna
// kopia tablich gods ... jednak zmiana elmentu w jednej tablicy zostala odzwierciedlona w 2
// tablica zaweira elementy typu GreekGod -> typ odwolania dlatego
// tez tablica godsCopy wspoldzieli wraz z tablica gods
// te same odowlania do egzemplarzy GreekGod


//                  IDENTYCZNOSC KONTRA ROWNOSC

// rownosc -> dwa egzemplarze typu String zawieraja ten sam ciag tekstowy (operator ==)
//  identycznosc -> dwie zmienne lub stale odwoluja sie do tego samego egzemplarza w pamieci (operator ===)

// jesli chcemy sprawdzic rownosc w utworzonej przez siebie klasie, musimy ja tego "nauczyc"
// przez implementacje funkcji == -> to wymaga zgodnosci z protokolame Equatable

//              KTOREGO ROZWIAZANIA POWINIENES UZYWAC? (STRUKTURA VS KLASA)


// 1. Jezeli typ przez wartosc to struktura -> gwarancja kopiowania
// 2. jezeli nie potrzebujemy dziedziczenia -> struktura
// 3. w innych przypadkach klasa


// struktury -> do modelowania ksztaltow, zakresow, punkty w ukladzie XY, dosnokanle
//              do struktur danych -> np. String



// oznaczenie klasy jako final ( final class { ... } ) uniemozliwi
// tworzenie podklasy klasy, a poandto zaoferuje semantyke odwolania do egzemplarzy klasy















