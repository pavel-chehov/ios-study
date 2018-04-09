//
//  main.swift
//  example
//
//  Created by Pavel Chehov on 1/19/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import Foundation

protocol Container {
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct Stack<T>: Container {
    //может быть закомментировано тк тип аргумента T передается как параметр в метод append
    //swift самостоятельно выведет тип и поймет что он соотвествует протоколу
    typealias ItemType = T
    private var items: [T] = []
    
    var count: Int {
        return items.count
    }
    
    init() {
    }
    init(_ elements: T...) {
        items = elements
    }
    
    subscript (i: Int) -> T {
        return items[i]
    }
    
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    mutating func append(item: T) {
        items.append(item)
    }
    
}

extension Stack {
    var topItem: T? {
        get {
            return items.isEmpty ? nil : items.last
        }
    }
}

var stackInt = Stack(1,2,3)
var stackString = Stack<String>();


func findIndex<T: Equatable>(array: [T], valueToFind: T) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
var myArray = [3.14159, 0.1, 0.25]
let firstIndex = findIndex(array: myArray, valueToFind: 0.1) // 1
let secondIndex = findIndex(array: myArray, valueToFind: 31) // nil


