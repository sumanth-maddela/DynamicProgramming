//: [Previous](@previous)

import Foundation

//Given an m x n grid, you start in the top-left corner (0, 0) and your goal is to reach the bottom-right corner (m-1, n-1).
//You can only move either right or down at any point in time.


//[1,2,3]  ==> [1,1,1]
//[4,5,6]  ==> [1,2,3]
//[7,8,9]  ==> [1,3,6]

func numberOfPaths(_ grid:[[Int]]) -> Int {
//    dp[i][j] ==> Number of ways to reach (i,j) from (0,0) => sum { dp[i-1][j], dp[i][j-1] }
    let m = grid.count
    let n = grid[0].count
    
    var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
    
    for i in 0..<m {
        dp[i][0] = 1
    }
    
    for j in 0..<n {
        dp[0][j] = 1
    }
    
    for i in 1..<m {
        for j in 1..<n {
            let left = dp[i][j-1]
            let down = dp[i-1][j]
            
            dp[i][j] = left + down
        }
    }
    
    return dp[m-1][n-1]
}

let grid = [[1,2,3],[4,5,6],[7,8,9]]
print(numberOfPaths(grid))
