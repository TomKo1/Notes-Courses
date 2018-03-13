//
//  Mayor.swift
//  MonsterTown

import Foundation


struct Mayor{
    
    private var anxietyLevel:Int = 0
    
    mutating func notifyOfZombieAttack() {
        anxietyLevel++
    }
    
     func beSaad(){
            print("Jestem gleboko zasmucony!")
            anxietyLevel += 1
    }
    
}
