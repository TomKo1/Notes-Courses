//
//  Town.swift
//  MonsterTown
//



// przyklad obrazujacy utworzenie struktury

import Foundation

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
