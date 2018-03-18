
//  main.swift
//  MonsterTown


import Foundation // to polecenie wczytuje framework o nazwie Founadation
// framework ten zawiera wiele klas przeznaczonych do pracy przede wszystkim z Objective-C

// w budowanym tutaj narzedziu powloki plik main.swift przedstawia punkt wejscia do programu
// w pliku tym zwykle znajduje sie kod "najwyzszego poziomu", czyli niezawarty wewnatrz implementacji
// jakiejkolwiek funkcji lub niezdefiniowany w opkreslonym typie (takim jak struktura czy klasa)

// znajdujacy sie tutaj kod jest zwykle odpowiedzialny za konfiguracje aplikacji


//              struktury

// tworzenie egzempalrzy struktury Town

var myTown = Town()
// print("Populacja: \(myTown.population), liczba skrzyżowań z sygnalizacją świetln \(myTown.numberOfStoplights).")

// uzycie metody egzemplarza:
myTown?.printTownDescription()

myTown?.changePopulation(amount: 1000000)

myTown?.printTownDescription()
/*
print("Wielkość miasta: \(myTown?.townSize), populacja: \(myTown?.population)")
*/
/*
let gm = Monster()
gm.town = myTown
gm.terrorizeTown()
*/
let fredTheZombie = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printTownDescription()

fredTheZombie.changeName(name: "Fred The Zombie", walksWithLimp: false)

//let vampire1 = Vampire(town: myTown, monsterName: ")


print("Number of suqre sides: ")
print(Square.numberOfSidses())

