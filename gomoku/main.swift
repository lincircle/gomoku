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

var game = "L"

var flag = 0

var player_1 = ""

var player_2 = ""

var mark = ""

var player_name = ""

while true {
 
    print("請輸入一號玩家名稱？")
    
    guard let name = readLine() else {
        
        continue
        
    }
    
    player_1 = name
    
    break

}

while true {
    
    print("請輸入二號玩家名稱？")
    
    guard let name = readLine() else {
        
        continue
        
    }
    
    player_2 = name
    
    break
    
}

print("\(player_1)玩家為 O")

print("\(player_2)玩家為 X")

var board: [[String]] = [[String]](repeating: [String](repeating: "+", count: 10), count: 10)

for row in board {
    
    for col in row {
        
        print(col, terminator: " ")
        
    }
    
    print()
    
}

while true {
    
    switch flag {  //判斷玩家
        
    case 0: //player-1
        
        mark = "O"
        
        player_name = player_1
        
        
    case 1: //player-2
        
        mark = "X"
        
        player_name = player_2
        
    default:
        
        print("app error")
        
        break
    }

    while true {
        
        print("請 \(player_name) 輸入棋子 x 位置?")
        
        guard let typed = readLine() else {
            
            continue
        }
        
        guard let num = Int(typed) else {
            
            continue
        }
        
        x = num
        
        break
        
    }



    while true {
        
        print("請 \(player_name) 輸入棋子y位置?")
        
        guard let typed = readLine() else {
            
            continue
        }
        
        guard let num = Int(typed) else {
            
            continue
        }
        
        y = num
        
        break
        
    }
    
    print("(\(x),\(y))")
    
    board[x][y] = mark
    
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
    
    if board[x][y] == mark {
        
        count += 1
        //往下
        while true {
            
            temp_x = temp_x + 1
            
            if temp_x > 9 {
                
                temp_x = x
                
                break
                
            }
            
            if board[temp_x][y] == mark {
                
                count += 1
                
                if count == 5 {
                    
                    print("win!!!")
                    
                    game = "W"
                    
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
            
            if board[temp_x][y] == mark {
                
                count += 1
                
                if count == 5 {
                    
                    print("win!!!")
                    
                    game = "W"
                    
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
             
            if board[x][temp_y] == mark {
                
                count += 1
                
                print("count:\(count)")
                
                if count == 5 {
                    
                    print("win!!!")
                    
                    game = "W"
                    
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
            
            if board[x][temp_y] == mark {
                
                count += 1
                
                print("count:\(count)")
                
                if count == 5 {
                    
                    print("win!!!")
                    
                    game = "W"
                    
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
            
            if board[temp_x][temp_y] == mark {
                
                count += 1
                
                print("count:\(count)[右上]")
                
                if count == 5 {
                    
                    print("win!!!")
                    
                    game = "W"
                    
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
            
            
            if board[temp_x][temp_y] == mark {
                
                count += 1
                
                print("count:\(count)[左下]")
                
                if count == 5 {
                    
                    print("win!!!")
                    
                    game = "W"
                    
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
            
            if board[temp_x][temp_y] == mark {
                
                count += 1
                
                print("count:\(count)[左上]")
                
                if count == 5 {
                    
                    print("win!!!")
                    
                    game = "W"
                    
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
            
            if temp_x < 0 || 9 < temp_x || temp_y < 0 || 9 < temp_y {
                
                break
                
            }
            
            if board[temp_x][temp_y] == mark {
                
                count += 1
                
                print("count:\(count)[右下]")
                
                if count == 5 {
                    
                    print("win!!!")
                    
                    game = "W"
                    
                    break
                    
                }
                
            }
            else {
                
                break
                
            }
            
        }
 
    }
    
    if flag == 0 {
        
        flag = 1
        
    }
    else {
        
        flag = 0
        
    }
    
    if game == "W" {
        
        print("遊戲結束")
        
        break
    }
    
}






