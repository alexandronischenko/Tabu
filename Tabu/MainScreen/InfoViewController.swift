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
        
        textField.font = UIFont(name: "Marker Felt", size: 14.0)
        
        pageLabel.text = "1/5"
    }
    @IBAction func previousAction(_ sender: Any) {
        if step > 1 {
            step -= 1
            switch step {
            case 1:
                imageView.image = UIImage(named: "tabooLogo")
                textField.text = "Overview: \nTaboo is a verbal game played with two teams of three players or more, a deck of 502 guess cards with a set of taboo words, and a battery operated buzzer. The buzzer requires two AA batteries."
                pageLabel.text = "\(step) / \(countOfPages)"
            case 2:
                imageView.image = UIImage(named: "card")
                textField.text = "Game setup: \nSix or more players are divided up into two teams, with one team referred to as Team A and the other team referred to as Team B.504 cards are placed in the card holder and Team A selects a person in their group to be the Clue-giver. This person takes the card holder and places the first card away from his team so that they cannot see it. Clue cards have the clue word on the top of the card and the taboo words listed below the clue word. Clue-givers then start and keep the timer and must get their team to say the guess-word on the card without using one of the taboo words in one of their clues. If a taboo word is used then Team B must sound the buzzer which penalizes Team A by causing the current guess card to go into the discard pile.Play is continued until time runs out. Each time a teammate successfully guesses a clue-word, a new card is placed upon the old and each card in this pile represents one point for Team A."
                pageLabel.text = "\(step) / \(countOfPages)"
            case 3:
                imageView.image = UIImage(named: "watches")
                textField.text = "Gameplay and Scoring: \nThe team not giving clues must watch for Taboos or other violations of the rules. If they successfully spot a rule being broken, they may use their buzzer to interrupt play and very briefly explain the infraction. Clue-givers must place the current card into the discard pile and draw a new one. Each card in the discard pile represents one point for the other team. Once time runs out, the teams are swapped and roles are reversed. Once each player has taken a turn as clue-give, r the game ends. If teams are uneven, a player on the smaller team will be clue-giver twice."
                pageLabel.text = "\(step) / \(countOfPages)"
            case 4:
                imageView.image = UIImage(named: "rules")
                textField.text = "Rules: \n1. Clue-givers may not use any taboo words, including abbreviations and any part of the taboo word. 2. Clue-givers may not use sound effects or use gestures to indicate the clue word. 3. Clue-givers may pass on any card at any time, but the card is then placed in the discard pile. 4. When time is called, the final card does not go into the discard pile, but is instead removed from play."
                pageLabel.text = "\(step) / \(countOfPages)"
            case 5:
                imageView.image = UIImage(named: "cards")
                textField.text = "Scoring: \nEvery card stacked upon another in the card holder represents one point for Team A. Every card stacked in the discard pile represents one point for Team B. The final card in play when time runs out is worth no points for either team. At the end of each round points are tallied for each team, the winner is declared by the team with the most points."
                pageLabel.text = "\(step) / \(countOfPages)"
            default:
                break
            }
        }
    }
    @IBAction func nextAction(_ sender: Any) {
        if step != countOfPages {
            step += 1
            switch step {
//            case 1:
//                imageView.image = UIImage(named: "tabooLogo")
//                textField.text = "Overview: Taboo is a verbal game played with two teams of three players or more, a deck of 502 guess cards with a set of taboo words, and a battery operated buzzer. The buzzer requires two AA batteries."
//                pageLabel.text = "\(step) / \(countOfPages)"
            case 2:
                imageView.image = UIImage(named: "card")
                textField.text = "Game setup: \nSix or more players are divided up into two teams, with one team referred to as Team A and the other team referred to as Team B.504 cards are placed in the card holder and Team A selects a person in their group to be the Clue-giver. This person takes the card holder and places the first card away from his team so that they cannot see it. Clue cards have the clue word on the top of the card and the taboo words listed below the clue word. Clue-givers then start and keep the timer and must get their team to say the guess-word on the card without using one of the taboo words in one of their clues. If a taboo word is used then Team B must sound the buzzer which penalizes Team A by causing the current guess card to go into the discard pile.Play is continued until time runs out. Each time a teammate successfully guesses a clue-word, a new card is placed upon the old and each card in this pile represents one point for Team A."
                pageLabel.text = "\(step) / \(countOfPages)"
            case 3:
                imageView.image = UIImage(named: "watches")
                textField.text = "Gameplay and Scoring: \nThe team not giving clues must watch for Taboos or other violations of the rules. If they successfully spot a rule being broken, they may use their buzzer to interrupt play and very briefly explain the infraction. Clue-givers must place the current card into the discard pile and draw a new one. Each card in the discard pile represents one point for the other team. Once time runs out, the teams are swapped and roles are reversed. Once each player has taken a turn as clue-give, r the game ends. If teams are uneven, a player on the smaller team will be clue-giver twice."
                pageLabel.text = "\(step) / \(countOfPages)"
            case 4:
                imageView.image = UIImage(named: "rules")
                textField.text = "Rules: \n1. Clue-givers may not use any taboo words, including abbreviations and any part of the taboo word. 2. Clue-givers may not use sound effects or use gestures to indicate the clue word. 3. Clue-givers may pass on any card at any time, but the card is then placed in the discard pile. 4. When time is called, the final card does not go into the discard pile, but is instead removed from play."
                pageLabel.text = "\(step) / \(countOfPages)"
            case 5:
                imageView.image = UIImage(named: "cards")
                textField.text = "Scoring: \nEvery card stacked upon another in the card holder represents one point for Team A. Every card stacked in the discard pile represents one point for Team B. The final card in play when time runs out is worth no points for either team. At the end of each round points are tallied for each team, the winner is declared by the team with the most points."
                pageLabel.text = "\(step) / \(countOfPages)"
            default:
                break
            }
        }
    }
}
