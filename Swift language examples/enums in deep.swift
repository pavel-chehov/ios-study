//
//  main.swift
//  example
//
//  Created by Pavel Chehov on 1/19/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import Foundation

enum Chessmen {
    //вложенное перечисление
    enum Color {
        case black
        case white
    }
    
    //перечисление с ассоциированными параметрами
    case king (name: String, color: Color)
    case queen (name: String, color: Color)
    case elefant (name: String, color: Color)
    case horse (name: String, color: Color)
    case castle (name: String, color: Color)
    case pawn (name: String, color: Color)
}

let kingChessmen = Chessmen.king
let blackQeen = Chessmen.queen(name: "queen", color: Chessmen.Color.black)
let whiteQueen = Chessmen.queen(name: "queen", color: Chessmen.Color.white)

switch blackQeen {
    //в case используется связывание значений
    //константам name and color присваиваются соотвествующие им значения
    //ассоциированных параметров
case .queen(let name, let color):
    print(name) //print queen
    switch color {
        case .black:
            print("black")
        case .white:
            print("white")
    }
case .king:
    print("king")
case .elefant(_, _):
    print("elefant")
case .horse(let name, let color):
    print("horse")
case .castle(let name, let color):
    print("castle")
case .pawn(let name, let color):
    print("pawn")
}

//перечисление со связанными значениями
//другими словами перечисление с заданными начальными значениями
enum Smile: String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surprise = "o_O"
    // метод для вывода описания
    
    //в перечислениях могут быть использованы функции
    //теперь для меня это выглядит как объект, разрыв шаблона
    func description(){
        print(self.rawValue)
    }
}

let sm = Smile.init(rawValue: ":)")
print(sm?.rawValue)
