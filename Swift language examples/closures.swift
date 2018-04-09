//замыкания
class Human {
    var Age: Int

    init(age: Int) {
        Age = age
    }
}

var list = [Human(age: 2), Human(age:3)]
for item in list {
    item.Age += 1
}

for item in list {
    print(item.Age)
}

var a = 1
var b = 2
let closureSum : () -> Int = {
    [a,b] in //захват переменных 1 и 2
    return a+b
}

var result = closureSum()
//если был сделан захват переменных, то значение closureSum не поменяется
a = 3
b = 4
result = closureSum()
print(result)

var arrayOfNames = ["Helga", "Bazil", "Alex"]
//передача автозамыкания в функцию
func printName(_ nextName: @autoclosure ()->String) {
    // какой-либо код
    print(nextName())

}
printName(arrayOfNames.remove(at: 0))
