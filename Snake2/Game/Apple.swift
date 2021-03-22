//
//  Apple.swift
//  Snake2
//
//  Created by Алла on 05.09.2020.
//  Copyright © 2020 Farhad Gatiyatov. All rights reserved.
//

import UIKit


class Apple:  UIView {
    
    static let appleSide: CGFloat = 20
    
    var canvas: UIView
    
    init(canvas: UIView) {
        self.canvas = canvas
        
        super.init(frame: .zero)
        self.recreate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func recreate() {
        self.removeFromSuperview()
        self.canvas.addSubview(self)
        
        self.frame.size.height = Apple.appleSide
        self.frame.size.width  = Apple.appleSide
        
        self.frame.origin.x = self.generateSide(from: self.canvas.frame.width)
        
        self.frame.origin.y = self.generateSide(from: self.canvas.frame.height)
        
        self.backgroundColor = .red
    }
    
    func generateSide(from canvasSide: CGFloat) -> CGFloat {
        var intVal = Int.random(in: 0...Int(canvasSide))
        intVal = intVal / Int(Apple.appleSide)
        return CGFloat(intVal) * Apple.appleSide
    }
}
