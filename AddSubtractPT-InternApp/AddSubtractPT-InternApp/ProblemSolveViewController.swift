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
    
    @IBOutlet weak var correctCountLabel: UILabel!
    @IBOutlet weak var wrongCountLabel: UILabel!
    
    @IBOutlet weak var firstNumLabel: UILabel!
    @IBOutlet weak var secondNumLabel: UILabel!
    @IBOutlet weak var solutionNumLabel: UILabel! //
    
    @IBOutlet weak var eqnTypeLabel: UILabel!
    
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
                self.correctAnswer(idx: idx)
                
            }
            else {
                // answer is incorrect
                self.incorrectAnswer(idx: idx)
            }
        }
    }
    
    func matchAnswer(ans: Int) -> Bool {
        if ans == self.currEqn.solution {
            return true
        }
        return false
    }
    
    func correctAnswer(idx: Int) {
        self.answerButtons[idx].setTitleColor(UIColor.green, for: .normal)
        
        // increment correct counter
        self.correctCounter += 1
        self.correctCountLabel.text = String(self.correctCounter)
        
        // check if 10th round, if rd 10, then prompt message to home
        if self.correctCounter + self.wrongCounter == 10 {
            // game over
        }
        
        
        // delay (3sec) then reset and initiate next matheqn
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.answerButtons[idx].setTitleColor(UIColor.white, for: .normal)
            self.solutionNumLabel.text = ""
            
            self.regenNewEqn()
            
            for button in self.answerButtons { button.isUserInteractionEnabled = true }
        }
        
        
    }
    
    func incorrectAnswer(idx: Int) {
        self.answerButtons[idx].setTitleColor(UIColor.red, for: .normal)
        
        // increment decrement counter
        self.wrongCounter += 1
        self.wrongCountLabel.text = String(self.wrongCounter)
        
        // check if 10th round, if rd 10, then prompt message to home
        if self.correctCounter + self.wrongCounter == 10 {
            // game over
        }
        
        // delay (3sec) then reset and initiate next matheqn
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.answerButtons[idx].setTitleColor(UIColor.white, for: .normal)
            self.solutionNumLabel.text = ""
            
            self.regenNewEqn()
            
            for button in self.answerButtons { button.isUserInteractionEnabled = true }
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
            print("FUCK")
            break
        }
        print("DONE")
    }
    
//    @IBAction func answerAPressed(_ sender: Any) {
//        if let check = self.answerButtons[0].titleLabel?.text {
//            if checkAnswer(ans: Int(check)!) {
//                // answer is correct!
//                self.correctAnswer()
//            }
//            else {
//                // answer is incorrect
//                self.incorrectAnswer()
//            }
//        }
//    }
//
//    @IBAction func answerBPressed(_ sender: Any) {
//        if let check = self.answerButtons[1].titleLabel?.text {
//            if checkAnswer(ans: Int(check)!) {
//                // answer is correct!
//                self.correctAnswer()
//            }
//            else {
//                // answer is incorrect
//                self.incorrectAnswer()
//            }
//        }
//    }
//
//    @IBAction func answerCPressed(_ sender: Any) {
//        if let check = self.answerButtons[2].titleLabel?.text {
//            if checkAnswer(ans: Int(check)!) {
//                // answer is correct!
//                self.correctAnswer()
//            }
//            else {
//                // answer is incorrect
//                self.incorrectAnswer()
//            }
//        }
//    }
//
//    @IBAction func answerDPressed(_ sender: Any) {
//        if let check = self.answerButtons[3].titleLabel?.text {
//            if checkAnswer(ans: Int(check)!) {
//                // answer is correct!
//            }
//            else {
//                // answer is incorrect
//            }
//        }
//    }
    
    
}
