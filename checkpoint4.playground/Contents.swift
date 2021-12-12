import UIKit

enum SquareError: Error {
    case tooLow, tooHigh, notFound
}

func squareRoot(for number: Int) throws -> Int {
    if number < 1 {
        throw SquareError.tooLow
    }
   
    if number > 10_000 {
        throw SquareError.tooHigh
    }
    
    for i in 1...100 {
        if i * i == number {
            return i
        }
    }
    
    // If there is no root found; will only run line if there is no return on line 19
    throw SquareError.notFound
}

let number = 6561

do {
    let root = try squareRoot(for: number)
    print("The square root of \(number) is \(root)")
// Catch all errors
} catch SquareError.tooLow {
    print("Sorry, \(number) is too low. Please provide a number between 1 - 10,000")
} catch SquareError.tooHigh {
    print("Sorry, \(number) too high. Please provide a number between 1 - 10,000")
} catch SquareError.notFound {
    print("Sorry, there was no square root found for \(number)")
} catch {
    print("Sorry, there was a problem")
}

