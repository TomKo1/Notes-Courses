//
//  Monster.swift
//  MonsterTown

import Foundation

class Monster{
    
    var town: Town?
    var name = "Potwór"
    
    func terrorizeTown(){
        if town != nil{
            print("\(name) terroryzuje miasto...")
        }else{
            print("\(name) jeszcze nie znalazł miasta do terroryzowania...")
        }
    }
    
    
    
    //the main difference is that structs are value types and classes are reference types.
    // reference -> the same place in memory when copying
    // value -> other thing when copying
    // struktury nie maja dziedziczenia 
}


