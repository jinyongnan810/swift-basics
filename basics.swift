// variables
print("variables")
let notChangeable = 7
var changeable = "a"
print("notChangeable = \(notChangeable), is \(notChangeable.isMultiple(of: 3) ? "":"not") multiple of 3. changeable = \(changeable)")


// random things
print("random things")
print("random number: \(Int.random(in: 1...1000))")
let someList = ["a", "b", "c"]
print("pick random item: \(someList.randomElement() ?? "no item")")

// collections
print("collections")
// Dictionaries
// let person: Dictionary<String, String> = [
let person: [String: String] = [
// let person = [
    "name" : "Jack",
    "job" : "programmer"
]
print("Person's job: \(person["job", default: "none"])")
// Lists
let aList:[String] = ["red", "blue"]
let bList = [String]()
for item in aList {
    print("\(item)")
}
for iter in 1...10 {
    print(iter)
}
// Sets
var aSet = Set(["a", "b"])
aSet.insert("a")

// enums
print("enums")
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



