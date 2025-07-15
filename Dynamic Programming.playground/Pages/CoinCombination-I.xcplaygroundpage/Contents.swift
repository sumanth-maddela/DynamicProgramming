//: [Previous](@previous)

import Foundation

//Consider a money system consisting of n coins. Each coin has a positive integer value. Your task is to calculate the number of distinct ways you can produce a money sum x using the available coins.

func calculateWays(_ coins: [Int],_ n: Int) -> Int {
//    dp[i] ==> Number of ways to produce sum x
    
//    dp[i] ==> ways to make { dp[i-c1] + dp[i-c2] + d[i-c3] + dp[i-c4] ... dp[i-cn]}
    
    var dp = Array(repeating: 0, count: n+1)
    dp[0] = 1
    
    for i in 1..<(n+1) {
        for coin in coins {
            if i - coin >= 0 {
                dp[i] += dp[i-coin]
            }
        }
    }
    
    return dp[n]
}

print(calculateWays([2,2,5], 9))
