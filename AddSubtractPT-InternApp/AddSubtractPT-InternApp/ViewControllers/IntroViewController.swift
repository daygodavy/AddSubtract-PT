//
//  IntroViewController .swift
//  AddSubtractPT-InternApp
//
//  Created by Davy Chuon on 4/24/20.
//  Copyright © 2020 Davy Chuon. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    @IBOutlet var baseBG: UIView!
    @IBOutlet weak var headerBG: UIView!
    @IBOutlet weak var bodyBG: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var headerTextLabel: UILabel!
    
    var newEqn: MathEqn = MathEqn()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    // configure UI elements for the view
    func setupView() {
        headerBG.layer.cornerRadius = 10
        headerBG.clipsToBounds = true
        headerBG.layer.borderColor = UIColor(red: 0.498, green: 0.3137, blue: 0, alpha: 1.0).cgColor
        headerBG.layer.masksToBounds = true
        headerBG.contentMode = .scaleToFill
        headerBG.layer.borderWidth = 7
        
        bodyBG.layer.cornerRadius = 10
        bodyBG.clipsToBounds = true
        bodyBG.layer.borderColor = UIColor(red: 0.498, green: 0.3137, blue: 0, alpha: 1.0).cgColor
        bodyBG.layer.masksToBounds = true
        bodyBG.contentMode = .scaleToFill
        bodyBG.layer.borderWidth = 7
        
        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = baseBG.bounds
        gradientMaskLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientMaskLayer.locations = [0, 0.1, 0.9, 1]
        baseBG.layer.mask = gradientMaskLayer
        
        addButton.layer.shadowColor = UIColor.black.cgColor
        addButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        addButton.layer.shadowRadius = 5
        addButton.layer.shadowOpacity = 1.0
        
        subButton.layer.shadowColor = UIColor.black.cgColor
        subButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        subButton.layer.shadowRadius = 5
        subButton.layer.shadowOpacity = 1.0
        
        headerTextLabel.layer.shadowColor = UIColor.black.cgColor
        headerTextLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        headerTextLabel.layer.shadowRadius = 2
        headerTextLabel.layer.shadowOpacity = 1.0
    }
    
    // initiates addition problems after user selects the add button
    @IBAction func addButtonPressed(_ sender: Any) {
        self.newEqn = MathEqn.init(choseAdd: true)
        navigateToProblemSolveVC()
        
    }
    
    // initiates subtraction problems after user selects the subtract button
    @IBAction func subButtonPressed(_ sender: Any) {
        self.newEqn = MathEqn.init(choseAdd: false)
        navigateToProblemSolveVC()
    }
    
    
    // segue to problem solving view
    func navigateToProblemSolveVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let problemSolveVC = storyboard.instantiateViewController(withIdentifier: "ProblemSolveViewController") as! ProblemSolveViewController
        problemSolveVC.currEqn = self.newEqn
        problemSolveVC.modalPresentationStyle = .fullScreen
        self.present(problemSolveVC, animated: true, completion: nil)

    }

}
