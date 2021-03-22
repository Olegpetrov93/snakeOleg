//
//  Snake.swift
//  Snake2
//
//  Created by Farhad Gatiyatov on 07.07.2020.
//  Copyright © 2020 Farhad Gatiyatov. All rights reserved.
//

import UIKit

class Snake {
        
    var body = [Body]()
    var head: Body {
        return self.body.first!
    }
    
    
    let canvas: UIView
        
    init(canvas: UIView) {
        
        self.canvas = canvas
        
        let head = Body(pointX: self.canvas.frame.size.width / 2, pointY: self.canvas.frame.size.height / 2)
 
        body.append(head)
        
        self.canvas.addSubview(head)
        
        self.createTestTail()
    }
    func createTestTail() {
        for i in 0...5 {
            self.addChild(point: .zero)
        }
    }
    
    
    var direction: Direction = .right
    
   
    func addChild(point: CGPoint) {
        let child = Body(pointX: point.x, pointY: point.y)
        self.head.isMeal = true
        self.canvas.bringSubviewToFront(self.head)
        self.body.insert(child, at: 0)
        self.canvas.addSubview(child)
        child.center = point
//        child.isMeal = true
    }
    
    
    func move(with direction: Direction) {
        
        switch direction {
        case .up:
            self.up()
        case .down:
            self.down()
        case .left:
            self.left()
        case .right:
            self.right()
        case .none:
            break
        }
//        self.direction = direction
        self.moveBody(oldPoint: self.head.center)
    }
    
    func up() {
        guard self.direction != .down else { self.down(); return }

        self.head.backgroundColor = .yellow
        self.direction = .up
        
        if self.head.frame.origin.y < Apple.appleSide  {
            self.head.frame.origin.y = self.canvas.frame.size.height - Apple.appleSide
        } else {
            self.head.frame.origin.y -= Apple.appleSide
        }
//                self.checkPlayerDied()
    }
    
    func down() {
        guard self.direction != .up  else { self.up(); return }

        self.head.backgroundColor = .yellow

        self.direction = .down

        if self.head.frame.origin.y >= self.canvas.frame.size.height - Apple.appleSide {
            self.head.frame.origin.y = 0
        } else {
            self.head.frame.origin.y += Apple.appleSide
        }
//                self.checkPlayerDied()
    }
    
    func left() {
        guard self.direction != .right  else { self.right(); return }
        self.head.backgroundColor = .yellow

        self.direction = .left

        if self.head.frame.origin.x < Apple.appleSide {
            self.head.frame.origin.x = self.canvas.frame.size.width - Apple.appleSide
        } else {
            self.head.frame.origin.x -= Apple.appleSide
        }
//                self.checkPlayerDied()
    }
    
    func right() {
        guard self.direction != .left else { self.left(); return }

        self.head.backgroundColor = .yellow

        self.direction = .right
        
        if self.head.frame.origin.x >= self.canvas.frame.size.width - Apple.appleSide {
            self.head.frame.origin.x = 0
        } else {
            self.head.frame.origin.x += Apple.appleSide
        }
//        self.checkPlayerDied()
    }
    
    func moveBody(oldPoint: CGPoint) {
        var oldCenter = oldPoint
        var tmpCenter = oldPoint

        var isMeal = false
        
        for child in self.body {
            guard child != self.head else { continue }
            
            if self.head.center == child.center, self.head != child {
                
                NotificationCenter.default.post(name: Notification.Name.init("SnakeCrash"), object: nil)
                
            }
            
            tmpCenter = child.center
            child.center = oldCenter
            oldCenter = tmpCenter
            
            
            
            if child.isMeal {
                isMeal = true
                child.isMeal = false
                continue
            }
            
            if isMeal {
                child.isMeal = isMeal
                self.canvas.bringSubviewToFront(child)
                isMeal = false
            }
        }
    }
    func clearSnake() {
        for child in self.body {
            child.removeFromSuperview()
        }
    }
    
//    func checkPlayerDied() -> Bool {
//        for child in self.body {
//            guard child != self.head else { continue }
//            if self.head.center == child.center { return true }
//        }
//        return false
//    }
}


    
    
