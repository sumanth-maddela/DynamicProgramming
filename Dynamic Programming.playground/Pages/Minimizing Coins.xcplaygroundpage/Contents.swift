import UIKit

//Consider a money system consisting of n coins. Each coin has a positive integer value. Your task is to produce a sum of money x using the available coins in such a way that the number of coins is minimal.


func minimizingCoins(_ coins: [Int],_ n: Int) ->Int {
//    dp[i] ==> minimum number of coins to produce a sum i
    var res = Int.max
    var dp = Array(repeating: Int.max, count: n+1)
    
    dp[0] = 0
    
//    dp[i] - min { dp[i-c1], dp[i-c2], dp[i-c3] ...} where i > ci
    
    
    for i in 0..<(n+1) {
        for coin in coins {
            if i - coin >= 0 {
                dp[i] = min(dp[i], dp[i-coin] + 1)
            }
        }
    }
    
    return dp[n] == Int.max ? -1 : dp[n]
}

print(minimizingCoins([1,5,7], 11))
