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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSubviews()
        print("done")
        // Do any additional setup after loading the view.
        
//        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//
//        bgView.layer.borderWidth = 10
//        bgView.layer.borderColor = UIColor.brown.cgColor
//
//        view.addSubview(bgView)
    }
    
    func setupSubviews() {
        headerBG.layer.cornerRadius = 10
        headerBG.clipsToBounds = true
        headerBG.layer.borderColor = UIColor(red: 0.498, green: 0.3137, blue: 0, alpha: 1.0).cgColor
        headerBG.layer.masksToBounds = true
        headerBG.contentMode = .scaleToFill
        headerBG.layer.borderWidth = 10
        
        bodyBG.layer.cornerRadius = 10
        bodyBG.clipsToBounds = true
        bodyBG.layer.borderColor = UIColor(red: 0.498, green: 0.3137, blue: 0, alpha: 1.0).cgColor
        bodyBG.layer.masksToBounds = true
        bodyBG.contentMode = .scaleToFill
        bodyBG.layer.borderWidth = 10
        
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
        
        
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOffset = CGSize(width: 5, height: 5)
//        button.layer.shadowRadius = 5
//        button.layer.shadowOpacity = 1.0
        

    }


}
