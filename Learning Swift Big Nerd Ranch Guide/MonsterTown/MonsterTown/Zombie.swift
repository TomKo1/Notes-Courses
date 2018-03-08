//
//  Zombie.swift
//  MonsterTown

// subclass

import Foundation

class Zombie: Monster{
    
    // typ Zombie ma wszystkie wlasciwosci i metody typu Monster np. funkcje terrorizeTown()
    
    var walksWithLimp = true
    
    // nadpisujemy metode z podklasy
    override func terrorizeTown() {
        super.terrorizeTown()
        
        if let unwrapped = town{
            if(unwrapped.population >= 10){
                town?.changePopulation(amount: -10)
                
            }else if(unwrapped.population > 0){
                town?.changePopulation(amount: unwrapped.population)
            }
        }
       
    }
    
    // nadajac w klasie bazowej (tutaj Monster) metodzie SPECYFIKATOR final
    // sprawiamy że nie będzie można jej nadpisywać w klasach dziedziczących
    
    // metoda changeName(name:walksWithLimps:) to prosta metoda pozwalajaca programiscie
    // na zmiane wlasciwosci name i walksWithLimp egzemplarza klasy Zombie
    func changeName(name: String, walksWithLimp: Bool){
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
    
    
}

