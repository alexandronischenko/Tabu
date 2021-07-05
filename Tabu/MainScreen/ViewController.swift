import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func playAction(_ sender: Any) {
//        guard let settingsViewController = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else { return }
//        navigationController?.pushViewController(settingsViewController, animated: true)
    }
    @IBAction func howToPlayAction(_ sender: Any) {
    guard let infoViewController = storyboard?.instantiateViewController(withIdentifier: "InfoViewController") as? InfoViewController else { return }
        present(infoViewController, animated: true)
    }
}