// uzycie wlasciwosci oblicznej:
print("Pula ofiar: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
//print("Pula ofiar: \(fredTheZombie.victimPool); populacja: \(fredTheZombie.town?.population)")


//  obserwator wlasciwosci monitoruje odpowiednia wlasciwosc i odpowiednio reaguje w przypadku
// wszelkich zmian; mozliwosc obserwacji wlasciwosci jest dostepna dla kazdej zdefiniowanej
// wlasciwosci skladowej, a takze dla wszystkich dziedziczonych wlasciwosci
//  OBSERWACJI WLASCIWOSCI NIE MOZNA UZYC DLA ZDEFINIOWANYCH WLASCIWOSCI OBLICZANYCH
    // (ZACHOWUJEMY JEDNAK PELNA KONTROLE NAD DEFINICJA METODY SETTER I GETTER WLASCIWOSCI
    // OBLICZANEJ ORAZ MOZEMY WTEDY ODPOWIEDNIO NA TAKA ZMIANE ZAREAGOWAC)
// Zmiany wprowadzane we wlasciwosci mozna obserwowac na dwa sposoby:
//  -> gdy wartosc wlasciwosci ma ulec zmianie (willSet)
//  -> gdy wartosc wlasciwosci ulega zmianie (didSet)

// -> przyklad znajduje sie w struct Town


//              WLASCIWOSCI TYPU -> jak static w Javie
// wlasciwosci typu pozostaja uniwersalne dla typu -> wartosci tych wlasciwosci beda
//              wspoldzielone miedzy wszystkimi egzemplarzami typu
//-> takie wlasciwosci deklarujemy przy pomocy static (Weee Java!) -> przyklad w Town 
// klasy rowniez moga miec skladowe i obliczane wlasciwosci typu; podobnie jak struktury
// uzywaja tej samej skladni ze slowem kluczowym static
//  JEZELI CHCEMY ABY PODKLASA MIALA MOZLIWOSC DOSTARCZENIA WLASNEJ IMPLEMENTACJI
//     WLASCIWOSCI, TO ZAMIAST WYMIENIONEGO NALEZY UZYC SLOWA CLASS  -> przyklad w klasie Zombie

print(Zombie.spookyNoise)

if Zombie.isTerrifying {
    print("Uciekaj!")
}

//                  KONTROLA DOSTEPU


//      kontrola dostepu opiera sie na dwoch waznych i powiazanych ze soba koncepcjach:
//      -> modulu -  jednostka rozprowadzanego kodu (np. UIKit Cocoa -> frameworki laczace w sobie
// wiele powiazanych typow wykonujacych polaczone ze soba zadania ; w jezyku Swift moduly sa
//          dolaczane w innych modulach za pomoca SLOWA KLUCZOWEGO import
//      -> plikach zrodlowych - oddzielne jednostki kodu, przedstawiaja poszczegolne pliki znajdujace
//          sie w okreslonych mpdulach  ; dobra praktyka jest definiowanie w pliku
//          zrodlowym tylko jednego typu



//              KONTROLA DOSTEPU W JEZYKU SWIFT
//      publiczny (public) -> oznacza, że dana encja jest widoczna we wszystkich plikach danego modulu
//                  lub importujacych ten mopdul
//      wewnetrzny (internal) -> jest domyslny, oznacza ze dana encja jest widoczna we wszystkich
//                  plikach tego samego modulu
//      prywatny (private) -> dana encja widoczna jest jedynie w pliku zrodlowym w ktorym
//                  zostala zdefiniowana
// -> przyklad w klasie Zombie
print("---------")
var town: Town? = Town()
town?.population = 100000
town?.mayor = Mayor()
town?.changePopulation(amount: -100)
town?.changePopulation(amount: 100)
town?.changePopulation(amount: 100)
town?.changePopulation(amount: 100)
print("---------")
//                      SKLADNIA METODY INICJALIZACYJNEJ
/*
 ogolna skladnia, stosowana w strukturach, typach wyliczeniowych i klasach
 struct DowolnyTyp{
    init(dolownlaWartosc: PewienTypTejWartosci){
 
    }
 
 }
*/

// podczas pracy ze strukturami zwykle chcemy wykorzystac zalety plynace z dostarczonych im domylsnych metod inicjalizacyjnych

// w strukturze mamy PUSTA METODE INICJALIZACYJNA -> NP. Town() -> przypisuje wartosc idomyslne przypisane w innym miejscu

// badz METODA INICJALIZCYJNA ELEMNTOW SKLADOWYCH -> ma praametr i inicjalizuje kazdy skladnik na podstawie podanych parametrow -> nie parametry domyslne !!!
// JEZELI NIE DOSTARCZYMY METODY INICJALIZACYJNEJ DLA SAMODZIELNEI ZDEFINIOWANEGO TYPU, NIEZBEDNE WARTOSCIM MUSIMY PODAC ZA POMCOA WARTOSCI DOMYSLNYCH LUB METODY INICJALIZACUJNEJ ELEMENTOW SKLADOWYCH

//var townNotDefault: Town = Town(population: 1000, numberOfStoplights: 6)
//townNotDefault.printTownDescription2()

var myTown2 = Town( region: "zachód", population: 10000, stoplights: 6)

//                      DELEGACJA METODY INICJALIZACYJNEJ
// metode inicjalizacyjna mozna zdefiniowac w celu wywolania innych metod inicjalizacyjncyh tego samego typu; tego rodzaju procedura jest nazywana
// DELEGACJA METODY INICJALIZACYJNEJ
// struktury i wyliczenia nie obsluguja dziedziczenia -> delegacja sprwadza sie do wywlania jednej metody

var delegationMyTown = Town(population: 10000, stoplights: 6)
delegationMyTown?.printTownDescription()
//                  INICJALIZACJA KLASY
// w klasach mozemy miec metody inicjalizacyjne DESYGNOWANE i WYGODNE
// w klasie metdoa inicjalizacyjna moze byc jedna z dwoch wymienionych rodzajow
// desygnowana metoda inicjalizacyjna jest odpowiedxzialna za zagwarantowanie ze wszystkie wlasciwosci egzemplarza beda mialy wartosc
// zanim proces inicjalizacyjny zostanie zakonczony
//
//wygodna metoda inicjalizacyjna jest uzupelnieniem desygnowanej przez wywolanie w klasie jej desygnoiwanej metody inicjalizacyjnej
// rola wygodnej metody inicjalizacyjnej sprowadza sie zwykle do utworzenia egzemplarza klasy przeznaczonego do bardzo konkretnego celu

// jezeli podam wartosci domyslne dla wszystkich wlasciwosci klasy, to otrymuje ona domsylna, pusta metode inicjalizacyjna

//                 AUTOMATYCZNE DZIEDZICZENIE METODY INICJALIZACYJNEJ
// klasa zwykle nie dziedziczy metod inicjsalizacyjnych po superklasie, wymaganie od podklas definiowania wlasnych metod inicjalizacyjnych
// pomaga w uniknieciu sytuacji, gdy otrzymujemy czesciowow zainicjalizowane egzemplarze na skutek dzialania niekompletnych metod inicjalizacyjnych

// jednak zdarzaja sie sytuacje w ktorych klasa automatycznie dziedziczy metody inicjalizacyjne po superklasie

//                  DESYGNOWANA METODA INICJALIZACYJNA
/*
    desygnowana metoda inicjalizacyjna jest gola, co onzacza brak
 jakiegokolwiek specjalnego slowa kluczowego umieszczanego przed init;
    taka skladnia odroznia ja od wygodnej metody inicjalizacyjnej
    ktora na poczatku zawiera
 SLOWO KLUCZOWE convenience
 */

/*
 init(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String){
 walksWithLimp = limp
 isFallingApart = fallingApart
 super.init(town: town, monsterName: monsterName) // wywolanie metody inicjalizacyjnej z klasy nadrzednej
 }
 */


//                  WYGODNE METODY INICJALIZACYJNE
// wygodna metoda inicjalizacyjna nie jest odpowiedzialna za zagwarantowanie
// ze wszystkie wlasciwosci klasy maja wartosc, zamiast tego
// wykonuje swoje zadanie, do ktorego zostala zdefiniowana, a nastepnie
// przekazuje informacje do innej wygodnej lub desygnowanej metody inicjalizacyjnej

//  WSZYSTKIE WYGODNE METODY INICJALIZACYJNE WYWOLUJA INNE METODY INICJALIZACYJNE W TEJ SAMEJ KLASIE
// OSTATECZNIE WYGODNA METODA INICJALIZACYJNA MUSI WYKONAC WYWOLANIE
// DESYGNOWANEJ METODY INICJALIZACYJNEJ KLASY
// przyklad w klasie Zombie -> oznaczone convenience

var convenientZombie = Zombie(limp: true, fallingApart: false)

//              WYMAGANE METODY INICJALIZACYJNE DLA KLASY

// klasa moze wymagac aby jej podklasy dostarczaly okreslone metody
// inicjalizacyjne; np przyklad mozna przyjac zalozenie ze wszystkie
// podklasy klasy Monster maja dostarczac wartosci dla mazwy potwora i terroryzowanego miasta (jesli powtor nie znalazl miasta to nil)
// w tym celu oznaczamy metode inicjalizacyjna SLOWEM KLUCZOWYM required
// ktore wskazuje, ze wszystkie podklasy danego typu musza zawierac
// te metode inicjalizaycjna

// przyklad w pliku Monster.swift -> oczywiscie teraz
// np. klasa Zombie bedzie musiala zaimpplementowac ta metode
// required ...


//   klasa moze miec wiecej niz tylko jedna desygnowana metode inicjalizacyjna i to jest dosc
// czesto spotykana sytuacja

//                  DEINICJALIZACJA

// deinicjalizacja jest czescia procesu usuwania egzemplarzy klasy
// z pamieci w chwili, kiedy nie sa juz potrzebne
// deinicjalizacja dotyczy tylko typow odowolan, pozostaje niedostepna
// do uzycia przez typy wartosci, poniewaz sa one usuwane z pamieci w chwili ich
// pozbycia sie z zasiegu


//   KLASA MOZE MIEC TYLKO JEDNA METODE PRZEPROWADZAJACA DEINICJALIZACJE
//          NEZWA TEGO RODZAJU METODY JEST deinit()
// metody deinicjalizacyjne maja pelny dostep do wlasciwosci i metod egzemplarza

//              METODY INICJALIZACYJNE, KTORYCH DZIALANIE MOZE
//                  ZAKONCZYC SIE NIEPOWODZENIEM

// musimy miec mozliwosc zgloszenia komponentowi ze inicjalizowanie
// obiektu zakonczylo sie niepowodzeniem (niekiedy moze tak byc w metodzie
// inicjalizacyjnej) -> uzywamy do tego metody inicjalizacyjenj ktora moze
// zakonczyc dzialanie niepowodzeniem -> np. gdy metoda otrzyma
// nieprawidlowe parametry

// wartoscia zwrotna metody inicjalizacyjnej, ktora moze zakonczyc sie
// niepowodzeniem jest typ Optional -> po slowie kluczowym init umieszczamy znak
// zapytania -> init?
// mozna rowniez umiescicc wykrzyknik po slowie kluczowym init (np. init!)
// w celu utworzenia metody inicjalizacyjnej, ktorej dzialanie
// moze zakonczyc sie niepowodzeniem

// przyklad w Town.swift

// niepowodzenie oznacza utworzenie egzemplarza klasy Town
// typu Optional wraz z zawartoscia nil

var myTown3 = Town(region: "zachód", population: 0, stoplights: 6)
myTown?.printTownDescription()

//              METODY INICJALIZACYJNE, KTORYCH DZIALANIE
//              MOZE ZAKONCZYC SIE NIEPOWODZENIEM W KLASACH

// metody inicjalizacyjne, ktorych dzialanie moze zakonczyc sie niepowodzeniem w klasach, dzialaja nieco inaczej niz w typach wartosci (takich
// jak typy wyliczeniowe i struktury)
// W TYPACH WARTOSCI TEGO RODZAJU METODA INICJALIZACYJNA
// MOZE ZAKONCZYC SIE NIEPOWOEDZENIEM W DOWOLNYM MOMENCIE I ZWRACA WARTOSC NIL

// NATOMIAST W KLASIE MUSI PRZYPISAC WARTOSCI POCZATKOWE WSZYSTKIM WLASCIWOSCIOM KLASY, ZANIM ZAKONCZY DZIALANIE NIEPOWOWDZENIEM
// taka metode mozna napisac np. jak nizej -> stosujac "trik" z
// niejawnym rozpakowanie typu Optional
/*
 class MojaKlasa{
 let mojaWlasciwosc: String!
 
 init?(mojaWlasciwosc: String){
    if mojaWlasciwosc.isEmpty{
        self.mojaWlasciowsc = mojaWlasciowsc // bo wssystkie wlasciwosci musza miec
 // przypisane wartosc przed zwroceniem nil'a
        return nil
    }
    self.mojaWlasciwosc = mojaWlasciwosc
 }
 
 }
 
 */


//              DLA BARDZIEJ DOCIEKLIWYCH - PARAMETRY METODY INICJALIZACYJNEJ


// podobnie jak funkcje i metody, takze metoda inicjalizacyjna moze jawnie
// zawierac zewentrzne nazwy dla parametrow

// nazwy i typy parametrow pomagaja w ustaleniu, ktora metoda inicjalizacyjna powinna byc wywolana
/*
 struct WeightInLBS{
     let weight: Double
     init(weightInKilos kilos: Double){
        weight = kilos * 2.20462
 
 
     }
 }
 
 // teraz mozna inicjalizowac jak nizej:
 let wr = WeightRecorInLBS(weightInKilos: 84)
 
 // mozna rowniez uzyc znaku _ jako jawnej nazwy parametru zewnetrznego
 // jesli nie chcemy ujawnic jego nazwy:
 struct WeightRecordInLBS{
    let weight: Double
    init(_ pounds: Double){
        weight = pounds
    }
 
 
 }
 // teraz mozna uzyc jak nizej:
 let wr = WeightRecordInLBS(185)
 
 
 */




