//функции
class Human {
    var name : String = "John"
}

//функция меняет объект класса, тк все reference objects предаются по ссылке
func changeName(_ human: Human, _ name: String) {
    human.name = name
}

var john = Human()
print(john.name)
changeName(john, "Fred")
print(john.name)

func generateString(code: Int, message: String) -> String {
    let returnMessage = "Получено сообщение \(message) с кодом \(code)"
    return returnMessage
}
// используем функцию в качестве значения
print(generateString(code: 401, message: "Сервер недоступен"))

//создаем функтор, указатель на функцию
var functor = generateString
print(functor (200, "Сервер доступен"))

func getDescription(code: Int) -> (Int, String) {
    if code == 200 {
        return (200, "Not available")
    } else {
        return (100, "Available")
    }
}

typealias Chessman = [String: (alpha: Character, number: Int)?]

var chessmans: Chessman = ["White king":("a", 1),
                           "Black king":("b", 2),
                           "Green king": nil]

func analyzeAllChessmans(chess: Chessman) {
    for element in chess {
        if let tuple = element.value {
            print("\(element.key) has position \(tuple.alpha)\(tuple.number)")
        } else {
            print("\(element.key) figure was killed")
        }
    }
}

func ajustChessmans(chess: inout Chessman) {
    for (name, tuple) in chess {
        switch tuple {
        case _ where tuple?.alpha == "a": chess[name]!!.alpha = "b"
        case _ where tuple?.alpha == "b" : chess[name]!!.alpha = "a"
        case nil : chess[name] = ("c", 3)
        default: break
        }
    }
}

//analyzeAllChessmans(chess: chessmans)
ajustChessmans(chess: &chessmans)
analyzeAllChessmans(chess: chessmans)



