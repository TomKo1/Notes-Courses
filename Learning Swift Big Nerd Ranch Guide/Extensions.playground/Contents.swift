//: Playground - noun: a place where people can play

import UIKit

// slowo kluczowe typealias w jezyku Swift pozwala na nadanie innej nazwy istniejacemu typowi

// utworzenie aliasu do typu
typealias Velocity = Double

// rozbudowa typu Velocity o obsluge predkosci w kilometrach i milach na godzine
extension Velocity{
    var kph: Velocity { return self * 1.60934 }
    var mph:  Velocity { return self }
}

// uwaga, poniwaz nazwa Velocity jest uzywana wymiennie z Double wiec rozszerzenie zdefiniowane
// do Double z uzyciem aliasu Velocity daje uzyteczny kontekst

// protokol opisujacy pewne podstawowe cechy charakterystyczne pojazdu
protocol VehicleType {
    var topSpeed: Velocity { get }
    var numberOfDoors: Int { get }
    var hasFlatBed: Bool { get }
}

struct Car {
    let make: String
    let model: String
    let year: Int
    let color: String
    let nickname: String
    var gasLevel: Double {
        willSet{
            precondition(newValue <= 1.0 && newValue >= 0.0, "Nowa wartosc musi sie zmiescic w zakresie od 0 do 1.")
        }
    }
}

// rozszerzenie struktury Car w celu zapewnienia zgodnosci z protokolem VehicleType
extension Car: VehicleType {
    var hasFlatBed: Bool {
            return false
    }
    var topSpeed: Velocity { return 100 }
    var numberOfDoors: Int { return 4 }
}
// jesli chce przygotowac wlasna metode inicjalizacyjna dla struktury i jednoczesnie
// nie chce tracic domyslnej metody inicjalizacyjnej elementow skladowych, to moge
// dodac metode inicjalizacyjna dla typu, poslugujac sie w tym celu rozszerzeniem
extension Car  {
    init( carMake: String , carModel: String ,  carYear: Int ){
        self.init( make: carMake ,model: carModel , year: carYear ,color: "czarny" , nickname: "nie dotyczy" , gasLevel: 1.0 )
    }
}
// zdefiniowana w rozszerzeniu metoda inicjalizacyjna w akcji:
var c = Car(carMake: "Ford", carModel: "Fusion", carYear: 2013)
// w jezyku Swift rozszerzenia moga tez dodawac zagniezdzone typy do juz istniejacych
extension Car {
    enum CarKind: CustomStringConvertible {
        case Coupe, Sedan
        var description: String{
            switch self{
            case .Coupe:
                        return "Coupe"
            case .Sedan:
                        return "Sedan"
            }
        }
    }
    
    var kind: CarKind {
        if numberOfDoors == 2 {
                return .Coupe
        }else{
            return .Sedan
        }
    }
}
print (c.kind.description)

// rozszerzenia mozna wykorzystac w celu dostarczenia funkcji istniejacemu typowi
extension Car {
    mutating func emptyGas(amount: Double){
        precondition( amount <= 1 && amount > 0, "Ilsoc do usuniecia musi miescic w zakresie od 0 do 1.")
        
        gasLevel -= amount
    }
    
    
    mutating func fillGas(){
        gasLevel = 1.0
    }
}

c.emptyGas(amount: 0.3)
c.gasLevel
c.fillGas()
c.gasLevel
