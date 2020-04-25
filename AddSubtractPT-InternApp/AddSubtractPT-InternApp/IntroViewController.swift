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
    
    func setupView() {
        headerBG.layer.cornerRadius = 10
        headerBG.clipsToBounds = true
        headerBG.layer.borderColor = UIColor(red: 0.498, green: 0.3137, blue: 0, alpha: 1.0).cgColor
        headerBG.layer.masksToBounds = true
        headerBG.contentMode = .scaleToFill
        headerBG.layer.borderWidth = 7
        
//        headerBG.layer.shadowColor = UIColor.black.cgColor
//        headerBG.layer.shadowOffset = CGSize(width: 20, height: 20)
//        headerBG.layer.shadowRadius = 10
//        headerBG.layer.shadowOpacity = 1.0
        
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
        //        view.addSubview(maskedView)
        
        
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
    
    @IBAction func addButtonPressed(_ sender: Any) {
        self.newEqn = MathEqn.init(choseAdd: true)
        navigateToProblemSolveVC()
        
    }
    
    @IBAction func subButtonPressed(_ sender: Any) {
        self.newEqn = MathEqn.init(choseAdd: false)
        navigateToProblemSolveVC()
    }
    
    
    func navigateToProblemSolveVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let problemSolveVC = storyboard.instantiateViewController(withIdentifier: "ProblemSolveViewController") as! ProblemSolveViewController
        problemSolveVC.currEqn = self.newEqn
        problemSolveVC.modalPresentationStyle = .fullScreen
        self.present(problemSolveVC, animated: true, completion: nil)
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let MainTabBarController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
//        MainTabBarController.chosenDevice = profiles[idx]
//        MainTabBarController.modalPresentationStyle = .fullScreen
//        self.present(MainTabBarController, animated: true, completion: nil)
    }

}
