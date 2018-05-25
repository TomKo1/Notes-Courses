import UIKit


// Swift nie uzywa 'garbage collectora' a mechanizmu zliczania odwolan
// egzemplarz pozostaje w pamieci dopoty, dopoki wartosc tego licznika
// odwolan jest wieksza niz zero
// kiedy wartosc licznika odwolan spadnie do zera, nastepuje wykonanie jego metody
// deinit() i egzemplarz zostaje usuniety z pamieci


// 2001 do Objective-C wprowadzenie ARC (Automatic reference counting) -> automatyczne
// zliczanie odowlan -> wczesniej odbywalo sie to recznie


// domyslnie wszystkie tworzone odwolania sa uznawane za silne, co oznacza inkrementacje
// o jeden wartosci licznika odwolan dla danego egzemplarza

// cykle silnych odwolan to rodzaj wycieku pamieci -> np. jeden obiekt(A) ma w sobie odwolanie do B
// a obiekt B ma odwolanie do A

// przerwac taki cykl mozemy przy pomocy przy pomocy metody deinit() i przeiterowaniu przez
// silne odwolania przypisujac im nil jednak jezyk Swift oferuje takie zachowanie automatycznie
// przy pomocy slowa weak (odwolanie slabe)


// gdy z pamieci zostanie usuniety egzemplarz, do ktorego odnosi sie odwolanie weak to
// bedzie ono mialo przypisana wartosc nil

//          Slabe odwolania maja dwa wymienione ponizej wymagania:
//          -> slabe odwolanie zawsze musi byc zadeklarowane za pomoca slowa kluczowego var a nie let
//          -> slabe odwolanie zawsze musi byc zadeklarowane jako typ Optional


// istnieje jeszcze jeden, bardziej subtelny sposob powstania cyklu odwolan - na skutek przechwycenia self w domknieciu

// semantyka przechwytywania ( -> domkniecie ma wlasny zasieg w definicji, domyslnie domkniecie
//      pobiera silne odwolanie do kazdej zmiennej uzywanej wewnatrz tego zasiegu -> mozliwosc
//      powstania cyklu silnych odwolan) -> kompilator wymaga w takich miejsach jawnego uzycia
//      self zeby 'ostrzec' programiste przed mozliwoscia powstania cyklu silnych odwolan



//      aby semantyke przechwytywania w domknieciu zmienic na wykorzystujaca slabe odwolania
//          mozna uzyc LISTY PRZECHWYTYWANIA -> [weak self]

// skladnia listy przechwytywania ma postac listy zmiennych umieszczonych wewnatrz nawiasu
//  kwadratowego znajdujacego sie tuz przed lista argumentow domkniecia
// np. [weak self] nakazuje Swiftowi przechwytywanie self z uzyciem odwolania
//  slabego zamaist silnego


// Swift nie daje dostepu do rzeczywistego licznika odwolan jakiegokolwiek egzemplarza











