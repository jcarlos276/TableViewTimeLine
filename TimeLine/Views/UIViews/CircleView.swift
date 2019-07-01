//
//  CircleView.swift
//  TimeLine
//
//  Created by Juan Carlos Guillén Castro on 6/29/19.
//  Copyright © 2019 Juan Carlos Guillén Castro. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    override func awakeFromNib() {
        setCornerRadius()
    }
    
    func setCornerRadius(){
        self.layer.cornerRadius = self.frame.size.height / 2
    }
}
