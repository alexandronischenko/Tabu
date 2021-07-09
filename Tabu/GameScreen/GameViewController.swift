//
//  ViewController.swift
//  GameScreen
//
//  Created by Evans Owamoyo on 05.07.2021.
//

import UIKit

class GameViewController: UIViewController {
    // constants
    private static let DEFAULT_CARD = ["-_-","-_-","-_-","-_-","-_-","-_-"]
    
    @IBOutlet weak var firstTeamNameLabel: UILabel!
    @IBOutlet weak var secondTeamNameLabel: UILabel!
    @IBOutlet weak var player1ScoreLabel: UILabel!
    @IBOutlet weak var player2ScoreLabel: UILabel!
    @IBOutlet weak var timeRemainingLabel: UILabel!
    @IBOutlet weak var mainCardWordLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var opponentButton: RoundedUIButton!
    @IBOutlet weak var passButton: RoundedUIButton!
    
    // MARK: - variables that must be passed from settings screen
    var firstTeamName: String = "Team 1"
    var secondTeamName: String = "Team 2"
    var playerTime: Int?
    var numberOfRounds: Int = 1
    var playingWithCube: Bool = false
    
    
    // MARK: - Timer objects
    private weak var timer: Timer!
    
    private var timeRemaining: Int!
    
    // MARK: - Round variables [RoundCount, Cube]
    
    // current round being played
    // game ends when roundCount >= numberOfRounds * 2
    // because each team has one round and there are two teams
    private var roundCount: Int = 0
    
    // variable that determines the rules of the round
    private var roundCube: Cubic = .classicRules
    
    
    // MARK: - score variables
    private var player1Score: Int = 0
    private var player2Score: Int = 0
    
    // MARK: - data
    private let gameData = GameData()
    private var currentCard : [String] = DEFAULT_CARD
    
