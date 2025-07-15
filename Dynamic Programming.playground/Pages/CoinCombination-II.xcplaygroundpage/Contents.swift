//: [Previous](@previous)

import Foundation

//Consider a money system consisting of n coins. Each coin has a positive integer value. Your task is to calculate the number of distinct ordered ways you can produce a money sum x using the available coins.

let MOD = Int(1e9 + 7)

func coinCombinationsBackward(_ coins: [Int], _ x: Int) -> Int {
    let n = coins.count

    var dp = Array(repeating: Array(repeating: 0, count: x + 1),count: n + 1)

    // Base case: sum 0 → 1 way (do nothing)
    for i in 0..<n {
        dp[i][0] = 1
    }

    for i in stride(from: n - 1, through: 0, by: -1) {
        for sum in 1...x {
            let skip = dp[i + 1][sum]
            var pick = 0
            if coins[i] <= sum {
                pick = dp[i][sum - coins[i]]
            }
            dp[i][sum] = (skip + pick) % MOD
        }
    }

    return dp[0][x]
}

print(coinCombinationsBackward([2,2,5], 9))

