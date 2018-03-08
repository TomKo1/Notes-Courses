
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

myTown.changePopulation(amount: 500)

myTown.printTownDescription()
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








