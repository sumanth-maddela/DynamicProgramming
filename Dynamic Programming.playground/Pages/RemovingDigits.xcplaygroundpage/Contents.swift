//: [Previous](@previous)

import Foundation

//You are given an integer n. On each step, you may subtract one of the digits from the number.
//How many steps are required to make the number equal to 0?

func removeDigits(_ n: Int) -> Int {
    
//    dp[i] ==> mimimum steps to make i to zero = min {dp[i-digit1], dp[i-digit2], dp[i-digit3], ... }
    var dp = Array(repeating: Int(1e9), count: n + 1)
    dp[0] = 0
    
    for i in 1..<(n+1) {
        let charString = String(i)
            for char in charString {
                if let num = char.wholeNumberValue {
                    dp[i] = min(dp[i], dp[i-num]+1)
                }
        }
    }
    return dp[n]


}

let n = 27
print(removeDigits(n))
