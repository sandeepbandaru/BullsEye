//
//  ViewController.swift
//  BullsEye
//
//  Created by SANDEEP BANDARU on 27/05/19.
//  Copyright © 2019 SANDEEP BANDARU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue : Int = 0
    var targetValue : Int = 0
    var score = 0
    var round = 1
    var points = 0
    
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var targetLabel : UILabel!
    @IBOutlet weak var scoreLabel : UILabel!
    @IBOutlet weak var roundLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
        
        let thumbNailNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbNailNormal, for: .normal)
        
        let thumbNailHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbNailHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackResizeable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftImage, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizeable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightImage, for: .normal)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func showAlert()
    {
        let diff = abs(currentValue - targetValue)
        points = 100 - diff
       
        round += 1
        
        let title: String
        if  diff == 0
        {
            title = "Perfect! + 100points"
            points += 100
        }
        else if  diff == 1
        {
            title = "good! + 50 points"
            points += 50
        }
        else if diff < 5{
            title = "close enough"
        }
        else if diff < 10{
            title = "not bad"
        }
        else{
            title = "not even close.."
        }
        score += points
        let message = "you scored: \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome!!!", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true ,completion: nil)
        
       
    }
    
    @IBAction func infoAlert()
    {
        
        let alert = UIAlertController(title: "BullsEye", message: "this game is used to test eye sight capabilty of a person ", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Lets play!", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true ,completion: nil)
    }
    
    @IBAction func restart()
    {
        score = 0
        round = 1
        startNewRound()
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider)
    {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        print("value: \(currentValue)")
    }
    
   
    
    func startNewRound(){
        
        currentValue = 50
        targetValue = Int.random(in: 1...100)
        slider.value = Float(currentValue)
        updateLabel()
    }
    
    func updateLabel()
    {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        
    }

}


