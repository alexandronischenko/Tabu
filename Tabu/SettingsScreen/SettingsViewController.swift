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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation to GameViewController
    @IBAction func PlayButtonAction(_ sender: Any) {
        if(FirstPlayerNameField.hasText && SecondPlayerNameField.hasText && TimeForGameInSeconds.hasText){
//
//            guard let gameViewController = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController else { return }
//
// MARK: - Data transfer
//            gameViewController.FirstName = FirstPlayerNameField.text
//            gameViewController.SecondName = SecondPlayerNameField.text
//            gameViewController.Time = TimeForGameInSeconds.text
//
//            navigationController?.pushViewController(GameViewController , animated: true)
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
}
