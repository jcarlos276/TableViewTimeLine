//
//  String + Helpers.swift
//  TimeLine
//
//  Created by Juan Carlos Guillén Castro on 6/29/19.
//  Copyright © 2019 Juan Carlos Guillén Castro. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
}