    private var opponentButtonImage: UIImage?
    private var passButtonImage: UIImage?
    deinit {
        timer.invalidate()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        if let playerTime = playerTime,
           numberOfRounds >= 1 {
            firstTeamNameLabel.text = firstTeamName
            secondTeamNameLabel.text = secondTeamName
            player1ScoreLabel.text = String(player1Score)
            player2ScoreLabel.text = String(player2Score)
            timeRemainingLabel.text = "\(playerTime)"
            roundLabel.text = "Round - /\(numberOfRounds)"
            mainCardWordLabel.text = currentCard[0]
            
            opponentButtonImage = opponentButton.currentImage
            passButtonImage = passButton.currentImage
            passButton.titleLabel?.textAlignment = .center
            opponentButton.titleLabel?.textAlignment = .center
            passButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            opponentButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            passButton.setTitleColor(.gray, for: .highlighted)
            opponentButton.setTitleColor(.gray, for: .highlighted)
            
        } else {
            /* data must be passed to this screen from the settings screen
             ELSE: pop to the previous screen
             */
            navigationController?.popViewController(animated: true)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        player1Score = 0
        player2Score = 0
        roundCount = 0
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupRound()
    }
    
    
    private func restartTime() {
        self.timeRemaining =
            roundCube == .doubleTime || roundCube == .allPlay
                ? self.playerTime! * 2
                : self.playerTime!
        timeRemainingLabel.text = "\(self.timeRemaining ?? 0)"
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateTime),
            userInfo: nil,
            repeats: true
        )
    }
    
    
    @objc private func updateTime() {
        guard let timeRemaining = timeRemaining else {
            timer.invalidate()
            return
        }
        if timeRemaining > 0 {
            self.timeRemaining -= 1
            timeRemainingLabel.text = "\(self.timeRemaining ?? 0)"
        } else {
            timer.invalidate()
            if roundCount % 2 == 1 {
                // change round to team round
                roundCount += 1
                showAlertView()
            } else {
            // change round to new round
                if roundCount >= numberOfRounds * 2 {
                    navigateToResultScreen()
                } else {
                    setupRound()
                }
            }
        }
    }
    
    private func setupRound() {
        
        if playingWithCube {
            roundCube = Cubic.rollTheDice()
            let alert = UIAlertController(
                title: "Round Rules",
                message: roundCube.description,
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {[weak self] _ in
                self?.postSetupRound()
            }))
            present(alert, animated: true, completion: nil)
        } else {
            postSetupRound()
        }
        
    }
    
    private func postSetupRound() {
        switch roundCube {
        case .allPlay:
            // change middle button to team 1 button
            passButton.setTitle(secondTeamName + "\n+1", for: .normal)
            opponentButton.setTitle(firstTeamName + "\n+1", for: .normal)
            
            passButton.setImage(nil, for: .normal)
            opponentButton.setImage(nil, for: .normal)
            
            opponentButton.backgroundColor = #colorLiteral(red: 0.2097333968, green: 0.3434100747, blue: 0.6004926562, alpha: 1)
            roundCount += 2
        default:
            // change middle button to default button
            configureDefaultButton()
            roundCount += 1
        }
        roundLabel.text = "Round \((roundCount+1) / 2)/\(numberOfRounds)"
        showAlertView()
    }
   
    private func configureDefaultButton() {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 35, weight: .heavy, scale: .large)
        passButton.setTitle(nil, for: .normal)
        opponentButton.setTitle(nil, for: .normal)
        passButton.setImage(passButtonImage?.withConfiguration(largeConfig), for: .normal)
        opponentButton.setImage(opponentButtonImage?.withConfiguration(largeConfig), for: .normal)
        
        opponentButton.backgroundColor = .systemRed
    }
    
    private func navigateToResultScreen() {
        let storyboard = UIStoryboard(name: "ResultStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        viewController.score1 = player1Score
        viewController.score2 = player2Score
        viewController.team1 = firstTeamName
        viewController.team2 = secondTeamName
        viewController.cubic = roundCube
        viewController.numberOfRounds = numberOfRounds

        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController , animated: true)
    }
    
    private func showAlertView() {
        let title =
        roundCube == .allPlay
            ? "General Round"
            : "\(roundCount % 2 == 1 ? firstTeamName : secondTeamName)'s Turn"
        let alert = UIAlertController(
            title: title,
            message: #"Click "START" to begin round!"#,
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "START", style: .default, handler: { [self] action in
            if action.style == .default {
                // start pressed
                restartTime()
                updateCurrentCard()
            }
        }))
        present(alert, animated: true, completion: nil)
    }
    
    private func updateCurrentCard(toDefault: Bool = false) {
        currentCard = toDefault ? GameViewController.DEFAULT_CARD : gameData.nextCard()
        mainCardWordLabel.text = currentCard[0]
        self.tableView.reloadData()
    }
    
    @IBAction func onCorrectPressed(_ sender: Any) {
        guard roundCount > numberOfRounds * 2 || roundCount < 1 else {
            var score: Int
            let label: UILabel
            if roundCount % 2 == 1 {
                player1Score += 1
                score = player1Score
                label = player1ScoreLabel
            } else {
                player2Score += 1
                score = player2Score
                label = player2ScoreLabel
            }
            
            label.text = "\(score)"
            updateCurrentCard()
            return
        }
    }
    
    @IBAction func onFailedPressed(_ sender: Any) {
        guard roundCount > numberOfRounds * 2 || roundCount < 1 else {
            var opponentScore: Int
            let opponentLabel: UILabel
            
            if roundCount % 2 == 1 {
                player2Score += 1
                opponentScore = player2Score
                opponentLabel = player2ScoreLabel
            } else {
                player1Score += 1
                opponentScore = player1Score
                opponentLabel = player1ScoreLabel
            }
            
            opponentLabel.text = "\(opponentScore)"
            updateCurrentCard()
            return
        }
    }
    
    @IBAction func onSkipPressed(_ sender: Any) {
        guard roundCount > numberOfRounds * 2 || roundCount < 1 else {
            updateCurrentCard()
            return
        }
    }
    
}

extension GameViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentCard.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell")!
        cell.textLabel?.text = currentCard[indexPath.row + 1]
        return cell
    }
    
    
}
