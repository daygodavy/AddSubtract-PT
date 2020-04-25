//
//  ProblemSolveViewController.swift
//  AddSubtractPT-InternApp
//
//  Created by Davy Chuon on 4/24/20.
//  Copyright © 2020 Davy Chuon. All rights reserved.
//

import UIKit

class ProblemSolveViewController: UIViewController {
    @IBOutlet weak var chalkboardBG: UIView!
    @IBOutlet weak var gameoverBG: UIView!
    
    @IBOutlet weak var correctCountLabel: UILabel!
    @IBOutlet weak var wrongCountLabel: UILabel!
    
    @IBOutlet weak var firstNumLabel: UILabel!
    @IBOutlet weak var secondNumLabel: UILabel!
    @IBOutlet weak var solutionNumLabel: UILabel! //
    
    @IBOutlet weak var eqnTypeLabel: UILabel!
    
    @IBOutlet weak var finalScoreLabel: UILabel!
    @IBOutlet weak var startOverLabel: UIButton!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    var correctCounter: Int = 0
    var wrongCounter: Int = 0
    
    var currEqn: MathEqn = MathEqn()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupLabels()
    }
    
    func setupView() {
        for button in self.answerButtons {
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOffset = CGSize(width: 2, height: 2)
            button.layer.shadowRadius = 5
            button.layer.shadowOpacity = 1.0
        }
        
        self.correctCountLabel.layer.shadowColor = UIColor.black.cgColor
        self.correctCountLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.correctCountLabel.layer.shadowRadius = 3
        self.correctCountLabel.layer.shadowOpacity = 1.0
        self.wrongCountLabel.layer.shadowColor = UIColor.black.cgColor
        self.wrongCountLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.wrongCountLabel.layer.shadowRadius = 3
        self.wrongCountLabel.layer.shadowOpacity = 1.0
        

        
        
    }
    
    func setupLabels() {
        self.correctCountLabel.text! = "0"
        self.wrongCountLabel.text! = "0"
        self.solutionNumLabel.text! = ""
        
        self.firstNumLabel.text! = String(self.currEqn.firstNum)
        self.secondNumLabel.text! = String(self.currEqn.secondNum)
        
        if self.currEqn.eqnType {
            self.eqnTypeLabel.text! = "+"
        }
        else {
            self.eqnTypeLabel.text! = "-"
        }
        
        for (i, choices) in self.currEqn.multChoiceOptions.enumerated() {
            self.answerButtons[i].setTitle(String(choices), for: .normal)
        }
    }
    
    func checkAnswer(idx: Int) {
        self.solutionNumLabel.text! = String(self.currEqn.solution)
        if let check = self.answerButtons[idx].titleLabel?.text {
            if matchAnswer(ans: Int(check)!) {
                // answer is correct!
                self.setCorrectAnswer(idx: idx)
                
            }
            else {
                // answer is incorrect
                self.setIncorrectAnswer(idx: idx)
            }
        }
    }
    
    func matchAnswer(ans: Int) -> Bool {
        if ans == self.currEqn.solution {
            return true
        }
        return false
    }
    
    func setCorrectAnswer(idx: Int) {
        self.answerButtons[idx].setTitleColor(UIColor.green, for: .normal)
        
        // increment correct counter
        self.correctCounter += 1
        self.correctCountLabel.text = String(self.correctCounter)
        
        // check if 10th round, if rd 10, then prompt message to home
        if self.correctCounter + self.wrongCounter == 10 {
            // game over
            self.initiateGameOver()
        }
        
        
        // delay (3sec) then reset and initiate next matheqn
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.answerButtons[idx].setTitleColor(UIColor.white, for: .normal)
            self.solutionNumLabel.text = ""
            
            self.regenNewEqn()
            
            for button in self.answerButtons { button.isUserInteractionEnabled = true }
        }
        
        
    }
    
    func setIncorrectAnswer(idx: Int) {
        self.answerButtons[idx].setTitleColor(UIColor.red, for: .normal)
        
        // increment decrement counter
        self.wrongCounter += 1
        self.wrongCountLabel.text = String(self.wrongCounter)
        
        // check if 10th round, if rd 10, then prompt message to home
        if self.correctCounter + self.wrongCounter == 10 {
            // game over
            self.initiateGameOver()
        }
        else {
            // delay (3sec) then reset and initiate next matheqn
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.answerButtons[idx].setTitleColor(UIColor.white, for: .normal)
                self.solutionNumLabel.text = ""
                
                self.regenNewEqn()
                
                for button in self.answerButtons { button.isUserInteractionEnabled = true }
            }
        }
        
    }
    
    func regenNewEqn() {
        if self.currEqn.eqnType {
            // generate new addition problem
            self.currEqn = MathEqn.init(choseAdd: true)
        }
        else {
            // generate new subtraction problem
            self.currEqn = MathEqn.init(choseAdd: false)
        }
        
        self.firstNumLabel.text! = String(self.currEqn.firstNum)
        self.secondNumLabel.text! = String(self.currEqn.secondNum)
        
        for (i, choices) in self.currEqn.multChoiceOptions.enumerated() {
            self.answerButtons[i].setTitle(String(choices), for: .normal)
        }
    }
    
    func initiateGameOver() {
        self.setupGameoverView()
        for button in self.answerButtons { button.isHidden = true }
        self.solutionNumLabel.text = ""
        self.finalScoreLabel.textColor = .black
        self.finalScoreLabel.font = UIFont(name: "Charter-BoldItalic", size: 43)
        self.finalScoreLabel.text = "FINAL SCORE: \(self.correctCounter)"
        self.finalScoreLabel.font = self.finalScoreLabel.font.withSize(43)
        self.gameoverBG.isHidden = false
    }
    
    func setupGameoverView() {
        self.gameoverBG.layer.cornerRadius = 10
        self.gameoverBG.clipsToBounds = true
        self.gameoverBG.layer.borderColor = UIColor(red: 0.498, green: 0.3137, blue: 0, alpha: 1.0).cgColor
        self.gameoverBG.layer.masksToBounds = true
        self.gameoverBG.contentMode = .scaleToFill
        self.gameoverBG.layer.borderWidth = 7
        
        self.startOverLabel.layer.shadowColor = UIColor.black.cgColor
        self.startOverLabel.layer.shadowRadius = 3
//        self.startOverLabel.layer.shadowOffset
        self.startOverLabel.layer.shadowOpacity = 0.2
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        for button in self.answerButtons { button.isUserInteractionEnabled = false }
        
        switch sender.tag {
        case 0:
            print("A")
            self.checkAnswer(idx: 0)
        case 1:
            self.checkAnswer(idx: 1)
            print("B")
        case 2:
            self.checkAnswer(idx: 2)
            print("C")
        case 3:
            self.checkAnswer(idx: 3)
            print("D")
        default:
            break
        }
        print("DONE")
    }
    
    @IBAction func startoverButtonPressed(_ sender: Any) {
         presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
}
