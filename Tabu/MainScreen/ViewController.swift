import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var howToPlayButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        howToPlayButton.layer.cornerRadius = 12
        howToPlayButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        howToPlayButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        howToPlayButton.layer.shadowOpacity = 1.0
        howToPlayButton.layer.shadowRadius = 1.0
        howToPlayButton.layer.masksToBounds = false
        
        playButton.layer.cornerRadius = 14
        playButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.45).cgColor
        playButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.5)
        playButton.layer.shadowOpacity = 1.0
        playButton.layer.shadowRadius = 1.0
        playButton.layer.masksToBounds = false
        // Do any additional setup after loading the view.
    }
    @IBAction func playAction(_ sender: Any) {
//
//        guard let settingsViewController = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else { return }
//
//        navigationController?.pushViewController(settingsViewController, animated: true)
        
    
        //navigation between different storyboards
        let storyboard = UIStoryboard(name: "SettingsStoryboard", bundle: nil)
        guard let settingsViewController = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else {return}
        
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
    @IBAction func howToPlayAction(_ sender: Any) {
        guard let infoViewController = storyboard?.instantiateViewController(withIdentifier: "InfoViewController") as? InfoViewController else { return }
        present(infoViewController, animated: true)
    }
}

