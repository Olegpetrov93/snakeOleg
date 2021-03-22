//
//  ViewController.swift
//  Snake2
//
//  Created by Oleg on 05.07.2020.
//  Copyright © 2020 Farhad Gatiyatov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newGameButton: UIButton!
    
    @IBOutlet weak var optionsButton: UIButton!
    
    @IBOutlet weak var bestResultButtom: UIButton!
    override func viewDidLoad() {
           super.viewDidLoad()
        newGameButton.layer.cornerRadius = 3
        optionsButton.layer.cornerRadius = 3
        bestResultButtom.layer.cornerRadius = 3
       }
    
    @IBAction func newGameAction(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Game")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func optionsActions(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Options")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    @IBAction func bestResultActions(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "BestResult")
               vc.modalPresentationStyle = .fullScreen
               self.present(vc, animated: true, completion: nil)
    }
    
    
}


