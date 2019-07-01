//
//  Date + Helpers.swift
//  TimeLine
//
//  Created by Juan Carlos Guillén Castro on 6/29/19.
//  Copyright © 2019 Juan Carlos Guillén Castro. All rights reserved.
//

import Foundation

extension Date {
    var dayName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "es_PE")
        let dayInWeek = dateFormatter.string(from: self)
        return dayInWeek.capitalizingFirstLetter()
    }
}
