//: [Previous](@previous)

import Foundation


//[1,2,3]  ==> [1,3,6]
//[4,5,6]  ==> [5,_,_]
//[7,8,9]  ==> [13,_,_]

func maxPathSum(_ grid: [[Int]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    
//    dp[i][j] ==> max sum while traversing from (0,0) to (i,j) ==> max {dp[i-1][j] , dp[i][j-1] } ==> think of it as how can we reach (i,j)
    var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
    
    dp[0][0] = grid[0][0]
    
    for i in 1..<m {
        dp[i][0] = dp[i-1][0] + grid[i][0]
    }
    
    for j in 1..<n {
        dp[0][0] = dp[0][j-1] + grid[0][j]
    }
    
    
    for i in 1..<m {
        for j in 1..<n {
            let left = dp[i][j-1]
            let up = dp[i-1][j]
            
            dp[i][j] = max(left, up) + grid[i][j]
        }
    }
    
    return dp[m-1][n-1]
}

let grid = [[1,2,3],[4,5,6],[7,8,9]]
print(maxPathSum(grid))
