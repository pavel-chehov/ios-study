//коллекции

//словарь, ключ String  значение кортеж-опционал из буквы и цифры
typealias Chessman = [String: (alpha: Character, number: Int)?]

var chessmans: Chessman = ["White king":("a", 1),
                           "Black king":("b", 2),
                           "Green king": nil]

for element in chessmans {
    if var tuple = element.value {
        print("\(element.key) has position \(tuple.alpha)\(tuple.number)")
    } else {
        print("\(element.key) figure was killed")
    }
}

