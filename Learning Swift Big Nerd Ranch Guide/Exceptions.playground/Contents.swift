//: Playground - noun: a place where people can play

import UIKit


enum Token{
    case Number(Int)
    case Plus
}

class Lexer {
    // inicjalizujemy wlasciwosc input wraz z danymi wejsciowymi, wlasciwosc ta
    // ma wartosc wskazujaca poczatek tych danych wejsciowych
    let input: String.CharacterView
    var position: String.CharacterView.Index
    
    init(input: String){
        self.input = input.characters
        self.position = self.input.startIndex
    }
    // funkcja "zerka" na nastepny znak
    func peek() -> Character?{
        /*
         jezeli nie ma wiecej danych, wartoscia zwrotna bedzie nil
         */
        guard position < input.endIndex else{
            return nil
        }
        
        return input[position]
    }
    
    // przejdz do nasgtepnego znaku
    func advance(){
        // ASERCJA SPRAWDZAJACA DANY WARUNEK
        assert(position < input.endIndex, "Nie można wykroczyć poza dane wejściowe!")
        // JEZELI PIERWSZY ARGUMENT W assert() BEDZIE FALSE TO PROGRAM WPADNIE W PULAPKE,
        // ZAKONCZY DZIALANIE I PRZEJDZIE DO DEBUGERA + wyswietli komunikat podany jako drugi argument
    
        position = input.index(after: position)
    }
    
    // uzycie slowa kluczowego throws
    // funkcja analizuje tokeny
    func lex() throws -> [Token]{
        var tokens = [Token]()
        
        while let nextChanger = peek() {
            switch nextChanger {
            case "0" ... "9":
                // rozpoczynamy od cyfry, konieczne jest pobranie reszty
                let value = getNumber()
                tokens.append(.Number(value))
            case "+":
                tokens.append(.Plus)
                advance()
            case " ":
                // po prostu przechodzimy dalej
                advance()
            default:
                // cos nieoczekiwanego - trzeba zglosic blad
                throw theError.NieprawidłowyZnak(nextChanger)
            }
        }
        return tokens
    }
    
    // zagniezdzony typ wyliczeniowy umozliwiajacy zglaszanie bledow
    enum theError : Error{
        case NieprawidłowyZnak(Character)
    }
    
    func getNumber() -> Int {
        var value = 0
        
        while let nextCharacter = peek() {
            switch nextCharacter{
            case "0" ... "9":
            //kolejna cyfra -> dodajemy ja do wartosci
            let digitValue = Int(String(nextCharacter))!
            value = 10*value + digitValue
            advance()
            default:
            //to nie jest cyfra, powracamy do analizy leksykalnej
            return value
        }
    }
        return value
}
}
// UWAGA assert() sa domyslnie wylaczane przy przejsciu z trybu debug (domyslny tryb Playground)
// do typu release - np. przy kompilacji aplikacji w celu jej przekazania do sklepu App Store
// jezeli chce zachodwac assert() nawet po przejsciu do trybu release to musze uzyc
// precondition(condition:message:)


//  W CELU WSKAZANIA ZE FUNKCJA LUB METODA MOZE WYGENEROWAC BLAD, NALEZY UMIESCIC SLOWO KLUCZOWE
// throws po nawiasie zawierajacym argumenty

// w Swift blad zglaszamy egzemplarzem typu zgodnym z protokolem Error (wczesniej ErrorType)

class Parser {
    let tokens: [Token]
    var position = 0
    
    init(tokens: [Token]){
        self.tokens = tokens
    }
    
    func getNextToken() -> Token?{
        guard position < tokens.count else{
            return nil
        }
        let token = tokens[position]
        position += 1
        return token
    }
    
    func getNumber() throws -> Int{
        guard let token = getNextToken() else{
            throw theError.NieoczekiwanyKoniecDanychWejsciowych
        }
        
        switch token{
        case .Number(let value):
                return value
        case .Plus:
            throw theError.NieprawidłowyToken(token)
        }
    }
    
    
    func parse() throws -> Int{
        // liczba musi byc jako pierwsza
        // TEN TRY PRZEKAZUJE RZUCONY BLAD "WYZEJ"
        var value = try getNumber()
        
        while let token = getNextToken() {
            switch token{
                // dozwolone jest otrzymanie tokenu Plus po Number
            case .Plus:
                // po znaku plus konieczne jest otrzymanie kolejnej liczby
                let nextNumber = try getNumber()
                value += nextNumber
                
                // niedozwolone kest otrzymanie tokenu Number po Number
            case .Number:
                throw theError.NieprawidłowyToken(token)
            }
        }
        
        return value
    }
    
    // typy wylcizeniowe bledow do sygnalizacji bledow
    enum theError: Error{
        case NieoczekiwanyKoniecDanychWejsciowych
        case NieprawidłowyToken(Token)
    }
}









func evaluate(input: String){
    print("Obliczanie: \(input)")
    let lexer = Lexer(input: input)
    do{
        let tokens = try lexer.lex()
        print("Dane wyjsciowe analizatora leksykalnego: \(tokens)")
        
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Dane wyjściowe analizatora składni: \(result)")
    }catch Lexer.theError.NieprawidłowyZnak(let character){
        print("Dane wejściowe zawierają nieprawidłowy znak: \(character)")
    }catch Parser.theError.NieoczekiwanyKoniecDanychWejsciowych{
        print("Nieoczekiwany koniec danych wejsciowych podczas przetwarzania")
    }catch Parser.theError.NieprawidłowyToken(let token){
        print("Nieprawidłowy token podczas przetwarzania: \(token).")
    }catch{ // przechwytuje wszystko -> mozna zdefiniowac tak by przechwytywazc konkretne typy bledow
        print("Wystąpił następujący błąd: \(error)")
    }
}

evaluate(input: "10 + 3 + 5")
//evaluate(input: "1 + 2 + abcdefg")

// w celu obslugi bledow jezyk Swift uzywa struktury kontrolnej do-catch z przynajmniej jednym poleceniem try wewnatrz do
// kazde wywolanie metody oznaczonej z throws powinno w  bloku do-catch byc oznaczone przez try



// wywolania try musza znajdowac sie wewnatrz konstrukcji do-catch lub funkcji oznaczonej jako throws

// mozemy uzyc try! zamiast try aby wskazac kompilatorowoi ze nie potrzebujemy obslugi danego bledu
// istnieje mozliwosc zignorowania bledu bez wpadania programu w pulapke -> robimy to poprzez uzycie try?

//dzialanie try? nie jest az tak niebezpieczne jak dzialanie polecenia try! ale mimo wszystko lepiej unikac tego rozwiazania
// w praktycznie kazdym przypadku


//          W SWIFT:
// 1. Kazda funkcja, ktora moze ulec awarii, powinna byc oznaczona slowem kluczowym throws
// 2. Swift wymaga rowniez oznaczenia slowem kluczowym try wszystkich wywolan funkcji, ktorych dzialanie moze zakonczyc sie awaria
// 3. SWIFT NIE IMPLEMENTUJE OBSLUGI BLEDOW ZA POMOCA WYJATKOW ( po oznaczeniu funckji przez throws oznacza to w praktyce zmiane
//      typu jej wartosci zwrotnej na typ Error)
// 4. Funckja zglaszajaca blad nie informuje jakiego rodzaju blad moze byc zgloszony
        // -> zawsze mozna dodac wiecej potencjalnych rodzajow bledow
        // -> kiedy obslugujemy bledy za pomoca bloku catch zawsze musimy byc przygotowani na obsluge bledu nieznanego typu



