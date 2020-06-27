//
//  HighScoreTableViewController.swift
//  BullsEye
//
//  Created by Tilek Sulaymanbekov on 6/18/20.
//  Copyright © 2020 Tilek Sulaymanbekov. All rights reserved.
//

import UIKit

class HighScoreTableViewController: UITableViewController {
    
    var scoreItems = [HighScoreItem]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreItems.append(HighScoreItem(name: "Salamat", score: 9000))
        scoreItems.append(HighScoreItem(name: "Aslan", score: 10000))
        scoreItems.append(HighScoreItem(name: "Tilek", score: 4000))
        scoreItems.append(HighScoreItem(name: "Nurgazy", score: 1000))
        scoreItems.append(HighScoreItem(name: "Asol", score: 7000))
        
    }
    
// MARK: - Table view Data source
    
//How many cells to show
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoreItems.count
    }
    
//what's inside the cell to show and reusing the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "highScoreCell" , for: indexPath)
        
        let nameLabel = cell.viewWithTag(10) as! UILabel
        let scoreLabel = cell.viewWithTag(20) as! UILabel
        
        let item = scoreItems[indexPath.row]
        
        nameLabel.text = item.name
        scoreLabel.text = String(item.score)
        
        return cell
    }
    
// TODO: - create method
// FIXME: - here is bug please fix it

    
//MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(scoreItems[indexPath.row].name)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//MARK: - MVC - Model-View-Controller
    
}
