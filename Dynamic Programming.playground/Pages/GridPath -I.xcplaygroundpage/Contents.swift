//: [Previous](@previous)

import Foundation

//Consider an n * n grid.
//Your task is to calculate the number of paths from the upper-left square to the lower-right square. You can only move right or down.

func minPathSum(_ grid: [[Int]]) -> Int {
//    dp[i][j] ==> min path sum from (0,0) to (m-1,n-1) ==> min{dp[i-1][j],dp[i][j-1] } + grid[i][j]
    let m = grid.count
    let n = grid[0].count
    var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
    
    dp[0][0] = grid[0][0]
    
    for i in 1..<m {
        dp[i][0] = dp[i-1][0] + grid[i][0]
    }

    
    for j in 1..<n {
        dp[0][j] = dp[0][j-1] + grid[0][j]
    }
    
    for i in 1..<m {
        for j in 1..<n {
            let above = dp[i-1][j]
            let left = dp[i][j-1]
            dp[i][j] = min(above, left) + grid[i][j]
        }
    }
    return dp[m-1][n-1]
}

let grid = [[1,3,1],[1,5,1],[4,2,1]]
print(minPathSum(grid))
