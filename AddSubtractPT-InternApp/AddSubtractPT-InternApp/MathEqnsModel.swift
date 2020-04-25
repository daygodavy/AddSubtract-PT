//
//  MathEqnsModel.swift
//  AddSubtractPT-InternApp
//
//  Created by Davy Chuon on 4/24/20.
//  Copyright © 2020 Davy Chuon. All rights reserved.
//

import Foundation

class MathEqn {
    var firstNum: Int
    var secondNum: Int
    var solution: Int
    var multChoiceOptions: [Int]
    
    // eqnType is true when adding, false otherwise
    var eqnType: Bool
    
    var minNum: Int = 0
    var maxNum: Int = 999
    var minOffset: Int = -5
    var maxOffset: Int = 5
    
    init() {
        self.firstNum = 0
        self.secondNum = 0
        self.solution = 0
        self.multChoiceOptions = Array(repeating: 0, count: 4)
        self.eqnType = false
    }
    
    init(choseAdd: Bool) {
        self.firstNum = Int.random(in: minNum ... maxNum)
        self.secondNum = Int.random(in: minNum ... maxNum)
        self.multChoiceOptions = Array(repeating: 0, count: 4)
        self.eqnType = choseAdd
        
        // create solution based on user's selection of add or subtract
        if choseAdd {
            self.solution = self.firstNum + self.secondNum
        }
        else {
            self.solution = self.firstNum - self.secondNum
        }
        
        var offset: Int
        var tempSolution: Int = 0
        var tempList: [Int] = []
        tempList.append(self.solution)
        
        // generate a list of multiple choice options
        while tempList.count < multChoiceOptions.count {
            offset = Int.random(in: minOffset ... maxOffset)
            tempSolution = self.solution + offset
            if !tempList.contains(tempSolution) {
                tempList.append(tempSolution)
            }
        }
        tempList.shuffle()
        self.multChoiceOptions = tempList
    }
    
    
}
