//: [Previous](@previous)

import Foundation


//You are given a standard dice (or die) with faces numbered from 1 to 6. You roll the dice N times. Find the number of possible ways to get a total sum of S after N rolls.

func numberOfWays(_ n: Int) -> Int {
    var res = 0
    
//    dp[i] ==> Number of possible ways to get a sum i 
    var dp = Array(repeating: 0, count: n+1)
    //Base case -> t
    dp[0] = 1
    
    for i in 1..<n+1 {
        for k in 1...6 {
            if i-k >= 0 {
                dp[i] += dp[i-k]
            }
        }
    }
    
    return dp[n]
}



print(numberOfWays(10))
