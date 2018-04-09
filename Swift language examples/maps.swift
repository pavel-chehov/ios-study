//Метод Map
var array = [2, 4, 5, 7]
//массив не изменится
var newArray = array.map({
    (value: Int) -> Int in
    return value
})
//сокращенный синтаксис
newArray = array.map{$0}
//возведение в квадрат
newArray = array.map{$0*$0}


let milesToDest = ["Moscow":120.0,"Dubai":50.0,"Paris":70.0]
var kmToDest = milesToDest.map { name,miles in [name:miles * 1.6093] }
//kmToDest [["Dubai": 80.465], ["Paris": 112.651], ["Moscow": 193.116]]

//метод filter
//вывод всех четных чисел в новый массив
var numbers = [1, 4, 10, 15]
let even = numbers.filter{ $0 % 2 == 0 }

//метод reduce
//позволяет объединить все элементы коллекции в одно значение в соответствии с переданным замыканием
let cash = [10, 50, 100, 500]
let total = cash.reduce(210, +) // 870

//flatMap(_:) всегда возвращает плоский одномерный массив Так, пример, приведенный в листинге 12 4, но с
//использованием flatMap(_:), вернет одномерный массив (листинг 12 9)

numbers = [1, 2, 3, 4]
let flatMapped = numbers.flatMap { Array(repeating: $0, count: $0) }
//flatMapped // [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]

let someArray = [[1, 2, 3, 4, 5], [11, 44, 1, 6], [16, 403, 321, 10]]
let filterSomeArray = someArray.flatMap{$0.filter{ $0 % 2 == 0}}
//filterSomeArray // [2, 4, 44, 6, 16, 10]
