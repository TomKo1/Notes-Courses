//
//  Town.swift
//  MonsterTown
//



// przyklad obrazujacy utworzenie struktury
import Foundation
// wlasciwosci sa dostepne w dwoch rodzajach:
// SKLADOWANE - moze miec przypisana wartosc domyslna
// OBLICZANE - moze zwracac wynoik pewnych obliczen przeprowadzanych na podstawie dostepnych informacji
// wlasciwosci mozna monitorowac pod katem zmian i wykonywac okreslony kod, gdy wlasciwosci ma byc przypisana nowa
// wartosc




struct Town {
    // ponizej deklarujemy tzw WLASCIWOSCI  -> sa to  zmmienne lub stale
    var population = 5422
    var numberOfStoplights = 4
    
    // metoda egzemplarza
    func printTownDescription() {
        print("Populacja: \(population), liczba skrzyżowań z sygnalizacją świetln \(numberOfStoplights).")
    }
    
    // jezeli metoda egzemplarza w strukturze zmienia jakakolwiek wlasciwosc struktury, musi
    // byc oznaczona jako mutujaca -> mutating
    
    // mutating -> zarowno przy enum jak i przy klasach oznacza ze metoda ta moze zmienaic
    // wlasciwosci
    mutating func changePopulation(amount: Int){
        population += amount
    }
    
    
    
    
}
