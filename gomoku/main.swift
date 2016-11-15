//
//  main.swift
//  gomoku
//
//  Created by Yuhsuan on 08/11/2016.
//  Copyright © 2016 cgua. All rights reserved.
//

import Foundation

var x = 0

var y = 0

var user_win = false

var flag = 0

var player: [String] = [String](repeating: "", count: 2)

var mark: [String] = [String](repeating: "", count: 2)

while true {
    
    print("請輸入一號玩家名稱？")
    
    guard let name = readLine() else {
        
        continue
        
    }
    
    player[0] = name
    
    break
    
}

while true {
    
    print("請選擇棋子（O, X）？")
    
    guard let chess = readLine() else {
        
        continue
        
    }
    
    if chess != "O" && chess != "X" {
        
        continue
        
    }
    
    mark[0] = chess
    
    break
    
}

mark[1] = (mark[0] == "O") ? "X" : "O"

while true {
    
    print("請輸入二號玩家名稱？")
    
    guard let name = readLine() else {
        
        continue
        
    }
    
    player[1] = name
    
    break
    
}

print("\(player[0])玩家為 \(mark[0])")

print("\(player[1])玩家為 \(mark[1])")

var board: [[String]] = [[String]](repeating: [String](repeating: "+", count: 10), count: 10)

for i in 0...9 {
    
    if i != 9 {
        
        print(i, terminator: " ")
        
        continue
        
    }
    
    print(i)
    
}

for row in board {
    
    for col in row {
        
        print(col, terminator: " ")
        
    }
    
    print()
    
}

while true {
    
    while true {
        
        print("請 \(player[flag]) 輸入棋子 x 位置?")
        
        guard let typed = readLine() else {
            
            continue
        }
        
        guard let num = Int(typed) else {
            
            continue
        }
        
        y = num
        
        break
        
    }
    
    
    
    while true {
        
        print("請 \(player[flag]) 輸入棋子y位置?")
        
        guard let typed = readLine() else {
            
            continue
        }
        
        guard let num = Int(typed) else {
            
            continue
        }
        
        x = num
        
        break
        
    }
    
    print("(\(y),\(x))")
    
    board[x][y] = mark[flag]
    
    for i in 0...9 {
        
        if i != 9 {
            
            print(i, terminator: " ")
            
            continue
            
        }
        
        print(i)
        
    }
    
    for row in board {
        
        for col in row {
            
            print(col, terminator: " ")
            
        }
        
        print()
        
    }
    //MARK: 判斷輸贏
    var temp_x = x
    
    var temp_y = y
    
    var count = 0
    
    if board[x][y] == mark[flag] {
        
        count += 1
        //往下
        while true {
            
            temp_x = temp_x + 1
            
            if temp_x > 9 {
                
                temp_x = x
                
                break
                
            }
            
            if board[temp_x][y] == mark[flag] {
                
                count += 1
                
                if count == 5 {
                    
                    print("win!!!")
                    
                    user_win = true
                    
                    break
                    
                }
                
            }
            else {
                
                temp_x = x
                
                break
                
            }
            
        }
        //往上
        while true {
            
            temp_x = temp_x - 1
            
            if temp_x < 0 {
                
                temp_x = x
                
                break
                
            }
            
            if board[temp_x][y] == mark[flag] {
                
                count += 1
                
                if count == 5 {
                    
                    print("win!!!")
                    
                    user_win = true
                    
                    break
                    
                }
                
            }
            else {
                
                count = 1
                
                temp_x = x
                
                break
                
            }
            
        }
        //往左
        while true {
            
            temp_y = temp_y - 1
            
            if temp_y < 0 {
                
                temp_y = y
                
                break
                
            }
            
            if board[x][temp_y] == mark[flag] {
                
                count += 1
                
                print("count:\(count)")
                
                if count == 5 {
                    
                    print("win!!!")
                    
                    user_win = true
                    
                    break
                    
                }
                
            }
            else {
                
                temp_y = y
                
                break
                
            }
        }
        //往右
        while true {
            
            temp_y = temp_y + 1
            
            if temp_y > 9 {
                
                temp_y = y
                
                break
                
            }
            
            if board[x][temp_y] == mark[flag] {
                
                count += 1
                
                print("count:\(count)")
                
                if count == 5 {
                    
                    print("win!!!")
                    
                    user_win = true
                    
                    break
                    
                }
                
            }
            else {
                
                count = 1
                
                temp_y = y
                
                break
                
            }
            
        }
        //右上
        while true {
            
            temp_x = temp_x - 1
            
            temp_y = temp_y + 1
            
            if temp_x < 0 || 9 < temp_x || temp_y < 0 || 9 < temp_y {
                
                temp_x = x
                
                temp_y = y
                
                break
                
            }
            
            if board[temp_x][temp_y] == mark[flag] {
                
                count += 1
                
                if count == 5 {
                    
                    print("win!!!")
                    
                    user_win = true
                    
                    break
                    
                }
                
            }
            else {
                
                temp_x = x
                
                temp_y = y
                
                break
                
            }
        }
        //左下
        while true {
            
            temp_x = temp_x + 1
            
            temp_y = temp_y - 1
            
            if temp_x < 0 || 9 < temp_x || temp_y < 0 || 9 < temp_y {
                
                temp_x = x
                
                temp_y = y
                
                break
                
            }
            
            
            if board[temp_x][temp_y] == mark[flag] {
                
                count += 1
                
                if count == 5 {
                    
                    print("win!!!")
                    
                    user_win = true
                    
                    break
                    
                }
                
            }
            else {
                
                count = 1
                
                temp_x = x
                
                temp_y = y
                
                break
                
            }
            
        }
        //左上
        while true {
            
            temp_x = temp_x - 1
            
            temp_y = temp_y - 1
            
            if temp_x < 0 || 9 < temp_x || temp_y < 0 || 9 < temp_y {
                
                temp_x = x
                
                temp_y = y
                
                break
                
            }
            
            if board[temp_x][temp_y] == mark[flag] {
                
                count += 1
                
                if count == 5 {
                    
                    print("win!!!")
                    
                    user_win = true
                    
                    break
                    
                }
                
            }
            else {
                
                temp_x = x
                
                temp_y = y
                
                break
                
            }
        }
        //往右下
        while true {
            
            temp_x = temp_x + 1
            
            temp_y = temp_y + 1
            
            if !((0 <= temp_x && temp_x <= 9) && (0 <= temp_y && temp_y <= 9)) {
                
                break
                
            }
            
            if board[temp_x][temp_y] == mark[flag] {
                
                count += 1
                
                if count == 5 {
                    
                    print("win!!!")
                    
                    user_win = true
                    
                    break
                    
                }
                
            }
            else {
                
                break
                
            }
            
        }
        
    }
    
    flag = (flag == 0) ? 1 : 0
    
    if user_win {
        
        print("遊戲結束")
        
        break
    }
    
}
