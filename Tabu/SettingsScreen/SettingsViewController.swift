//
//  SettingsViewController.swift
//  Tabu
//
//  Created by Alexandr Onischenko on 06.07.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var PlayButton: UIButton!
    @IBOutlet weak var ViewSettings: UIView!
    @IBOutlet weak var FirstPlayerNameField: UITextField!
    @IBOutlet weak var SecondPlayerNameField: UITextField!
    @IBOutlet weak var TimeForGameInSeconds: UITextField!
    
    @IBOutlet weak var viewConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        
        viewConstraint.constant -= view.bounds.width
        buttonConstraint.constant -= view.bounds.width
        
        ViewSettings.layer.cornerRadius = 25
        ViewSettings.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        ViewSettings.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        ViewSettings.layer.shadowOpacity = 1.0
        ViewSettings.layer.shadowRadius = 0.0
        ViewSettings.layer.masksToBounds = false
        
        
        PlayButton.layer.cornerRadius = 25
        PlayButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        PlayButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        PlayButton.layer.shadowOpacity = 1.0
        PlayButton.layer.shadowRadius = 0.0
        PlayButton.layer.masksToBounds = false
    }
    
    // MARK: - Navigation to GameViewController
    @IBAction func PlayButtonAction(_ sender: Any) {
        if(FirstPlayerNameField.hasText && SecondPlayerNameField.hasText && TimeForGameInSeconds.hasText){
            
            let storyboard = UIStoryboard(name: "GameStoryboard", bundle: nil)
            guard let gameViewController = storyboard.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController else {return}
            // MARK: - Data transfer
            
            gameViewController.firstTeamName = FirstPlayerNameField.text!
            gameViewController.secondTeamName = SecondPlayerNameField.text!
            gameViewController.playerTime = Int(TimeForGameInSeconds.text!) ?? 60
            
            navigationController?.pushViewController(gameViewController , animated: true)
        }
        else{
            // MARK: - Error Alert
            let alert = UIAlertController(title: "Error", message: "You have not entered data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                                            switch action.style{
                                            case .default:
                                                print("default")
                                            case .cancel:
                                                print("cancel")
                                            case .destructive:
                                                print("destructive")
                                            @unknown default:
                                                fatalError()
                                            }}))
            self.present(alert, animated: true)
        }
    }
    
    var animationPerformedOnce = false
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        //MARK: - Animations for views
//        if !animationPerformedOnce {
//            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
//                self.buttonConstraint.constant += self.view.bounds.width
//                self.view.layoutIfNeeded()
//            }, completion: nil)
//
//            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
//                self.viewConstraint.constant += self.view.bounds.width
//                self.view.layoutIfNeeded()
//            }, completion: nil)
//
//            animationPerformedOnce = true
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
