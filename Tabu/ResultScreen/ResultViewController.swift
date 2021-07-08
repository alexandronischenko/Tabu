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
    var team1: String?
    var team2: String?
    
    @IBOutlet weak var okView: UIView!
    @IBOutlet weak var okButton: UIButton!
    
    @IBOutlet weak var winnerView: UIView!
    @IBOutlet weak var winnerNameLabel: UILabel!
    @IBOutlet weak var winnerStatusLabel: UILabel!
    
    
    @IBOutlet weak var team1Label: UILabel!
    @IBOutlet weak var score1Label: UILabel!
    @IBOutlet weak var team2Label: UILabel!
    @IBOutlet weak var score2Label: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeShadow(view: okView)
        makeShadow(view: winnerView)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if score1! > score2! {
            winnerNameLabel.text = team1
        } else if score1! == score2! {
            winnerStatusLabel.text = "Friendship wins"
            winnerNameLabel.text = nil
        } else {
            winnerNameLabel.text = team2
        }
        team1Label.text = team1!
        score1Label.text = String(score1!)
        team2Label.text = team2!
        score2Label.text = String(score2!)
        
    }
    
    
    @IBAction func pressOkButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {return}
        
        //navigationController?.popToRootViewController(animated: true)
        navigationController?.pushViewController(viewController , animated: true)
    
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
    }
    
    private func makeShadow(view: UIView) {
        view.layer.shadowOffset = CGSize.init(width: 0, height: 3)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 10.0
        view.layer.shadowOpacity = 0.4
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
