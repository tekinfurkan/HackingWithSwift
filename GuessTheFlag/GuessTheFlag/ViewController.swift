//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Furkan Tekin on 28.02.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia","france","germany","nigeria","ireland","italy","monaco","poland","russia","spain","uk","us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.black.cgColor
        button2.layer.borderColor = UIColor.black.cgColor
        button3.layer.borderColor = UIColor.black.cgColor
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(questionCount)/10 \t \t \t \t \(countries[correctAnswer].uppercased()) \t\t \tScore:\(score)"
    }
    
    @IBAction func ButtonTapped(_ sender: UIButton) {
        var title: String
        questionCount += 1
        
        if questionCount == 11 {
            let ac = UIAlertController(title: nil, message: "Flag Quiz is done! 10 question completed. \n Your score is \(score) \n Press Continue for a new challange", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac,animated: true)
            
            questionCount = 0
            score = 0
        }
        
        else if sender.tag == correctAnswer {
            score += 1
            title = "Correct"
            
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            present(ac,animated: true)
        }
        else {
            score -= 1
            title = "Wrong"
            
            let ac = UIAlertController(title: title, message: "That’s the flag of \(countries[correctAnswer].uppercased()). \n Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            present(ac,animated: true)
        }
    }
}

