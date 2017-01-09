//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Balgard on 11/7/16.
//  Copyright © 2016 Balgard. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var xTurn = true
    var catsGame = false
    var gameOver = false
    var gameFinished = false
    var playerOneScoreInt = 0
    var playerTwoScoreInt = 0
    
    @IBOutlet weak var turnIndicator: UILabel!
    
    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var gridLabel0: GridLabel!
    @IBOutlet weak var gridLabel1: GridLabel!
    @IBOutlet weak var gridLabel2: GridLabel!
    @IBOutlet weak var gridLabel3: GridLabel!
    @IBOutlet weak var gridLabel4: GridLabel!
    @IBOutlet weak var gridLabel5: GridLabel!
    @IBOutlet weak var gridLabel6: GridLabel!
    @IBOutlet weak var gridLabel7: GridLabel!
    @IBOutlet weak var gridLabel8: GridLabel!
    var labelsArray = [GridLabel]()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        labelsArray.append(gridLabel0)
        labelsArray.append(gridLabel1)
        labelsArray.append(gridLabel2)
        labelsArray.append(gridLabel3)
        labelsArray.append(gridLabel4)
        labelsArray.append(gridLabel5)
        labelsArray.append(gridLabel6)
        labelsArray.append(gridLabel7)
        labelsArray.append(gridLabel8)
    }
    
    @IBAction func onTappedGridLabel(_ sender: UITapGestureRecognizer)
    {
        numberGrid()
        for label in labelsArray
        {
            if label.frame.contains(sender.location(in: backgroundView))
            {
                if label.canTap == true
                {
                    if xTurn == true
                    {
                        label.text = "X"
                        turnIndicator.text = "Player O's Turn"
                        label.canTap = false
                        checkForWinner()
                        xTurn = !xTurn
                    }
                    else
                    {
                        label.text = "O"
                        turnIndicator.text = "Player X's Turn"
                        label.canTap = false
                        checkForWinner()
                        xTurn = !xTurn
                    }
                }
            }
        }
    }
    
    func resetGrid()
    {
        for label in labelsArray
        {
            label.text = ""
            label.canTap = true
            turnIndicator.text = "Player X's Turn"
            xTurn = true
            gameOver = false
            gameFinished = true
        }
    }
    
    func numberGrid()
    {
        var i = 0
        for label in labelsArray
        {
            label.number = i
            i += 1
        }
    }
    
    func presentWinningAlert(winner:String) {
        if !gameOver {
            let alert = UIAlertController(title: "\(winner) Wins", message: nil, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Restart Game", style: .default) {
                
                (action) -> Void in self.resetGrid()
            }
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            if xTurn == true
            {
                print ("Player X Wins")
                playerOneScoreInt += 1
                playerOneScore.text = "\(playerOneScoreInt)"
            }
            else
            {
                print ("Player O Wins")
                playerTwoScoreInt += 1
                playerTwoScore.text = "\(playerTwoScoreInt)"
            }
        }
        gameOver = true
        gameFinished = false
    }
    

    
    func horizontalCheck(startIndex: Int) -> Bool
    {
        let index = startIndex
        if (labelsArray[index].text! == labelsArray[index+1].text!) && (labelsArray[index].text! == labelsArray[index+2].text!)
        {
            if(labelsArray[index].text! == "")
            {
                return false
            }
            return true
        }
        return false
    }
    
    func verticalCheck(startIndex: Int) -> Bool
    {
        let index = startIndex
        if (labelsArray[index].text! == labelsArray[index+3].text!) && (labelsArray[index].text! == labelsArray[index+6].text!)
        {
            if(labelsArray[index].text! == "")
            {
                return false
            }

            return true
        }
        return false
    }
    
    func forwardDiagonalCheck(startIndex: Int) -> Bool
    {
        let index = startIndex
        if (labelsArray[index].text! == labelsArray[index+4].text!) && (labelsArray[index].text! == labelsArray[index+8].text!)
        {
            if(labelsArray[index].text! == "")
            {
                return false
            }

            return true
        }
        return false
    }

    func backwardsDiagonalCheck(startIndex: Int) -> Bool
    {
        let index = startIndex
        if (labelsArray[index].text! == labelsArray[index+2].text!) && (labelsArray[index].text! == labelsArray[index+4].text!)
        {
            if(labelsArray[index].text! == "")
            {
                return false
            }

            return true
        }
        return false
    }
    
    func checkForWinner()
    {
        var winner : String
        if(xTurn == true)
        {
            winner = "Player X"
        }
        else
        {
           winner = "Player O"
        }
        var i = 0
        if(horizontalCheck(startIndex: 0) == true) || (horizontalCheck(startIndex: 3) == true) || (horizontalCheck(startIndex: 6) == true)
        {
            presentWinningAlert(winner: "\(winner)")
        }
        else if(verticalCheck(startIndex: 0) == true) || (verticalCheck(startIndex: 1) == true) || (verticalCheck(startIndex: 2) == true)
        {
            presentWinningAlert(winner: "\(winner)")
        }
        else if(forwardDiagonalCheck(startIndex: 0) == true)
        {
            presentWinningAlert(winner: "\(winner)")
        }
        else if(backwardsDiagonalCheck(startIndex: 2) == true)
        {
           presentWinningAlert(winner: "\(winner)")
        }
        else
        {
            for label in labelsArray
            {
                if label.text != ""
                {
                    i += 1
                }
            }
            if i == 9
            {
                winner = "No One"
                presentWinningAlert(winner: "\(winner)")
                print("Tie Game")
                resetGrid()
            }
        }
        
        
    }
    @IBAction func resetScore(_ sender: UIButton) {
        playerOneScore.text = "0"
        playerOneScoreInt = 0
        playerTwoScore.text = "0"
        playerTwoScoreInt = 0
    }
}
