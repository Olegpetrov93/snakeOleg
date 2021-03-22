//
//  Game.swift
//  Snake2
//
//  Created by Oleg on 02.09.2020.
//  Copyright © 2020 Farhad Gatiyatov. All rights reserved.
//

import UIKit

class GameVC: UIViewController {

    @IBOutlet weak var canvas: UIView!
    @IBOutlet weak var goBack: UIButton!
    @IBOutlet weak var point: UILabel!
    
    
    let result = UserDefaults.standard
    
    var bestResult = UserDefaults.standard.array(forKey: "playerpoints")
    var playerPoints: Int = 0{
        didSet {
            point.text = String(playerPoints)
        }
    }
    
    
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.canvas.clipsToBounds = true
        
    
        // Do any additional setup after loading the view.
      
        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeR))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeL))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeUp: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeU))
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)
        
        let swipeDown: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeD))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.gameOver), name: Notification.Name("GameOver"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updatePoints), name: Notification.Name("PlayerPoints"), object: nil)
    }
    
    @objc func speedControlAction(step: UIStepper) {
        
        self.game?.speed = step.value
        self.game?.runGame()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = .black
        
        self.canvas.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1) {
            self.view.backgroundColor = .lightGray
            self.canvas.alpha = 1
        }
        
    }
    
    @objc func restartGame() {
        self.game = Game(canvas: self.canvas)
     //   self.game?.delegate = self
        self.game?.runGame()        
    }
    

    @objc func swipeR() {
        if game == nil {
        self.restartGame()
    }
    self.game?.right()
        
    }
    @objc func swipeL() {
        if game == nil {
               self.restartGame()
           }
           self.game?.left()
        
    }
    @objc func swipeU() {
        if game == nil {
            self.restartGame()
        }
        self.game?.up()
    }
    
    @objc func swipeD() {
        if game == nil {
            self.restartGame()
        }
        self.game?.down()
        
    }
    
    @IBAction func goBackAction(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
               
    }
    
    
}


extension GameVC{
    //: GameLiveCycle {
    @objc func gameOver() {
        if bestResult == nil {
            var array = [Int]()
            for _ in 0...9 {
                array.append(0)
            }
            bestResult = array
        }
        
        for i in 0...bestResult!.count - 1 {
                if playerPoints > bestResult?[i] as! Int {
                    let deffpoints = bestResult?[i]
                    bestResult?.insert(playerPoints, at: i)
                    playerPoints = deffpoints as! Int
                }
            }
            
            result.set(bestResult, forKey: "playerpoints")
        
        self.game = nil
        
        let alert = UIAlertController(title: "Game over", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Exit", style: .destructive, handler: { (_) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { (_) in
            self.restartGame()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    @objc func updatePoints() {
        playerPoints += 1
    }
}
