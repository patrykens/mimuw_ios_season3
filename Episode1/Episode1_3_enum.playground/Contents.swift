//: ## Enum

//: ### Plain enum
enum Direction {
	case north
	case south
	case east
	case west
}
let beachDirection: Direction = Direction.north

//: ### Enum with raw value
enum Order: Int {
	case first = 1
	case second = 2
	case third = 3
	// case ...
}
let classNumber: Order = .first
print(classNumber.rawValue)

guard let nextClass: Order = Order(rawValue: 2) else {
	fatalError("Order has no such case")
}
print(nextClass)
print(Order(rawValue: 2)!)

//: ### Enum with associated type

enum TrainStatus {
	case onTime
	case delayed(minutes: Int)
}

let status1: TrainStatus = TrainStatus.onTime
let status2: TrainStatus = TrainStatus.delayed(minutes: 10)

let switchStatus: TrainStatus = status2

switch switchStatus {
	case TrainStatus.onTime:
		print("It's on time")
	case TrainStatus.delayed(let minutes):
		print("Train is delayed \(minutes) min")
}
