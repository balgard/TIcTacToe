//
//  GridLabel.swift
//  Tic Tac Toe
//
//  Created by Balgard on 11/15/16.
//  Copyright © 2016 Balgard. All rights reserved.
//

import UIKit

class GridLabel: UILabel {

var canTap = true
var number = 0
var isX = false
var isO = false
var value = ""

    func returnValue(label: GridLabel) -> String
    {
        return label.text!
    }

}
