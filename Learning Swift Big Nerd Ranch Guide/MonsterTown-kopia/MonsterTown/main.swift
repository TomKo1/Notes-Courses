
//  main.swift
//  MonsterTown


import Foundation // to polecenie wczytuje framework o nazwie Founadation
// framework ten zawiera wiele klas przeznaczonych do pracy przede wszystkim z Objective-C

// w budowanym tutaj narzedziu powloki plik main.swift przedstawia punkt wejscia do programu
// w pliku tym zwykle znajduje sie kod "najwyzszego poziomu", czyli niezawarty wewnatrz implementacji
// jakiejkolwiek funkcji lub niezdefiniowany w opkreslonym typie (takim jak struktura czy klasa)

// znajdujacy sie tutaj kod jest zwykle odpowiedzialny za konfiguracje aplikacji


//              struktury

// tworzenie egzempalrzy struktury Town

var myTown = Town()
// print("Populacja: \(myTown.population), liczba skrzyżowań z sygnalizacją świetln \(myTown.numberOfStoplights).")

// uzycie metody egzemplarza:
myTown.printTownDescription()

myTown.changePopulation(amount: 1000000)

myTown.printTownDescription()

print("Wielkość miasta: \(myTown.townSize), populacja: \(myTown.population)")

/*
let gm = Monster()
gm.town = myTown
gm.terrorizeTown()
*/
let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printTownDescription()

fredTheZombie.changeName(name: "Fred The Zombie", walksWithLimp: false)

let vampire1 = Vampire()
vampire1.changeName(name: "Vamnpire1", town: myTown)
print(vampire1.name)
print(vampire1.terrorizeTown())
print(vampire1.terrorizeTown())
print(vampire1.terrorizeTown())
print(vampire1.vampires.count)

print("Number of suqre sides: ")
print(Square.numberOfSidses())

// uzycie wlasciwosci oblicznej:
print("Pula ofiar: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
//print("Pula ofiar: \(fredTheZombie.victimPool); populacja: \(fredTheZombie.town?.population)")


//  obserwator wlasciwosci monitoruje odpowiednia wlasciwosc i odpowiednio reaguje w przypadku
// wszelkich zmian; mozliwosc obserwacji wlasciwosci jest dostepna dla kazdej zdefiniowanej
// wlasciwosci skladowej, a takze dla wszystkich dziedziczonych wlasciwosci
//  OBSERWACJI WLASCIWOSCI NIE MOZNA UZYC DLA ZDEFINIOWANYCH WLASCIWOSCI OBLICZANYCH
    // (ZACHOWUJEMY JEDNAK PELNA KONTROLE NAD DEFINICJA METODY SETTER I GETTER WLASCIWOSCI
    // OBLICZANEJ ORAZ MOZEMY WTEDY ODPOWIEDNIO NA TAKA ZMIANE ZAREAGOWAC)
// Zmiany wprowadzane we wlasciwosci mozna obserwowac na dwa sposoby:
//  -> gdy wartosc wlasciwosci ma ulec zmianie (willSet)
//  -> gdy wartosc wlasciwosci ulega zmianie (didSet)

// -> przyklad znajduje sie w struct Town


//              WLASCIWOSCI TYPU -> jak static w Javie
// wlasciwosci typu pozostaja uniwersalne dla typu -> wartosci tych wlasciwosci beda
//              wspoldzielone miedzy wszystkimi egzemplarzami typu
//-> takie wlasciwosci deklarujemy przy pomocy static (Weee Java!) -> przyklad w Town 
// klasy rowniez moga miec skladowe i obliczane wlasciwosci typu; podobnie jak struktury
// uzywaja tej samej skladni ze slowem kluczowym static
//  JEZELI CHCEMY ABY PODKLASA MIALA MOZLIWOSC DOSTARCZENIA WLASNEJ IMPLEMENTACJI
//     WLASCIWOSCI, TO ZAMIAST WYMIENIONEGO NALEZY UZYC SLOWA CLASS  -> przyklad w klasie Zombie

print(Zombie.spookyNoise)

if Zombie.isTerrifying {
    print("Uciekaj!")
}

//                  KONTROLA DOSTEPU


//      kontrola dostepu opiera sie na dwoch waznych i powiazanych ze soba koncepcjach:
//      -> modulu -  jednostka rozprowadzanego kodu (np. UIKit Cocoa -> frameworki laczace w sobie
// wiele powiazanych typow wykonujacych polaczone ze soba zadania ; w jezyku Swift moduly sa
//          dolaczane w innych modulach za pomoca SLOWA KLUCZOWEGO import
//      -> plikach zrodlowych - oddzielne jednostki kodu, przedstawiaja poszczegolne pliki znajdujace
//          sie w okreslonych mpdulach  ; dobra praktyka jest definiowanie w pliku
//          zrodlowym tylko jednego typu



//              KONTROLA DOSTEPU W JEZYKU SWIFT
//      publiczny (public) -> oznacza, że dana encja jest widoczna we wszystkich plikach danego modulu
//                  lub importujacych ten mopdul
//      wewnetrzny (internal) -> jest domyslny, oznacza ze dana encja jest widoczna we wszystkich
//                  plikach tego samego modulu
//      prywatny (private) -> dana encja widoczna jest jedynie w pliku zrodlowym w ktorym
//                  zostala zdefiniowana
// -> przyklad w klasie Zombie
print("---------")
var town: Town = Town()
town.population = 100000
town.mayor = Mayor()
town.changePopulation(amount: -100)
town.changePopulation(amount: 100)
town.changePopulation(amount: 100)
town.changePopulation(amount: 100)
print("---------")


