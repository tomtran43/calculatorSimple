//
//  NumbersButton.swift
//  calculatorSimple
//
//  Created by Loc Tran on 2/16/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class NumbersButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureButton()
    }
    
    func configureButton(){
        if tag == 120{
            backgroundColor = UIColor.init(red: 150/255, green: 200/255, blue: 45/255, alpha: 1)
        }else{
            backgroundColor = UIColor.init(red: 100/255, green: 230/255, blue: 200/255, alpha: 1)
        }
        
        layer.cornerRadius = 8.0
        
        titleLabel?.font = UIFont.systemFont(ofSize: 20)
        self.setTitleColor(UIColor.white, for: .normal)
    }
}
