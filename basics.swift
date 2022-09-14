// variables
print("---variables---")
let notChangeable = 7
var changeable = "a"
print("notChangeable = \(notChangeable), is \(notChangeable.isMultiple(of: 3) ? "":"not") multiple of 3. changeable = \(changeable)")

// random things
print("---random things---")
print("random number: \(Int.random(in: 1...1000))")
let someList = ["a", "b", "c"]
print("pick random item: \(someList.randomElement() ?? "no item")")

// collections
print("---collections---")
// Dictionaries
// let person: Dictionary<String, String> = [
let person: [String: String] = [
// let person = [
    "name": "Jack",
    "job": "programmer"
]
print("Person's job: \(person["job", default: "none"])")
// Lists
let aList: [String] = ["red", "blue"]
let bList = [String]()
for item in aList {
    print("\(item)")
}
// for iter in 1..<10 {
for iter in 1...10 {
    print(iter)
}
// Sets
var aSet = Set(["a", "b"])
aSet.insert("a")

// enums
print("---enums---")
enum Weekday {
    case mon, tue, wed, thur, fri
}
var aDay = Weekday.mon
aDay = .fri
print(aDay)
switch aDay {
case .fri:print("it's friday")
case .tue:print("it's tuesday")
default: print("it's someday")
}

// functions
print("---functions---")
// func rollDice(sides:Int) -> Int {
// func rollDice(_ sides:Int) -> Int {
func rollDice(sides number: Int) -> Int {
    return Int.random(in: 1...number)
}
print(rollDice(sides: 6))

// tuples
func getName()->(firstName: String, lastName: String) {
    (firstName: "Jack", lastName: "Bauer")
}
let (firstName, _) = getName()
print(firstName)

// handling errors
print("---handling errors---")
enum PasswordError: Error {
    case short, obvious
}
func checkPassword(password: String) throws -> Bool {
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "12345" {
        throw PasswordError.obvious
    }
    return true
}
do {
    let password1OK = try checkPassword(password: "abc")
} catch PasswordError.obvious {
    print("Password is obvious")
} catch PasswordError.short {
    print("Password is too short")
} catch {
    print("there is an error")
}

// closures
print("---Closures---")
let sayHello = {(name: String) -> String in
    return "Hello \(name)!"
}
print(sayHello("kin"))

let people = ["Tom", "Jack", "Tim"]
// let onlyT = people.filter({(name: String) -> Bool in
//     return name.hasPrefix("T")
// })
// let onlyT = people.filter({name in
//     return name.hasPrefix("T")
// })
// let onlyT = people.filter({name in
//     name.hasPrefix("T")
// })
let onlyT = people.filter({ $0.hasPrefix("T")})
print(onlyT)

// Structs
print("---Structs---")
struct Album {
    var title: String 
    let artist: String
    var isReleased: Bool = true
    func summary() {
        print("\(title) by \(artist) \(isReleased ? "on":"not on") sale")
    }
    // only mutating functions (or getter/setters) can change properties
    mutating func removeFromSale() {
        isReleased = false
    }
}
var anAlbum = Album(title: "Dangerous", artist: "Micheal Jackson")
print(anAlbum.summary())
anAlbum.removeFromSale()
print(anAlbum.summary())

struct Player {
    let id: Int
    let name: String
    // with initializer
    init(name:String){
        self.name = name
        self.id = Int.random(in: 1...999)
    }
    func info(){
        print("id:\(id), name:\(name)")
    }
}
let player = Player(name: "kin")
print(player.info())