//: [Previous](@previous)

import Foundation


//[1,2,3]  ==> [1,1,1]
//[*,5,6]  ==> [0,2,3]
//[7,*,9]  ==> [0,0,6]

//Consider an n * n grid whose squares may have traps. It is not allowed to move to a square with a trap.
//Your task is to calculate the number of paths from the upper-left square to the lower-right square. You can only move right or down.

func numberOfPathsWithTraps(_ grid: [[String]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    let MOD = Int(1e9 + 7)

    var dp = Array(repeating: Array(repeating: 0, count: n), count: m)

    dp[0][0] = grid[0][0] == "*" ? 0 : 1

    for j in 1..<n {
        if grid[0][j] == "*" {
            dp[0][j] = 0
        } else {
            dp[0][j] = dp[0][j-1]
        }
    }

    for i in 1..<m {
        if grid[i][0] == "*" {
            dp[i][0] = 0
        } else {
            dp[i][0] = dp[i-1][0]
        }
    }

    for i in 1..<m {
        for j in 1..<n {
            if grid[i][j] == "*" {
                dp[i][j] = 0
            } else {
                dp[i][j] = (dp[i-1][j] + dp[i][j-1]) % MOD
            }
        }
    }

    return dp[m-1][n-1]
}

let grid: [[String]] = [
  ["1","2","3","4"],
  ["6","*","7","8"],
  ["9","10","11","12"]
]

//print(numberOfPathsWithTraps(grid))

func minPathSumWithTraps(_ grid: [[Int?]]) -> Int {
    let m = grid.count
    let n = grid[0].count

    var dp = Array(repeating: Array(repeating: Int.max, count: n), count: m)

    if let start = grid[0][0] {
        dp[0][0] = start
    } else {
        return -1
    }

    for i in 1..<m {
        if let val = grid[i][0], dp[i-1][0] != Int.max {
            dp[i][0] = dp[i-1][0] + val
        }
    }

    for j in 1..<n {
        if let val = grid[0][j], dp[0][j-1] != Int.max {
            dp[0][j] = dp[0][j-1] + val
        }
    }

    for i in 1..<m {
        for j in 1..<n {
            guard let val = grid[i][j] else { continue }
            let top = dp[i-1][j]
            let left = dp[i][j-1]
            let minPrev = min(top, left)
            if minPrev != Int.max {
                dp[i][j] = minPrev + val
            }
        }
    }

    return dp[m-1][n-1] == Int.max ? -1 : dp[m-1][n-1]
}

let grid2: [[Int?]] = [
    [1, 3, nil],
    [1, 5, 1],
    [4, nil, 1]
]

print(minPathSumWithTraps(grid2))



