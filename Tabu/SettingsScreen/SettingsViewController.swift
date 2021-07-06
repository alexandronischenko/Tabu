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

        PlayButton.layer.cornerRadius = 25
        ViewSettings.layer.cornerRadius = 25
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
