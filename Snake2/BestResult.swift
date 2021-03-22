//
//  BestResult.swift
//  Snake2
//
//  Created by Oleg on 02.09.2020.
//  Copyright © 2020 Farhad Gatiyatov. All rights reserved.
//

import UIKit

class BestResult: UIViewController {
    
    @IBOutlet weak var gobackButtom: UIButton!
    
    @IBOutlet weak var tablebestresult: UITableView!
    
    var bestResult = UserDefaults.standard.array(forKey: "playerpoints")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gobackButtom.layer.cornerRadius = 5
        
        self.checkBestResult()
        
        self.tablebestresult.layer.cornerRadius = 5
        self.tablebestresult.delegate = self
        self.tablebestresult.dataSource = self
        self.tablebestresult.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    func checkBestResult() {
        if bestResult == nil {
            var array = [Int]()
            for _ in 0...9 {
                array.append(0)
            }
            bestResult = array
        }
    }
    
    @IBAction func buttonGoBack(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
}
extension BestResult: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bestResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if let result = bestResult?[indexPath.row] {
            cell.backgroundColor = .white
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.textColor = .black
            cell.textLabel?.text = "\(result)"
        }
        return cell
    }
}
extension BestResult: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
