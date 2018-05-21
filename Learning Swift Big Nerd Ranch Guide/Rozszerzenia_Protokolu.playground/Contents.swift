//: Playground - noun: a place where people can play

import UIKit

// protokoly pozwalaja na uzycie wzorcow rozwiazujacych problemy, ktore w programowaniu
// zorientowanym obiektowo sa rozwiazywane za pomoca dziedziczenia

protocol ExerciseType: CustomStringConvertible{
    var name: String { get }
    var caloriesBurned: Double { get }
    var minutes: Double { get }
}
extension ExerciseType {
    var description: String {
        return "Ćwiczenie \(name) pozwolilo spalic \(caloriesBurned) kalorii w ciagu \(minutes) minut."
    }
}

// nazwa protokoly powinna sie konczyc przytrostkiem Type, able lib ible
struct EllipticalTrainer: ExerciseType {
     let name = "Trenadzer eliptyczny"
    let title = "Superszybki trenadżer eliptyczny 3000"
    let caloriesBurned: Double
    let minutes: Double
}

let ellipticalWorkout = EllipticalTrainer(caloriesBurned: 335, minutes: 30)

struct Treadmill: ExerciseType {
    let name = "Bieżnia"
    let caloriesBurned: Double
    let minutes: Double
    let distanceInMiles: Double
}

let runningWorkout = Treadmill(caloriesBurned: 350, minutes: 25, distanceInMiles: 4.2)

//          ROZSZERZENIE PROTOKOLU ExerciseType

// obliczanie liczby kalorii spalanych w trakcie minuty cwiczenia
func caloriesBurnedPerMinute<Exercise: ExerciseType>(exercise: Exercise) -> Double {
    return exercise.caloriesBurned / exercise.minutes
}
print(caloriesBurnedPerMinute(exercise: ellipticalWorkout))
print(caloriesBurnedPerMinute(exercise: runningWorkout))

// dodanie wlasciwosci caloriesBurdnedPerMinute do protokolu ExerciseType
extension ExerciseType {
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
}
// rozszerzenie protokolu moze dodac nowe wlasciwosci i metody wraz z implementacjami
// ale nie moze definiowac nowych wymagan dla protokolu

// rozszerzenia protokolu moga uzyskac dostep do jedynie innych wlasciwosci i metody, ktorych
// istnienie jest gwarantowane -> tutaj caloriesBurned i minutes

print(ellipticalWorkout.caloriesBurned)
print(runningWorkout.caloriesBurned)

//          ROZSZERZENIE PROTOKOLU WRAZ Z KLAUZULA WHERE

// protokol Sequence -> poprzedni rozdzial (np. do petli for-in w Swifcie) ->
// ma polecenie associatedtype o nazwie Iterator, ktory musial byc zgodny
 // z protokolem IteratorProtocol... z kolei protokol ITeratorProtocol mial
// typealias o nazwie Element, wskazujacy typ elementow generowanych przez iterator

// mozemy wykorzystac klauzule where w celu ograniczenia rozszerzenia protokolu
// do jedynie Sequence, ktorego Element bedzie okreslonego typu

// zeby iterator byl odpowiedniego typu
extension Sequence where Iterator.Element == ExerciseType {
    func totalCaloriesBurned() -> Double{
        var total: Double = 0
        for exercise in self {
            total += exercise.caloriesBurned
        }
        return total
    }
}

// poniewaz tablica (Array) jest zgodna z protokolem Sequence wiec mozemy wywolac nowa metode totalCaloriesBurned() :
let mondayWorkout: [ExerciseType] = [ellipticalWorkout, runningWorkout]
print(mondayWorkout.totalCaloriesBurned())

// dzieki where jezeli utworzymy tablice inngo typu -> np. [Int] to metoda z naszego rozeszerzenia nie bedzie dostepna :)

//                      DOMYSLNA IMPLEMENTACJA ROZSZERZEN PROTOKOLU


// dzieki temu ze dodalismy do ExerciseType dziedzieczenie po protokole CustomStringConveritable to
// wymagany jest description -> mozemy rozeszerzyc to extensionem i dac tam domyslna implementacje

print(ellipticalWorkout)
print(runningWorkout)

// kiedy protokol dostarcza domyslna implementacje dla niektorych (lub wszystkich) wlasciwosci
// badz metod, wowczas typy zgodne z tym protokolem nie musza ich wszystkich implementowac
// oczywiscie moga jesli domyslna nie wystarcza :) np.
extension Treadmill {
    var description: String {
        return "Bieżnia \(caloriesBurned) kalorii i \(distanceInMiles) mil w ciagu \(minutes) minut."
    }
}


//            NADAWANIE NAZW - OPOWIESC KU PRZESTRODZE

// co sie stanie jesli utworzymy rozszerzenie protokolu w celu dodania wlasciwosci
// lub metody, a nastepnie te sama wlasciwosc lub metode (wrtaz z inna implementacja)
// dodamy do typu zgodnego z protokolem ? -> zachowanie zalezy od kompilatora :(

// PRZYKLAD:
extension ExerciseType {
    var title: String {
        return "\(name) - \(minutes) minut"
    }
}

for exercise in mondayWorkout {
    print(exercise.title) // tutaj dla tej samej warotsi ellipticalWorkout ale w tablicy
    // tylu ExerciseType otrzymamy opis z wlascowosci obliczanej z typu ExerciseType -> wlasnie
    // dlatego te 2 wypisane wartosci beda sie miedzy soba roznic!
}

print(ellipticalWorkout.title) // tutaj bedziemy mieli pole 'title' zdefiniowane w strukturze
// EllipticalTrainer


// zachowuj szczegolna ostroznosc gdy rozwazasz utworzenie rozszerzenia protokolu dodajacefo wlascowosci
// lub metody, ktore nie sa domyslnymi implementacjami wymagan stawianych przez protokol ->
// zachowanie srodowiska uruchomieniowego moze byc inne od oczekiwanego jesli typ zgodny z protokolem
// implementuje te samw wlascowosci i metody








