//
//  Vampire.swift
//  MonsterTown
//


import Foundation

class Vampire:Monster{
    
    var vampires:Array = [] as [Vampire]
    
    override func terrorizeTown() {
        super.terrorizeTown()
        if let unwrapped = town{
            if(unwrapped.population >= 1){
                town?.changePopulation(amount: 1)
                vampires.append(Vampire(town: unwrapped, monsterName: "Vampire"))
            }
        }
    }
    
    func changeName(name: String, town: Town){
        self.town = town
        self.name = name
    }
    
}
