//
//  ViewController.swift
//  GameScreen
//
//  Created by Evans Owamoyo on 05.07.2021.
//

import UIKit

class GameViewController: UIViewController {
    // constants
    let PLAYERS_COUNT = 2
    private static let DEFAULT_CARD = ["-_-","-_-","-_-","-_-","-_-","-_-"]
    
    @IBOutlet weak var firstTeamNameLabel: UILabel!
    @IBOutlet weak var secondTeamNameLabel: UILabel!
    
    @IBOutlet weak var player1ScoreLabel: UILabel!
    @IBOutlet weak var player2ScoreLabel: UILabel!
    @IBOutlet weak var timeRemainingLabel: UILabel!
    @IBOutlet weak var mainCardWordLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - variables that must be passed from settings screen
    var firstTeamName: String = ""
    var secondTeamName: String = ""
    var playerTime: Int?
    
    
    // MARK: - Timer objects
    private weak var timer: Timer!
    
    private var timeRemaining: Int!
    
    // number of rounds that have been played
    private var roundCount: Int = 0
    
    // score variables
    private var player1Score = 0
    private var player2Score = 0
    
    // data
    let gameData = GameData()
    var currentCard : [String] = DEFAULT_CARD
    
    
    //rounded view
    @IBOutlet weak var gameView: UIView!
    
    deinit {
        timer.invalidate()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //test()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        //rounded view
        gameView.layer.cornerRadius = 25
        gameView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        gameView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        gameView.layer.shadowOpacity = 1.0
        gameView.layer.shadowRadius = 0.0
        gameView.layer.masksToBounds = false
        
        if let playerTime = playerTime {
            firstTeamNameLabel.text = firstTeamName
            secondTeamNameLabel.text = secondTeamName
            player1ScoreLabel.text = String(player1Score)
            player2ScoreLabel.text = String(player2Score)
            timeRemainingLabel.text = "\(playerTime)"
            mainCardWordLabel.text = currentCard[0]
        } else {
            /* data must be passed to this screen from the settings screen
             ELSE: pop to the previous screen
             */
            navigationController?.popViewController(animated: true)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAlertView()
    }
    
    
    private func restartTime() {
        self.timeRemaining = self.playerTime!
        timeRemainingLabel.text = "\(self.timeRemaining ?? 0)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    
    @objc private func updateTime() {
        guard let timeRemaining = timeRemaining else { return }
        if timeRemaining > 0 {
            self.timeRemaining -= 1
            timeRemainingLabel.text = "\(self.timeRemaining ?? 0)"
        } else if roundCount < PLAYERS_COUNT {
            timer.invalidate()
            //             round for player 2
            showAlertView()
        } else {
            roundCount += 1
            timer.invalidate()
            navigateToResultScreen()
        }
    }
    
    private func navigateToResultScreen() {
        let storyboard = UIStoryboard(name: "ResultStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        viewController.score1 = player1Score
        viewController.score2 = player2Score
        viewController.team1 = firstTeamName
        viewController.team2 = secondTeamName

        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController , animated: true)
        //present(viewController, animated: true, completion: nil)
    }
    
    private func showAlertView() {
        let alert = UIAlertController(title: "\(roundCount > 0 ? String(secondTeamName) : String(firstTeamName) )'s Turn", message: #"Click "START" to begin your round!"#, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "START", style: .default, handler: { [self] action in
            if action.style == .default {
                // start pressed
                restartTime()
                updateCurrentCard()
            }
            roundCount += 1
        }))
        present(alert, animated: true, completion: nil)
    }
    
    private func updateCurrentCard(toDefault: Bool = false) {
        currentCard = toDefault ? GameViewController.DEFAULT_CARD : gameData.nextCard()
        mainCardWordLabel.text = currentCard[0]
        self.tableView.reloadData()
    }
    @IBAction func onCorrectPressed(_ sender: Any) {
        guard roundCount > 2 || roundCount < 1 else {
            var score: Int
            let label: UILabel
            if roundCount == 1 {
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
        guard roundCount > 2 || roundCount < 1 else {
            var opponentScore: Int
            let opponentLabel: UILabel
            
            if roundCount == 1 {
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
        guard roundCount > 2 || roundCount < 1 else {
            updateCurrentCard()
            return
        }
    }
    
    //************
    // MOCK: mocking input variables from settings screen
    private func test() {
        self.playerTime = 10
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
