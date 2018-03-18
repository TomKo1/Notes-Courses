//
//  Zombie.swift
//  MonsterTown

// subclass

import Foundation

class Zombie: Monster{
    // override -> jak w Javie; bo nadpisujemy wlasciwosc typu z podklasy
    override class var spookyNoise: String{
        return "Mózgi..."
    }
    /*
     class func makeSpookyNoise() -> String{
        return "Mózgi..."
     }
     z racji ze metoda makeSpookyNoise() nie pobiera zadnych argumentow
     to doskonale nadaje sie na obliczana wlasciwosc typu, a nie metode
    */
    
    
    // metoda getter dla isFallingApart ma miec wewnetrzny poziom dostepu
    // natomiast setter prywatny -> Uwaga !!! Metoda setter nie moze byc bardziej widoczna niz getter
    // z racji ze internal jest domyslny to nie musimy go pisac
    internal private(set) var isFallingApart: Bool
    
    
    
    // typ Zombie ma wszystkie wlasciwosci i metody typu Monster np. funkcje terrorizeTown()
    
    var walksWithLimp: Bool
    
    // nadpisujemy metode z podklasy
    override func terrorizeTown() {
        
        if !isFallingApart {
            town?.changePopulation(amount: -10)
        }
        super.terrorizeTown()
        
        if let unwrapped = town{
            if(unwrapped.population >= 10){
                town?.changePopulation(amount: -10)
                
            }else if(unwrapped.population > 0){
                town?.changePopulation(amount: unwrapped.population)
            }
        }
        
        town?.mayor?.notifyOfZombieAttack()
       
    }
    
    // nadajac w klasie bazowej (tutaj Monster) metodzie SPECYFIKATOR final
    // sprawiamy że nie będzie można jej nadpisywać w klasach dziedziczących
    
    // metoda changeName(name:walksWithLimps:) to prosta metoda pozwalajaca programiscie
    // na zmiane wlasciwosci name i walksWithLimp egzemplarza klasy Zombie
    func changeName(name: String, walksWithLimp: Bool){
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
    
    
    init(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String){
        walksWithLimp = limp
        isFallingApart = fallingApart
        super.init(town: town, monsterName: monsterName)
    }
    
    convenience init(limp: Bool, fallingApart: Bool){
        self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "Fred")
        if walksWithLimp { // jezeli taka operacje jak sprawdzanie probowalibysmy
            // wykonac przed wywolaniem metody desygnowanej to otrzymalibysmy blad 
            print("Zombie ma uszkodzone kolano")
        }
    }

    required init(town: Town?, monsterName: String) {
        walksWithLimp = false
        isFallingApart = false
        super.init(town: town, monsterName: monsterName)
    }
    
    
}

