import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var rulesLabel: UILabel!
    @IBOutlet weak var rulesView: UIView!
    
    let countOfPages = 5
    var step = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.isEditable = false
        previousButton.layer.cornerRadius = 8
        previousButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        previousButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        previousButton.layer.shadowOpacity = 1.0
        previousButton.layer.shadowRadius = 1.0
        previousButton.layer.masksToBounds = false
        
        nextButton.layer.cornerRadius = 8
        nextButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        nextButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        nextButton.layer.shadowOpacity = 1.0
        nextButton.layer.shadowRadius = 1.0
        nextButton.layer.masksToBounds = false
        
        rulesView.layer.cornerRadius = 10
        rulesView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        rulesView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        rulesView.layer.shadowOpacity = 1.0
        rulesView.layer.shadowRadius = 1.0
        rulesView.layer.masksToBounds = false
        
        //textField.font = UIFont(name: "", size: 16.0)
        imageView.layer.cornerRadius = 10
        
        pageLabel.text = "1/5"
    }
    @IBAction func previousAction(_ sender: Any) {
        nextButton.isHidden = false
        if step > 1 {
            step -= 1
            switch step {
            case 1:
                imageView.image = UIImage(named: "tabooLogo")
                textField.text = "Overview: \nTaboo is a verbal game played with two teams a deck of 502 guess cards with a set of taboo words"
                pageLabel.text = "\(step) / \(countOfPages)"
                previousButton.isHidden = true
            case 2:
                imageView.image = UIImage(named: "card")
                textField.text = "Preparation for the game: \nThe players are divided into two teams: one team is called team A and the other is called team B. 502 cards are placed in the card holder. It is the turn of the player from team A. The hint player takes a card containing 5 taboo words, that is, words that cannot be named when explaining just one word written on the card. The game continues until the time runs out. Each time a teammate successfully guesses a keyword, a new card is placed on top of the old one, and each card in that pile represents one point for Team A. In the event that a player from the first team says the word “taboo,” a point is awarded to the second team. There comes a change of teams."
                pageLabel.text = "\(step) / \(countOfPages)"
            case 3:
                imageView.image = UIImage(named: "watches")
                textField.text = "Gameplay and scoring: \nin the event that a player answers correctly, the point goes to his team. In the case when a player, prompting his team-mate, names the word taboo, the point goes to the other team. Also, if the player does not cope with this card, he can change it. The previously listed rules are for all teams."
                pageLabel.text = "\(step) / \(countOfPages)"
            case 4:
                imageView.image = UIImage(named: "rules")
                textField.text = "Rules: \n1. Clue-givers may not use any taboo words, including abbreviations and any part of the taboo word. 2. Clue-givers may not use sound effects or use gestures to indicate the clue word. 3. Clue-givers may pass on any card at any time, but the card is then placed in the discard pile."
                pageLabel.text = "\(step) / \(countOfPages)"
            case 5:
                imageView.image = UIImage(named: "cards")
                textField.text = "Scoring: \nEvery card stacked upon another in the card holder represents one point for Team A. Every card stacked in the discard pile represents one point for Team B.  At the end of each round points are tallied for each team, the winner is declared by the team with the most points."
                pageLabel.text = "\(step) / \(countOfPages)"
            default:
                break
            }
        }
    }
    @IBAction func nextAction(_ sender: Any) {
        previousButton.isHidden = false
        if step != countOfPages {
            step += 1
            switch step {
//            case 1:
//                imageView.image = UIImage(named: "tabooLogo")
//                textField.text = "Overview: Taboo is a verbal game played with two teams of three players or more, a deck of 502 guess cards with a set of taboo words, and a battery operated buzzer. The buzzer requires two AA batteries."
//                pageLabel.text = "\(step) / \(countOfPages)"
            case 2:
                imageView.image = UIImage(named: "card")
                textField.text = "Preparation for the game: \nThe players are divided into two teams: one team is called team A and the other is called team B. 502 cards are placed in the card holder. It is the turn of the player from team A. The hint player takes a card containing 5 taboo words, that is, words that cannot be named when explaining just one word written on the card. The game continues until the time runs out. Each time a teammate successfully guesses a keyword, a new card is placed on top of the old one, and each card in that pile represents one point for Team A. In the event that a player from the first team says the word “taboo,” a point is awarded to the second team. There comes a change of teams."
                pageLabel.text = "\(step) / \(countOfPages)"
            case 3:
                imageView.image = UIImage(named: "watches")
                textField.text = "Gameplay and scoring: \nin the event that a player answers correctly, the point goes to his team. In the case when a player, prompting his team-mate, names the word taboo, the point goes to the other team. Also, if the player does not cope with this card, he can change it. The previously listed rules are for all teams."
                pageLabel.text = "\(step) / \(countOfPages)"
            case 4:
                imageView.image = UIImage(named: "rules")
                textField.text = "Rules: \n1. Clue-givers may not use any taboo words, including abbreviations and any part of the taboo word. 2. Clue-givers may not use sound effects or use gestures to indicate the clue word. 3. Clue-givers may pass on any card at any time, but the card is then placed in the discard pile."
                pageLabel.text = "\(step) / \(countOfPages)"
            case 5:
                imageView.image = UIImage(named: "cards")
                nextButton.isHidden = true
                textField.text = "Scoring: \nEvery card stacked upon another in the card holder represents one point for Team A. Every card stacked in the discard pile represents one point for Team B.  At the end of each round points are tallied for each team, the winner is declared by the team with the most points."
                pageLabel.text = "\(step) / \(countOfPages)"
            default:
                break
            }
        }
    }
}
