/*:
 ## Introduction
 
 Looks like I need to gain more understanding in Big O notation. Best way to do this? Build a playground that shows different examples and explains how to use Big O and how we get the answer we get in terms I can understand.
 
 ## What is Big O Notation?
 
 Big O notation is the language used to articulate how long an algorithm takes to run. It's used to compare the efficency of different approaches to a problem.
 
 Big O notation is used to express the runtime in terms of how quickly it grows relative to the input, as the input gets arbitrarily large.
 
 What does this even mean?
 
 ### How quickly the runtime grows:
 Some external factors effect the time it takes for a function to run: the processing speed, what else the computer is running, etc. It's hard to make statements about the exact runtime of an algorith, instead we use big O notation to express how quickly its runtime grows.
 
 ### Relative to the input:
 Since we're not looking at an exact number, we need something to express our runtime growth in term of. For big o notation, we use the size of the inpurt. This allows us to express the following.
 
 "The runtime grows on the order of the size of the input" which is O(n) or "on the order of the square of the size of the inpurt" which is O(n²)
 
 ### As the input gets arbitrarily large:
 Our algorithm may have steps that seem expensive when n is small, but are eclipsed eventually by other steps as n gets huge. For big O analysis, we care most about the stuff that grows fastest as the input grows.
 
Look into "asymptotic analysis" for more information.
 
 ## Some Examples
*/

let itemsArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

//: The following function runs in O(1) time, "constant time" relative to its input. The input array could be 1 item or 10,000 items, this function would still be one "step"

func printFirstItem(itemsArray: Array<Any>) {
    print(itemsArray[0])
}
printFirstItem(itemsArray: itemsArray)

//: The following function runs in O(n) time, "linear time" where n is the number of items in the array. If the array has ten items, we have to print ten times, if it has 1,000 itmes, we print 1,000 times.

func printAllItems(itemsArray: Array<Any>) {
    for singleItem in itemsArray {
        print(singleItem)
    }
}
printAllItems(itemsArray: itemsArray)

//: The following function is nesting two loops. If our array has n items, the outer loop runs n times and the inner loop runs n times for each iteration of the outer loop. This gives us n² total prints. Therefore, the following funtion runs in O(n²) time, "quadratic time"". If the array has 10 items, we have to print 100 times. If it has 1,000 items, we print 1,000,000 times.

func printAllPossibleOrderedPairs(itemsArray: Array<Any>) {
    for firstItem in itemsArray {
        for secondItem in itemsArray {
            print(firstItem, secondItem)
        }
    }
}
printAllPossibleOrderedPairs(itemsArray: itemsArray)

/*:
 ## N could be the _actual_ input, or the _size_ of the input.
 
 Both of the following functions have O(n) runtime, even though one takes an integer as an input, and the other takes an array.
 */

func sayHelloNTimes(n: Int) {
    for _ in 0 ..< n {
        print("hi")
    }
}

func printAllItemsInArray(itemsArray: Array<Any>) {
    for singleItem in itemsArray {
        print(singleItem)
    }
}
sayHelloNTimes(n: 1)
printAllItemsInArray(itemsArray: itemsArray)

//: Sometimes n is an actual number that's an input to a function, other times n is the number of items in an input array (input objects as well)

/*:
 ## Drop the constants
 
 When calculating the big O complexity of something, you just throw out the constants. For example, below we have a function that has two for loops to print each item.
*/

func printAllItemsTwice(itemsArray: Array<Any>) {
    for singleItem in itemsArray {
        print(singleItem)
    }
    
    for singleItem in itemsArray {
        print(singleItem)
    }
}
printAllItemsTwice(itemsArray: itemsArray)

//: This is O(2n) which we just simplify to O(n)

import Foundation

func printFirstItemThenFirstHalfThenSayHi100Times(itemsArray: Array<Any>) {
    print(itemsArray[0])
    
    let middleIndex = Int(floor((Double(itemsArray.count / 2))))
    var index = 0
    
    while index < middleIndex {
        print(itemsArray[index])
        index += 1
    }
    
    for _ in 0 ..< 100 {
        print("hi")
    }
}
printFirstItemThenFirstHalfThenSayHi100Times(itemsArray: itemsArray)

/*: 
 The above function is O(1 + n/2 + 100) which we can just call O(n).
 
 But how can we get away with this? For big O notation, we're looking for what happens as n gets arbitrarilty large. As n gets really big, adding 100 or dividing by 2 has a decreasingly significant effect.
 */

//: ## Drop the less signifcant terms

func printAllNumbersThenAllPairSums(arrayOfNumbers: Array<Int>) {
    
    print("these are the numbers:")
    for number in arrayOfNumbers {
        print(number)
    }
    
    print("and these are their sums:")
    for firstNumber in arrayOfNumbers {
        for secondNumber in arrayOfNumbers {
            print(firstNumber + secondNumber)
        }
    }
    
}
printAllNumbersThenAllPairSums(arrayOfNumbers: itemsArray)

/*: Here the runtime is O(n + n²) which we just call O(n²). Even if it was O(n²/2 + 100n) it would still be O(n²).

 Similarly:
 
 O(n​³ + 50n² + 10000) is equal to O(n​³)
 O((n + 30) * (n  5)) is equal to O(n²)
 
 Let it sink in, we can get away with this because the less significant terms quickly become less significant as n gets larger.

 ## Big O is usually talking about the "worst case" scenario.
 
 Sometimes the worst case runtime is significantly worse than the best case runtime. For example:
 */


func contains(haystack: Array<Int>, needle: Int) -> Bool {
    
    for x in 0 ..< haystack.count {
        print(x)
        if haystack[x] == needle { return true }
    }
    
    return false
    
}

/*: Here we might have 100 items in the haystack, but the first item might be the needle, so then we would just return in 1 iteration of our loop.
 
 We would generally say this is O(n) runtime and the worst case is implied with this. However, we could be more specific and say that the worst case is O(n) and the best case is O(1) runtime.
 */

contains(haystack: itemsArray, needle: 1)
contains(haystack: itemsArray, needle: 10)
 
/*: ## Space complexity
 
 Sometimes algorithms are optimized for using less memory instead (or in addition to) using less time. Talking about memory cost is similar to talking about time cost. Simply look at the total size (relative to the size of the input) of any new variables we're allocating.
*/

func sayHiNTimes(n: Int) {
    for _ in 0 ..< n {
        print("hi")
    }
}
sayHiNTimes(n: 2)

//: The above function takes O(1) space as we're not allocating any new variables.

func arrayOfHiNTimes(n: Int) -> [String] {
    var hiArray = [String]()
    for x in 0 ..< n {
        hiArray.insert("hi", at: x)
    }
    return hiArray
}
arrayOfHiNTimes(n: 5)

//: The above function takes O(n) space as the size of the returned array scales with the size of the input.

//: When discussing space complexity, it is usually discussing additional space. So this means don't include the space taken up by any inputs. For example, the below function takes constant space even though the input has n items.

func getLargestItem(itemsArray: Array<Int>) -> Int {
    var largest = 0
    for item in itemsArray {
        if item > largest {
            largest = item
        }
    }
    
    return largest
}

getLargestItem(itemsArray: itemsArray)

//: Sometimes there is a tradeoff between saving time and saving space, decide what you're optimizing for before you start!