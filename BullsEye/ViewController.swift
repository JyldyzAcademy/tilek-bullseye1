//
//  ViewController.swift
//  BullsEye
//
//  Created by Tilek Sulaymanbekov on 6/9/20.
//  Copyright © 2020 Tilek Sulaymanbekov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var totalScore: Int = 0
    var round: Int = 0
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        startOver()
        configureSlider()
    }
    
    func configureSlider() {
        
        //attach image for normal state
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        //attach image for highlighted state
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        //adjust the size of image
        let insets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        //setup adjusted image
        let leftTrackImage = UIImage(named: "SliderTrackLeft")
        let leftTrackImageResizeable = leftTrackImage!.resizableImage(withCapInsets: insets)
        
        let rightTrackImage = UIImage(named: "SliderTrackRight")
        let rightTrackImageResizeable = rightTrackImage!.resizableImage(withCapInsets: insets)
        
        //initialize 
        slider.setMinimumTrackImage(leftTrackImageResizeable, for: .normal)
        slider.setMaximumTrackImage(rightTrackImageResizeable, for: .normal)
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(totalScore)
        roundLabel.text = String(round)
        
    }
    
    @IBAction func startOver() {
        round = 0
        totalScore = 0
        startNewRound()
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }

    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        
        var points = 100 - difference
        
        var title: String = ""
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "Almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close!"
        }
        
        totalScore += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
        let action = UIAlertAction(title: "Ok", style: .default, handler: {_ in self.startNewRound()})
        
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
}

