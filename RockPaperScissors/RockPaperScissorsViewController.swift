//
//  RockPaperScissorsViewController.swift
//  RockPaperScissors
//
//  Created by Gabrielle Miller-Messner on 10/30/14.
//  Copyright (c) 2014 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

// MARK: - RockPaperScissorsViewController: UIViewController

class RockPaperScissorsViewController: UIViewController {

    // MARK: Properties
    
    var match: RPSMatch!
    
    // Here is the history array which will hold the results of each match that is played in a session.
    var history = [RPSMatch]()
    
    // MARK: Outlets
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    // MARK: Actions
    
    @IBAction func makeYourMove(_ sender: UIButton) {
        
        // The RPS enum holds a player's move
        switch (sender) {
        case self.rockButton:
            throwDown(RPS.rock)
            
        case self.paperButton:
            throwDown(RPS.paper)

        case self.scissorsButton:
            throwDown(RPS.scissors)
        
        default:
            assert(false, "An unknown button is invoking makeYourMove()")
        }
    }
    
        //TODO: Present HistoryViewController
    
   
    
    // MARK: Play!
    
    func throwDown(_ playersMove: RPS) {
        let computersMove = RPS()
        self.match = RPSMatch(p1: playersMove, p2: computersMove)
        
        // Here we add a match to the history array. 
        history.append(match)
        
    
        if (playersMove == RPS.rock) {
            // Get the storyboard and ResultViewController
            let storyboard = UIStoryboard (name: "Main", bundle: nil)
            let resultVC = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
            // Communicate the match
            resultVC.match = self.match

            self.present(resultVC, animated: true, completion: nil)
        }
    
    }
        // 3rd Way: Segue Only, No code!
        // But don't forget to implement prepareForSegue.

    @IBAction func showHistory(_ sender: AnyObject) {
        let storyboard = self.storyboard
        let controller = storyboard?.instantiateViewController(withIdentifier: "HistoryViewController")as! HistoryViewController
    
    controller.history = self.history
    
    self.present(controller, animated: true, completion: nil)
    
    
}
}
