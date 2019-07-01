//
//  TimeLineDateTableViewCell.swift
//  TimeLine
//
//  Created by Juan Carlos Guillén Castro on 6/29/19.
//  Copyright © 2019 Juan Carlos Guillén Castro. All rights reserved.
//

import UIKit

class TimeLineDateTableViewCell: UITableViewCell {
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var centerXConstraint: NSLayoutConstraint!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var circleView: CircleView!
    @IBOutlet weak var weekDayLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var circleHeightConstraint: NSLayoutConstraint!
    var date: Date = Date() {
        didSet {
            dayText = "\(Calendar.current.component(.day, from: date))"
            weekDayText = date.dayName
        }
    }
    private var dayText = ""
    private var weekDayText = ""
    
//    var isACellSelected = false
//    var isThisCellSelected = false
    
    override func awakeFromNib() {
        self.selectionStyle = .none
    }
    
    func loadContent() {
        dateLbl.text = dayText
        weekDayLbl.text = weekDayText
        print(date)
        if Calendar.current.compare(Date(), to: date, toGranularity: .day) == .orderedSame {
            dateLbl.textColor = .white
            weekDayLbl.textColor = #colorLiteral(red: 0.6352941176, green: 0.2705882353, blue: 0.9411764706, alpha: 1)
            dateLbl.font = UIFont(name: dateLbl!.font.fontName, size: 20)
            weekDayLbl.font = UIFont(name: weekDayLbl!.font.fontName, size: 20)
            circleView.backgroundColor = #colorLiteral(red: 0.6352941176, green: 0.2705882353, blue: 0.9411764706, alpha: 1)
            circleHeightConstraint.constant = 40
            circleView.layer.cornerRadius = 20
        } else {
            dateLbl.textColor = #colorLiteral(red: 1, green: 0.6334996819, blue: 0, alpha: 1)
            weekDayLbl.textColor = #colorLiteral(red: 1, green: 0.8242000341, blue: 0.5501485467, alpha: 1)
            dateLbl.font = UIFont(name: dateLbl!.font.fontName, size: 14)
            weekDayLbl.font = UIFont(name: weekDayLbl!.font.fontName, size: 14)
            circleView.backgroundColor = #colorLiteral(red: 1, green: 0.8242000341, blue: 0.5501485467, alpha: 1)
            circleHeightConstraint.constant = 30
            circleView.layer.cornerRadius = 15
        }
//        layoutView()
    }
    
//    func layoutView() {
//        setInitialLayout()
//        UIView.transition(with: circleView, duration: 1, options: .transitionCrossDissolve, animations: {
//            self.topConstraint.constant = self.isThisCellSelected ? 0 : 35
//        }, completion: nil)
//        UIView.transition(with: lineView, duration: 1, options: .transitionCrossDissolve, animations: {
//            self.centerXConstraint.constant = self.isACellSelected ? -80 : 0
//        }, completion: nil)
//    }
//
//    func setInitialLayout() {
//        self.topConstraint.constant = 35
//        self.centerXConstraint.constant = 0
//    }
}
