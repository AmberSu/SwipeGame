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
    var timer = Timer()
    var value: Int = 50
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
            value = value - 1
            number.text = String(value)
            print("swipe")
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number.text = String(value)
        timerOn()
        movementOn()
    }
    
    func labelDisapear() {
        UIView.animate(withDuration: 5) {
            self.number.alpha = 0
        }
    }
    
    func timerOn() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateTimer() {
        switch value {
        case 0:
            labelDisapear()
            timer.invalidate()
            break
        case 60:
            timer.invalidate()
            print("Game Over")
            break
        default:
            value = value + 1
            number.text = String(value)
        }
    }
    
    func movementOn() {
         guard number.text != "0", number.text != "60" else {
           return
        }
        let randomNumber1 = arc4random_uniform(UInt32(self.view.bounds.width-number.frame.width))
        let randomNumber2 = arc4random_uniform(UInt32(self.view.bounds.height-number.frame.height))
        UIView.animate(withDuration: 3, animations: {
            self.number.frame.origin.x = CGFloat(randomNumber1)
            self.number.frame.origin.y = CGFloat(randomNumber2)
        }) { (true) in
            self.movementOn()
        }
        return
    }

}

