//
//  ResultViewController.swift
//  Tabu
//
//  Created by Ильдар Арсламбеков on 06.07.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var okButton: UIButton!
    
    @IBOutlet weak var winnerStatusLabel: UILabel!
    
    @IBOutlet weak var winnerNameLabel: UILabel!
    
    @IBOutlet weak var name1Label: UILabel!
    
    @IBOutlet weak var score1Label: UILabel!
    
    @IBOutlet weak var name2Label: UILabel!
    
    @IBOutlet weak var score2Label: UILabel!
    
    init(name1: String, name2: String, score1: Int, score2: Int) {
        if score1 > score2 {
            winnerNameLabel.text = name1
        } else if score1 == score2 {
            winnerStatusLabel.text = "Ничья"
            winnerNameLabel.text = nil
        } else {
            winnerNameLabel.text = name2
        }
        name1Label.text = name1
        score1Label.text = String(score1)
        name2Label.text = name2
        score2Label.text = String(score2)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
