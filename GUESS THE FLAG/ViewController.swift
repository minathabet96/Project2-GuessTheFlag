//
//  ViewController.swift
//  GUESS THE FLAG
//
//  Created by Mina Thabet on 18/08/2023.
//

import UIKit

class ViewController: UIViewController {
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var playLimit = 0
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    @IBOutlet var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "UK", "US"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show score", style: .done, target: self, action: #selector(showScore))
    }
    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
        scoreLabel.text = "Score: \(score)"

    }
    func reset(action: UIAlertAction! = nil){
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
        score = 0
        playLimit = 0
        scoreLabel.text = "Score: \(score)"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        playLimit+=1
        var title: String
        var message: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            message = "Your score is \(score)"
        }
        else {
            title = "Wrong"
            message = "That's the flag of \(countries[sender.tag])\nyour score is \(score)"
        }
        if playLimit < 10 {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
        else {
        let ac = UIAlertController(title: "The game has ended!", message: "You scored \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Play Again", style: .default, handler: reset))
            present(ac, animated: true)
        }
    }
    @objc func showScore(){
        let al = UIAlertController(title: nil, message: "Your score is: \(score)", preferredStyle: .alert)
        present(al, animated: true)
        al.addAction(UIAlertAction(title: "OK", style: .default))
    }
}

