//
//  main.swift
//  example
//
//  Created by Pavel Chehov on 1/19/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import Foundation

class Quadruped {
    var type = ""
    var name = ""
    
    init() {
        print("quadruped")
    }
    
    required init(type: String) {
        self.type = type
    }
    
    func walk() {
        print("walk")
    }
    
    func printName() {
        print(name)
    }
}

class Dog:Quadruped {
    
    var dogName: String
    //переопределение инициализатора
    //в отличие от C# в swift сначала вызывается инициализатор дочернего класса, а потом базового
    override init() {
        print("dog")
        //если не задано значение поля по умолчанию, то необзодимо инициализировать его в инициализаторе до того как будет вызван инициализатор суперкласса
        dogName = "Jessie"
        super.init() //мы ДОЛЖНЫ позвать инициализатор базового класса в подклассе
        name = "Jessie"
    }
    
    required init(type: String) {
        dogName = "Jessie"
        super.init(type: type)
    }
    
    func bark() {
        print("woof")
    }
}

class NoisyDog:Dog {
    override func bark() {
        for _ in 1...3 {
            super.bark()
        }
    }
}

var dog = Dog()
print(dog.dogName)

var animal = dog as Quadruped
animal.printName()
dog = animal as! Dog
dog.bark()


