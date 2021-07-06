//
//  ResultViewController.swift
//  Tabu
//
//  Created by Ильдар Арсламбеков on 06.07.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    var score1: Int?
    var score2: Int?
    var name1: String?
    var name2: String?
    
   
    @IBOutlet weak var okButton: UIButton!
    
    @IBOutlet weak var winnerView: UIView!
    
    @IBOutlet weak var winnerNameLabel: UILabel!
    
    @IBOutlet weak var winnerStatusLabel: UILabel!
    
    
    @IBOutlet weak var name1Label: UILabel!
    
    @IBOutlet weak var score1Label: UILabel!
    
    @IBOutlet weak var name2Label: UILabel!
    
    @IBOutlet weak var score2Label: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if score1! > score2! {
            winnerNameLabel.text = name1!
        } else if score1! == score2! {
            winnerStatusLabel.text = "Ничья"
            winnerNameLabel.text = nil
        } else {
            winnerNameLabel.text = name2!
        }
        name1Label.text = name1!
        score1Label.text = String(score1!)
        name2Label.text = name2!
        score2Label.text = String(score2!)

    }
    
    
    @IBAction func pressOkButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
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
