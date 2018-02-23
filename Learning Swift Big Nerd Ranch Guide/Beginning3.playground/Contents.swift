//: Playground - noun: a place where people can play

import UIKit

//              KOLEKCJE I FUNKCJE
//              TABLICE
//TWORZENIE TABLICY
var bucketList : Array<String> = [] // jezeli nie dam = [] to bedzie to tablica niezainicjalizowana -> bledy
// inna skladnia (z inicjalizacja tablicy)
var bucketList2 : [String] = ["Zdobyć Moint Everest"]
// przy tworzeniu tablic mozemy rowniez skorzystac z inteferencji typu:
var bucketList3 = ["Zdobyć Mount Everest"]
// uzyskanie doestepu do tablicy i jej modyfikacja

bucketList3.append("Polecieć balonem na Fidżi")
bucketList3.append("Obejrzeć w jeden dzień trylogię Władca Pierścieni")
bucketList3.append("Udać się na wędrówkę")
bucketList3.append("Nurkować w Wielkiej Błęknitnej Dziurze")
bucketList3.append("Znaleźć potrójną tęczę")
// usuwanie elementu z tablicy
bucketList3.remove(at: 2)// usuwamy 3 element -> tablice w Swifcie sa indeksowane od 0
print("-----------")
print(bucketList3)
// ustalanie liczby elementow znajdujacych sie w tablicy:
print(bucketList3.count)
// skladnia subskrypcji -> pobieranie pewnego zakresu tablicy
print(bucketList3[0...2])
// modyfikowanie elementu pod danym indeksem:
bucketList3[2] += " po Australii"
// uzycie petli w celu umieszczenia w tablicy elementow pochodzacych z innej tablicy
var newItems = [
        "Polecieć balonem na Fidżi",
        "Obejrzeć w jeden dzień trylogię Władca Pierścieni",
        "Udać się na wędrówkę",
        "Znaleźć potrójną tęczę",
        "Zdobyć Mount Everest"]

for item in newItems{
    bucketList.append(item)
}

print(bucketList)

// mozemy rowniez dodawac tablic do tablicy:
print(bucketList.count)
bucketList += newItems
print(bucketList.count)
//dodawanie elementu pod wskazany indeks
bucketList.insert("Przejechać sankami przez Alaskę",at: 2)

// porownywanie tablic operatorem ==
// Uwaga -> dwie tablice, ktore zawieraja te same elmenty ale ulozone w innej kolejnosci sa rozne !
let equal = (bucketList == bucketList3)
print(equal)

// TABLICE NIEMODYFIKOWALNE
let lunches = [
    "Cheesburger",
    "Pizza",
    "Sałatka z kurczakiem",
    "Burrite z czarną fasolką",
    "Falafel"]

//      nie mozemy zmodyfikowac tablicy utworzonej przy pomocy slowa kluczowego let:
//lunches.append("Bigos") //ERROR
//lunches.insert("Pizza", at: 2)//ERROR

//                  EXERCISE 1:
var toDoList = [ "Wyrzucić śmieci", "Zapłacicć rachunki", "Skreślić zrobione rzeczy"]
print("Is toDoList empty?")
print(toDoList.isEmpty)
//                 EXERCISE 2:
// iterates in reversed order
for i in toDoList.reversed(){
    print(i)
}

//              SŁOWNIKI
// Dictionary to ty kolekcji, ktory przechowuje wartosci w postaci par klucz-wartosc
// klucze w egzemplarzach typu Dictionary musza byc unikatowe

//              utworzenie slownika:
// ogolna skladladnia: var dict: Dictionary<TypKlucza, TypWartosci>
// jedyne wymaganie dotyczace typu klucza slownika to mozliwosc wygenerowania dla niego wartosci hash
// typy podstawowe w jezyku Swift, takie jak String, Int, Float, Double i Bool, pozwalaja
// na wygenerowanie dla nich wartosci hash

// rozne sposoby utworzenia zainicjowanych, pustych slownikowL
var dict1: Dictionary<String, Double> = [:]
var dict2 = Dictionary<String, Double>()
var dict3: [String:Double]=[:]
var dict4 = [String:Double]()
//                      Zapelnianie slownika:
// (do inicjalziacji slownika korzystamy z interferencji("domyslenia sie" typu)
var movieRatings = ["Donnie Darko":4, "Chucking Express": 5, "Mroczne miasto":4]
//                      Uzyskanie dostepu do slownika i jego modyfikacja:

