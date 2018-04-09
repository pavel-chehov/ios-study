//exceptions

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

//опционлаьные типы
class Human {
    var Age: Int
    var Name: String
    
    init(age: Int, name: String) {
        Age = age
        Name = name
    }
}

var human1 : Human?
human1 = Human(age: 18, name: "john")
print(human1!.Name)
human1 = nil
//явное извлечение типа, будет ошибка на этапе выполнения
//можно увидеть в дебаге
print(human1!.Name)
//косвенное извлечение типа
//программа завершиться успешно
print(human1?.Name)

