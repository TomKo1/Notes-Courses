//
//  Monster.swift
//  MonsterTown

import Foundation

class Monster{

    static let isTerrifying = true
    
    // sprawdzenie czy wlasciwosci class moga byc nadpisywane przez podklasy
    class var spookyNoise: String {
        return "Grr"
    }
    
    
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
    
    // obliczane wlasciwosci moga byc zadeklarowane takze z uzycie metody zarowno
    // getter, jak i setter
    // metoda getter pozwala na odczyt danych; natomiast setter na zapis danych
    // wlasciwosci zawierajace zdefiniowane metody getter i setter sa nazywane wlasciwosciami
    // do odczytu i zapisu
    var victimPool: Int {
        get {
            // uzywamy OPERATORA KOALESCENCJI nil do sprawdzenia czy egzemplarz typu Monster ma przypisane miasto
            //          -> jesli tak zwraca populacje miasta
            //          -> jesli nie to zwracamy 0
            return town?.population ?? 0
        }
        
        set(newVictimPool) {
            
            
            town?.population = newVictimPool
        }
        
    }
    
    
    
    
}


