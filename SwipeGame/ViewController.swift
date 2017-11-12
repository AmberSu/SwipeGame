//
//  ViewController.swift
//  SwipeGame
//
//  Created by MacOS on 12/11/2017.
//  Copyright © 2017 amberApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number: UILabel!
    var value: Int = 50
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
            value = value - 1
            number.text = String(value)
            print("swipe")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerOn()
        movementOn()
    }
    
    func labelDisapear() {
        UIView.animate(withDuration: 5) {
            self.number.alpha = 0
        }
    }
    
    func timerOn() {
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateTimer() {
        switch value {
        case 0:
            number.text = "You Won!"
            labelDisapear()
            break
        case 100:
            number.text = "Game Over"
            labelDisapear()
            break
        default:
            value = value + 1
            number.text = String(value)
        }
    }
    
    func movementOn() {
        if value != 0 && value != 100 {
            let randomNumber1 = arc4random_uniform(UInt32(280))
            let randomNumber2 = arc4random_uniform(UInt32(680))
            UIView.animate(withDuration: 3, animations: {
                self.number.frame.origin.x = CGFloat(randomNumber1)
                self.number.frame.origin.y = CGFloat(randomNumber2)
            }) { (true) in
                self.movementOn()
            }
        }
    }

}

