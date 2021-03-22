//
//  Options.swift
//  Snake2
//
//  Created by Oleg on 02.09.2020.
//  Copyright © 2020 Farhad Gatiyatov. All rights reserved.
//

import UIKit

class Options: UIViewController {
    
    @IBOutlet weak var speed: UISlider!{
        
        didSet {
            speed.maximumValue = 10
            speed.minimumValue = 0.5
        }
    }
    
    let optionsSpeed = UserDefaults.standard
    
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var goBackButtom: UIButton!
    
    var speedGame: Double = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speedLabel.layer.cornerRadius = 5
        goBackButtom.layer.cornerRadius = 5


    }
    @IBAction func buttonGoBack(_ sender: UIButton) {
        
        optionsSpeed.set(speedGame, forKey: "speedGame")
        
        self.dismiss(animated: true, completion: nil)
        
  
    }
    
    @IBAction func speedslider(_ sender: UISlider) {
        
        speedGame = Double(sender.value)
    }
    
    
}
