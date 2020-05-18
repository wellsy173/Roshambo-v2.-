//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Simon Wells on 2020/5/17.
//  Copyright © 2020 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var history: [RPSMatch]!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //Mark: Table View Data Source
    
    func tableView(_ _tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return history.count
    }

    func tableView(_ _tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
    let match = self.history[(indexPath as NSIndexPath).row]
    
    cell.textLabel!.text = victoryStatusDescription(match)
    cell.detailTextLabel!.text = "\(match.p1) vs. \(match.p2)"
        
        return cell
        
}
    func victoryStatusDescription(_ match: RPSMatch) -> String {
        
        if (match.p1 == match.p2) {
            return "Tie."
        }  else if (match.p2.defeats(match.p2)) {
            return "Win!"
        } else {
            return "Loss."
    }
            
                
            }
    @IBAction func dismissHistory(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
}
    
