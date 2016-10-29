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