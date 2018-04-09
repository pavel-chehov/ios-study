//опциональные типы, кортежи, ветвление
typealias Text = String
typealias TupleText = (numberOne: String?, numberTwo: String?)?

var a: Text = "12"
var b: Text = "13"
var c: Text = "12qaedsad"
print(Int(a)!)
print(Int(b)!)
if let s = Int(c) {
    print(s)
} else {
    print("nil")
}

var tuple1 = TupleText(("190","67"))
var tuple2 = TupleText(("100",nil))
var tuple3 = TupleText(("-65","70"))

var arr: [TupleText] = [tuple1, tuple2, tuple3]

for tuple in arr {
    if tuple != nil {
        let (numOne, numTwo) = tuple!
        if numOne != nil && numTwo != nil {
            print("\(numOne!) \(numTwo!)")
        }
    }
}

for tuple in arr {
    if tuple?.numberOne != nil && tuple?.numberTwo != nil {
        print("\(tuple?.numberOne!) \(tuple?.numberTwo!)")
    }
}

typealias Operation = (operandOne: Double, operandTwo: Double, operation: String)
let expression = Operation(19, 0, "/")
var result: Double
switch expression {
case _ where expression.operation == "+":
    result = expression.operandOne + expression.operandTwo
case _ where expression.operation == "-":
    result = expression.operandOne - expression.operandTwo
case _ where expression.operation == "*":
    result = expression.operandOne * expression.operandTwo
case _ where expression.operation == "/":
    assert(expression.operandTwo != 0, "Cant derived by 0")
    result = expression.operandOne/expression.operandTwo
default:
    break
}


