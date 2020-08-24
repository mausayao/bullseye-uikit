//
//  ViewController.swift
//  BullsEye
//
//  Created by Maurício de Freitas Sayão on 17/08/20.
//  Copyright © 2020 Maurício de Freitas Sayão. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var sliderView: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        sliderView.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighLighted = UIImage(named: "SliderThumb-Highlighted")
        sliderView.setThumbImage(thumbImageHighLighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizeable = trackLeftImage?.resizableImage(withCapInsets: insets)
        sliderView.setMinimumTrackImage(trackLeftResizeable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")
        let trackRightResizeable = trackRightImage?.resizableImage(withCapInsets: insets)
        sliderView.setMaximumTrackImage(trackRightResizeable, for: .normal)
        
    }
    
    @IBAction func showHitMe() {
        score += calculatePoints()
       
        let scoreMessagem = scoreMessage()
        
        let alert = UIAlertController(title: scoreMessagem.title, message: scoreMessagem.message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
            self.updateLabels()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    func scoreMessage() -> (title:String, message: String) {
        let title: String
        let points = calculatePoints()
        
        if points == 0 {
            title = "Perfect!"
        } else if points < 5 {
            title = "You almost hat it!"
        } else if points < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        let message = "You scored \(points) points"
        
        return (title, message)
    }
    
    func updateLabels() {
         scoreLabel.text = "\(score)"
         roundLabel.text = "\(round)"
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        targetValueLabel.text = "\(targetValue)"
        currentValue = 50
        round += 1
    }
    
    func calculatePoints() -> Int {
        
        let diference = abs(targetValue - currentValue)
        
        if diference == 0{
            return (100 - diference) + 100
        } else if diference == 1 {
            return (100 - diference) + 50
        } else {
            return 100 - diference
        }
    }
    
    @IBAction func restartGame(_ sender: UIButton) {
        score = 0
        round = 0
        updateLabels()
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = Int((slider.value * 100).rounded())
        print(currentValue)
    }
    
}

