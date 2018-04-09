enum Rank: Int {
    case ace = 1
    case one, two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    func compare(first: Rank, second: Rank) -> Rank {
        return first.rawValue > second.rawValue ? first : second
    }
    func getRanks() -> Array<Rank> {
        var arr = Array<Rank>()
        arr.append(.ace)
        arr.append(.one)
        arr.append(.two)
        arr.append(.three)
        arr.append(.four)
        arr.append(.five)
        arr.append(.six)
        arr.append(.seven)
        arr.append(.eight)
        arr.append(.nine)
        arr.append(.ten)
        arr.append(.queen)
        arr.append(.jack)
        arr.append(.king)
        return arr
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue

let queen = Rank.queen.rawValue
print(queen)

let convertedRank = Rank(rawValue: 3)
print(convertedRank?.rawValue)

enum Suit : Int {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    func getColor(suit: Suit) -> String {
        switch suit {   //instead suit I can use self
        case Suit.spades, Suit.clubs:
            return "black"
        case .diamonds, .hearts: // short form
            return "red"
        }
    }
    func getSuits() -> Array<Suit> {
        var arr = Array<Suit>();
        arr.append(.spades)
        arr.append(.clubs)
        arr.append(.diamonds)
        arr.append(.hearts)
        return arr
    }
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
print(hearts.getColor(suit: hearts)) //red

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    func makeDeck() -> Array<Card> {
        var deck = Array<Card>()
        
//        let clubs = Suit.clubs;
//        let ace = Rank.ace
//
//        for s in clubs.getSuits() {
//            for r in ace.getRanks()
//            {
//                deck.append(Card(rank: r, suit: s))
//            }
//        }
        
        for s in 0...Suit.clubs.rawValue {
            for r in 1...Rank.king.rawValue {
                deck.append(Card(rank: Rank(rawValue: r)!,
                                 suit: Suit(rawValue: s)!))
                
            }
            
        }
        return deck
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
let card = Card(rank: Rank.ace, suit: Suit.clubs)
let cardDeck = card.makeDeck()


enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
var k = false
var response = k ? success : failure

switch response {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
}


class Person {
    var residence: Residence!
}

class Residence {
    var numberOfRooms = 1
}

var john = Person()
var f = john.residence.numberOfRooms;
