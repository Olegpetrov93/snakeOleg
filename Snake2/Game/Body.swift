//
//  Body.swift
//  Snake2
//
//  Created by Алла on 05.09.2020.
//  Copyright © 2020 Farhad Gatiyatov. All rights reserved.
//

import UIKit


class Body: UIView {
        
    var pointX: CGFloat
    var pointY: CGFloat
    
    
    
    var isMeal = false {
        didSet {
            if self.isMeal {
                self.backgroundColor = .red
            } else {
                self.backgroundColor = .green
            }
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 7, options: .curveEaseInOut, animations: {
                if self.isMeal {
                    self.frame.size.width += 6
                    self.frame.size.height += 6
                    self.frame.origin.x -= 3
                    self.frame.origin.y -= 3
                    self.layer.cornerRadius += 3
                } else {
                    self.frame.size.width = Apple.appleSide
                    self.frame.size.height = Apple.appleSide
                    self.frame.origin.x += 3
                    self.frame.origin.y += 3
                    self.layer.cornerRadius -= 3
                }
            }, completion: nil)
        }
    }
    
    init(pointX: CGFloat, pointY: CGFloat) {
        self.pointX = pointX
        self.pointY = pointY
        
        super.init(frame: .zero)
        self.setUp()
    }
    
    init(center: CGPoint) {
        self.pointX = 0
        self.pointY = 0
        super.init(frame: .zero)
        self.center = center
        
        self.pointX = self.frame.origin.x
        self.pointY = self.frame.origin.y
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        
        self.frame.size.height = Apple.appleSide
        self.frame.size.width  = Apple.appleSide
        
        self.frame.origin.x = pointX
        self.frame.origin.y = pointY
        
        
        self.backgroundColor = .green
        
        self.layer.cornerRadius = Apple.appleSide / 2
    }
}
