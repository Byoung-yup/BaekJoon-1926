//
//  main.swift
//  BaekJoon#1926
//
//  Created by 김병엽 on 2023/09/16.
//

let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
let (w, h) = (temp[1], temp[0])

var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: w), count: h)
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: w), count: h)

for i in 0..<h {
    let t = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[i] = t
}

var area: Int = 0
var painting: Int = 0

var maxArea: Int = 0

func bfs(x: Int, y: Int) {
    
    var idx = 0
    var queue: [(Int, Int)] = [(x, y)]
    
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    
    while queue.count > idx {
        
        let n = queue[idx]
        idx += 1
        
        area += 1
        
        for i in 0..<4 {
            
            let nx = n.0 + dx[i]
            let ny = n.1 + dy[i]
            
            if nx >= 0 && ny >= 0 && nx < w && ny < h && graph[ny][nx] == 1 && visited[ny][nx] == false {
                
                visited[ny][nx] = true
                queue.append((nx, ny))
            }
        }
    }
}

for j in 0..<h {
    for i in 0..<w {
        if visited[j][i] == false && graph[j][i] == 1 {
            visited[j][i] = true
            bfs(x: i, y: j)
            painting += 1

            if maxArea < area {
                maxArea = area
            }
            area = 0
        }
    }
}

print(painting)
print(maxArea)
