//
//  Mayor.swift
//  MonsterTown

import Foundation


struct Mayor{
    
    private var anxietyLevel:Int = 0
    
    mutating func notifyOfZombieAttack() {
        self.anxietyLevel += 1
    }
    
     mutating func beSaad(){
            print("Jestem gleboko zasmucony!")
            self.anxietyLevel += 1
    }
    
}
