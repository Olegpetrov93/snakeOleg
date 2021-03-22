//
//  GAME.swift
//  Snake2
//
//  Created by Farhad Gatiyatov on 05.09.2020.
//  Copyright © 2020 Farhad Gatiyatov. All rights reserved.
//

import UIKit

enum Direction {
    case up, down, left, right, none
}
//
//protocol GameLiveCycle: class {
//    func gameOver()
//}

class Game {
    let canvas: UIView
    
    var speed = UserDefaults.standard.double(forKey: "speedGame")
    
    let snake: Snake
    let apple: Apple
    
    fileprivate var timer: Timer?
    
    var direction: Direction {
        return self.snake.direction
    }
    
   // weak var delegate: GameLiveCycle?
    
    init(canvas: UIView) {
        
        self.canvas = canvas
        
        self.apple = Apple(canvas: canvas)
        self.snake = Snake(canvas: canvas)

        NotificationCenter.default.addObserver(self, selector: #selector(self.snakeCrash), name: Notification.Name.init("SnakeCrash"), object: nil)
    }
    
    @objc func snakeCrash() {
        self.apple.removeFromSuperview()
        self.snake.clearSnake()
        self.timer = nil
        NotificationCenter.default.post(name: Notification.Name("GameOver"), object: nil)
    }
    
    func runGame() {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(timeInterval: 1 / self.speed, target: self, selector: #selector(self.gameLoop), userInfo: nil, repeats: true)
        self.timer?.fire()
    }
    
    @objc func gameLoop() {
//   //     if self.snake.checkPlayerDied() {
//            self.timer?.invalidate()
//        //    self.delegate?.gameOver()
//            return
//        }
        
        self.checkApple()

        self.snake.move(with: self.direction)
    }
    
    func checkApple() {
        if self.apple.frame.contains(self.snake.head.center){
            self.snake.addChild(point: self.apple.center)
            self.apple.recreate()
            NotificationCenter.default.post(name: Notification.Name("PlayerPoints"), object: nil)
        }
    }
    
    func up() {
        guard self.direction != .up && self.direction != .down else { return }
            self.snake.move(with: .up)
    }
    
    func down() {
        guard self.direction != .up && self.direction != .down else { return }
                self.snake.move(with: .down)
    }
    
    func left() {
        guard self.direction != .left && self.direction != .right else { return }
         self.snake.move(with: .left)
    }
    
    func right() {
        guard self.direction != .left && self.direction != .right else { return }
         self.snake.move(with: .right)
    }
    
    
    
    
    
    
}