// wlasciwosc count jest w egzemplarzu typu Dictionary tylko do odczytu i podaje liczbe egzemplarzy
// przechowywanych w slowniku
print("Oceniłem \(movieRatings.count) filmy.")
// odczyt danych ze slownika:
let darkoRating = movieRatings["Donnie Darko"]
// modyfikacja wartosci w slowniku
movieRatings["Mroczne miasto"] = 5
movieRatings
// mozna modyfikowac jeszcze przy pomocy metody updateValue(_:forKey)
//movieRatings.updateValue(2, forKey: "Mroczne miasto")
//movieRatings["Mroczne miasto"]
// uaktualnianie wartosci slownika i uzycie dolaczania tpu optional (metoda updateValue zwraca typ optional)
let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating: Int? = oldRating, let currentRating = movieRatings["Donnie Darko"]{
    print("Poprzednia ocena: \(lastRating); aktualna ocena: \(currentRating)")
}
//                  dodawanie i usuwanie wartosci
// dodawanie wartosci:
movieRatings["Gabinet doktora Caligari"] = 5
// usuniecie
movieRatings.removeValue(forKey: "Mroczne miasto")// usuwa pare klucz-wartosc
// usuniecie pary klucz-wartosc moze sie odbyc takze przez przypisanie wartosci nil kluczowi:
movieRatings["Mroczne miasto"] = nil
//                 uzycie petli wraz ze slownikiem
for (key, value) in movieRatings{
    print("Film \(key) otrzymał ocenę \(value)")
}
print("----")
// uzyskiwanie dostepu do kluczy lub wartosci odzielnie:
for movie in movieRatings.keys{
    print("Użytkownik ocenił film \(movie)")
}

//              slowniki niemodyfikowalne
let album = ["Diet Roast Beef": 268,
             "Dubba Dubbs Stubs His Toe":467,
             "Smokey's Carpet Cleaning Service":187,
             "Track 4":221]
print("----")
//              konwersja slownika na tablice
//przykladowo: przekazanie kluczy slownika do tablicy
let watchedMovies = Array(movieRatings.keys)
//              EXERCISE
var wojewodztwa = ["łódzkie":["94-232","94-323","94-232"],
                   "mazowieckie":["89-909","89-980","98-909"],
                   "wielkopolskie":["76-989","76-678","76-123"]]
// teraz wyciagamy same kody pocztowe ze slownika
var kodyWojew = Array(wojewodztwa.values)
for element in kodyWojew{
    print("Kody \(element)")
}
//kodyWojew[1]
//print(wojewodztwa["łódzkie"])
//                                  ZBIORY
// zbiory to typ Set -> wlasciwie obiekty typu Set
// [klasycznie] Zbior to unikatowa kolekcja roznych egzemplarzy -> jak w matmie
//              utworzenie zbioru
var groceryBag = Set<String>()

// za pomoca metody insert(_:) mozna dodac owoce do naszego zbioru:
groceryBag.insert("Jabłka")
groceryBag.insert("Pomarańcze")
groceryBag.insert("Ananasy")
// oczywiscie mozemy tez przeprowadzac iteracje:
for food in groceryBag{
    print(food)
}
//          tworzenie zbioru jeszcze prosciej -> od Swift 2.0
var groceryBag2 = Set(["Jabłka","Pomarańcze","Ananasy"]) // tutaj tworzymy typ Set na podstawie typu Array
print("-----")
print(groceryBag2)
print("-----")
// mozna tez tworzyc Set jak ponizej:
var groceryBag3:Set = ["Jabłka","Pomarańcze","Ananasy"]
//            praca ze zbiorami
let hasBananas = groceryBag.contains("Banany")
print(hasBananas)
//             unie ( laczenie zbiorow)
let friendsGroceryBag = Set(["Banany", "Płatki zbożowe", "Mleko", "Pomarańcze"])
groceryBag
// metoda union tworzy sume zbiorow (tablic (Array) lub zbiorow (Set))
let commonGroceryBag = groceryBag.union(friendsGroceryBag)
//             część wspólna zbiorów
let roommatesGroceryBag = Set(["Jabłka", "Banany", "Płatki zbożowe", "Pasta do zębów"])
let itemsToReturn = commonGroceryBag.intersection(roommatesGroceryBag)
//              wykrycie czesci wspolnej zbiorow (czy sa rozlaczne)
let yourSecondBag = Set(["Jagody", "Jogurt"])
let roommatesSecondBag = Set(["Winogrono", "Miód"])
let disjoint = yourSecondBag.isDisjoint(with: roommatesSecondBag) // true bo zbiory sa rozlaczne
//                  EXERCISE
// sprawdzanie czy jeden zbior jest nadzbiorem 2
let myCities  = Set(["Atlanta", "Chicago","Jacksonville","Nowy Jork", "San Francisco"])
let yourCities = Set(["Chicago", "San Francisco", "Jacksonville"])
myCities.isSuperset(of: yourCities)
//                 EXERCIES
// metody przeprowadzajace sume logiczna, przeciecie zbiorow w miejscu
print(groceryBag3)
groceryBag3.formIntersection(friendsGroceryBag) // intersection in place
print("------")
print(groceryBag3)
print("------")
groceryBag3.formUnion(friendsGroceryBag)// union in place



print(myCities)











