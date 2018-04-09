//
//  main.swift
//  example
//
//  Created by Pavel Chehov on 1/19/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import Foundation

enum AnimalClass {
    case Mammals
    case Reptilies
}

//все поля lazy
class Human {
    //статичное поле класса (свойство класса)
    static let classType: AnimalClass = .Mammals
    
    //значение поля вычислется в момент обращения, и сопособно изменятся, lazy be name
    lazy var firstName = "Ivan"
    lazy var secondName = "Ivanov"
    //поле - функтор, если оно lazy, то его значение вычислеяется lazy by need, те
    //вычисляется 1 раз и потом не изменяется
    lazy var wholeName = self.generateWholeName()
    
    func generateWholeName() -> String {
        return firstName + " " + secondName
    }
}

var ivan = Human()
print(ivan.wholeName)
ivan.firstName = "Petr"
//значение возвращаемое функтором не изменилось, lazy by need
print(ivan.wholeName)
//хотя сам метод возвращает актуальные данные
print(ivan.generateWholeName())

//СHESSMAN

enum ChessmanType {
    case king, castle, bishop,
         pawn, knight, queen
}

enum ChessmanColor {
    case black, white
}

struct Coordinates {
    let letter: Character
    let number: Int
    
    init(letter: Character, numer:Int) {
        self.letter = letter
        self.number = numer
    }
}

class Chessman {
    let type: ChessmanType
    let color: ChessmanColor
    var coordinates: Coordinates? = nil
    let figureSymbol: Character
    
    init(type: ChessmanType, color: ChessmanColor, figure: Character, coordinates: Coordinates) {
        self.type = type
        self.color = color
        self.figureSymbol = figure
        self.coordinates = coordinates
    }
    
    func setCoordinates(coordinates: Coordinates) {
        self.coordinates = coordinates
    }
    
    func kill() {
        self.coordinates = nil
    }
}

class ChessDesk {
    var desk: [Int : [Character: Chessman]] = [:]
    
    init() {
        for i in 1...8 {
            desk[i] = [:]
        }
    }
    
    subscript (letter: Character, numer: Int) -> Chessman? {
        get {
            if let chessman = desk[numer]![letter] {
                return chessman
            }
            return nil
        }
        set {
            setChessman(chess: newValue!, coordinates: Coordinates(letter: letter, numer: numer))
        }
    }
    
    func setChessman (chess: Chessman, coordinates: Coordinates) {
        if let oldCoordinates = chess.coordinates {
            desk[oldCoordinates.number]![oldCoordinates.letter] = nil
        }
        desk[coordinates.number]![coordinates.letter] = chess
        chess.setCoordinates(coordinates: coordinates)
    }
    
    func printDesk() {
        var str = "";
        let letters = "ABCDEFGH"
        for number in 1...8 {
            str += String(number)
            for letter in letters {
                if let chess = desk[number]![letter] {
                    str+=String(chess.figureSymbol)
                } else {
                    str += "-"
                }
            }
            str+="\n"
        }
      str+=letters+"\n"
      print(str)
    }
}

var chesskDesk = ChessDesk()
var whiteKing =
    Chessman(type: .king, color: .white, figure: "♔", coordinates: Coordinates(letter: "A", numer: 1))

chesskDesk.setChessman(chess: whiteKing, coordinates: Coordinates(letter: "B", numer: 2))
chesskDesk.printDesk()
//использование сабскрипта
var chessman = chesskDesk["B", 2]
chesskDesk["C", 3] = chessman;
chesskDesk.printDesk()



