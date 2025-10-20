//
//  BinarySearch.swift
//
//  Created by Atri Sarker
//  Created on 2025-10-15
//  Version 1.0
//  Copyright (c) 2025 Atri Sarker. All rights reserved.
//
// Program that allows the user to search for a number in a list of numbers.
// The search is done using Binary Search.

// Constant for the size of the array.
let arraySizeConstant = 10
// Constant for the minimum random integer.
let minBound = 0
// Constant for the maximum random integer.
let maxBound = 100

// Function that generates an array filled with random integers.
func populateArray(_ minNum: Int, _ maxNum: Int, _ arraySize: Int) -> [Int] {
    // Create an empty array
    var arr: [Int] = []
    // Go through every index of the array
    // And populate it with a random integer between {minNum} and {maxNum}
    for _ in 0..<arraySize {
        // Generate a random integer between {minNum} and {maxNum} [INCLUSIVE]
        let randNum: Int = Int.random(in: minNum...maxNum)
        // Append the random integer to the array
        arr.append(randNum)
    }
    // Return the populated array
    return arr
}

// Function that searches for an Int in an [Int].
// Using Binary Search.
func binarySearch(_ arr: [Int], _ target: Int) -> Int {
    // Initialize low and high search interval bounds
    var low: Int = 0
    var high: Int = arr.count - 1
    // Initialize index
    // It's set to -1 in case the target isn't found
    var index: Int = -1
    // Loop
    while low <= high {
        // Get the midpoint of the current search interval
        let midpoint = (low + high) / 2
        // Get the value found at the midpoint
        let value = arr[midpoint]
        // Compare the midpoint to the target
        if value < target {
            // If the value is lesser than the target,
            // set the search interval to contain everything after the midpoint.
            low = midpoint + 1
        } else if value > target {
            // If the value is greater than the target,
            // set the search interval to contain everything before the midpoint.
            high = midpoint - 1
        } else {
            // If the value is neither greater or lesser than the target,
            // the value must be the target.
            // The target has been found.
            // Set index to the midpoint and break out of the loop.
            index = midpoint
            break
        }
    }
    // Return the index
    return index
}

// Create variable for user input
var userInput: String = ""
// LOOP
repeat {
    // Create an array filled with random integers
    var arr: [Int] = populateArray(minBound, maxBound, arraySizeConstant)
    // Sort the array
    arr.sort()
    // Prompt message
    print("What number do you want to search for", terminator: " ")
    print("in the list below? Enter 'q' to quit.")
    // Print the array
    print(arr, terminator: " ")
    // Input prompt
    print("Number: ", terminator: "")
    // Get user input as a string
    userInput = readLine() ?? ""
    // Check if the user wants to quit
    if userInput.lowercased() == "q" {
        // If so, break the loop
        break
    }
    // Try to convert the user input into an integer
    if let userTarget: Int = Int(userInput) {
        // Search for the target in the array
        let targetIndex: Int = binarySearch(arr, userTarget)
        // Check if the target was found
        if targetIndex != -1 {
            // If so, print the index of the target
            print("The number \(userTarget) ", terminator: "")
            print("was found at index \(targetIndex).")
        } else {
            // If not, print that the target wasn't found [IN RED]
            print("\u{001B}[31m", terminator: "") // Red color code
            print("ERROR: The number \(userTarget) ", terminator: "")
            print("was not found in the list of numbers.")
            print("\u{001B}[0m", terminator: "") // Reset color code
        }
    } else if userInput.lowercased() != "q" {
        // Error message for non-numeric input [IN RED]
        print("\u{001B}[31m", terminator: "") // Red color code
        print("ERROR: INPUT MUST BE AN INTEGER!")
        print("\u{001B}[0m", terminator: "") // Reset color code
    }
} while userInput.lowercased() != "q"
 // Loop condition is redundant
 // because the same condition is within the loop.
 // But I still included it because
 // I don't know if I am allowed to use a while true loop
 // Goodbye message
 print("Thanks for playing!")
