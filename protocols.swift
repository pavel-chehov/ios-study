// protocol example, like interfaces in other languages
protocol HumanProtocol {
    var name : String { get set }
    var simpleDescription: String { get }
    mutating func changeName(newName:String)
}

class Human : HumanProtocol {
    var name: String
    
    var simpleDescription: String {
        get {
            return "human name is "+name
        }
    }
    
    func changeName(newName:String) {
        name = newName
    }
    
    init(name:String) {
        self.name = name
    }
}

var human = Human(name: "Jonh");

print(human.name)
human.changeName(newName: "Albert")
print(human.name)

print(human.simpleDescription)
