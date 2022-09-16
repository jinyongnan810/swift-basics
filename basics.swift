import Cocoa
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
    init(name: String) {
        self.name = name
        self.id = Int.random(in: 1...999)
    }
    func info() {
        print("id:\(id), name:\(name)")
    }
}
let player = Player(name: "kin")
print(player.info())

// classes
print("---Classes---")
class Employee {
    let name: String
    let workHours: Int
    init(name: String, hours: Int) {
        self.name = name
        self.workHours = hours
    }
    func summary() {
        print("\(self.name) works \(self.workHours) a day")
    }
}
class Coder: Employee {
    let language: String
    init(name: String, hours: Int, language: String) {
        self.language = language
        super.init(name: name, hours: hours)
    }
    func code() {
        print("\(self.name) codes \(self.language)")
    }
    override func summary() {
        print("\(self.name) codes \(self.language) \(self.workHours) a day")
    }
    deinit {
        print("\(self.name) has been destroyed")
    }
}
let coder = Coder(name: "kin", hours: 6, language: "swift")
coder.summary()
// key feature compare to structs
// 1. assigning to another variable doesn't copy the value, only assigns the ref
// 2. don't need mutating keyword to make it changeable

// extensions
print("---extensions---")
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    mutating func trim() {
        self = self.trimmed()
    }

    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}
print(" abc de f g ".trimmed())
var str = " bcd ef "
str.trim()
print(str)
var multiLines = """
hello
goodbye
"""
print(multiLines.lines)

// extension on Collection will work on Arrays, Dictionaries and Sets
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
let arr = ["a", "b"]
let empty = [String]()
print("arr is not empty: \(arr.isNotEmpty). empty is not empty: \(empty.isNotEmpty).")

// handling nil
print("---handling nil---")
let dic = ["a": "b", "c": "d"]
// way 1
if let entry = dic["a"] {
    print("a is \(entry)")
}

func nilExample() {
    // way 2
    guard let anotherEntry = dic["e"] else {
        print("e is nil")
        return
    }
    print("e is \(anotherEntry)")
}
nilExample()
// way 3
print("f is \(dic["f"] ?? "none")")
// way 4
print("g's uppercase is \(dic["g"]?.uppercased() ?? "none")")
// way 5
enum UserError: Error {
    case networkError
}
func getUser(_ number: Int) throws -> String {
    throw UserError.networkError
}
if let user = try? getUser(7) {
    print("user is \(user)")
} else {
    print("user is nil")
}
