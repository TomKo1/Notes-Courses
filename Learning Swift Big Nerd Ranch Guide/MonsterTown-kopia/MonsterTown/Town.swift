//
//  Town.swift
//  MonsterTown
//



// przyklad obrazujacy utworzenie struktury
import Foundation
// wlasciwosci sa dostepne w dwoch rodzajach:
// SKLADOWANE - moze miec przypisana wartosc domyslna
// OBLICZANE - moze zwracac wynoik pewnych obliczen przeprowadzanych na podstawie dostepnych informacji
// wlasciwosci mozna monitorowac pod katem zmian i wykonywac okreslony kod, gdy wlasciwosci ma byc przypisana nowa
// wartosc




struct Town {
    
    static let region = "Południe"
    
    // region to wlasciwosc tylko do odczytu przeznaczona do przechowywania nazwy regionu
    // region nie mozna zmieniac ... taka implemetnacja stalej posiada jednak pewne wady
    let region = "Poludnie"
    
    var mayor:Mayor?
    
    // population to wartosc skladowana
    var population = 5422 {
        // didSet udostepnia uchwyt do poprzedniej wartosci wlasciwosci (willSet udostepnia uchwyt do nowej wartosci wlasciwosci)
        didSet(oldPopulation) {
            if oldPopulation > population{
                print("Wielkość populacji zmieniła się na \(population) z \(oldPopulation)")
                mayor?.beSaad()
            }
        }
    }
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
    
    // ten enum to typ zagniezdzony -> nie moza on byc uzywany poza struktura Town
    enum Size{
        case male
        case srednie
        case duze
    }
    
    // mozna sotosowac tzw. OPOZNIONE WCZYTYWANIE celem opoznienia przypisania wartosci wlasciwosci
    // w kategoriach wlasciwosci opozione wczytywanie oznacza, ze obliczenie wartosci wlasciwosci nastapi dopiero
    //w chwili jej pierwszego uzycia -> takie wlasciwosci oznaczamy SLOWEM KLUCZOWYM lazy -> Uwaga!!!
    // takie wlasciwosci musza byc deklarowane jako var -> ich wartosci beda ulegac zmianie!!!
    // ponizej przyklad: (obliczamy wartosc przy pomocy domkniecia w chwili pierwszego odowlania sie (lazy))
    lazy var townSize: Size = {
        switch self.population {
        case 0...10000:
            return Size.male
        case 10001...100000:
            return Size.srednie
        default:
            return Size.duze
        }
    }()
    
    // wlasciwosci obliczane moga byc uzywane w dowolnej klasie, strukturze lub typie wyliczeniowym
    // tego rodzaju wlasciwosci nie przechowuja wartosci jak wartosci jako wlasciwosci, zamiast tego
    // wlasciwosc obliczana dostarcza METODE GETTER i opcjonalmnie SETTER w celu odpowiednio pobrania
    // i ustawienia wartosci wlasciwosci
    // ta roznica pozwala na zmiane wartosci wlasciwosci obliczanej - w przeciwienstwie do opoznionej
    // wlasciwosci skladowej
    var townSize2: Size { // istnieje koniecznosc wyraznego zadeklarowania typu wlasciwosci obliczanej (tutaj jako Size) -> WLASCIWOSC OBLICZANA MUSI MIEC PODANY TYP !!!
        get{
    switch self.population {
    case 0...10000:
        return Size.male
    case 10001...100000:
        return Size.srednie
    default:
        return Size.duze
    }
        }
    // dostep do wlasciwosci odbywa sie za pomoca skladni z kropka np. myTown.townSize2 -> powoduje to wywolanie metody getter
    // z racji, ze nie ma zdefinioowanego tutaj settera to wlasciwosc ta jest przeznaczon tylko do odczytu
        
        
        
        
    }
    
    
    
}
