//
//  ViewController.swift
//  02-skullDices
//
//  Created by Alonso Martinez on 23/07/20.
//  Copyright © 2020 Alonso Martinez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var press: UIButton!
    
    @IBOutlet weak var imageViewDiceLeft: UIImageView!
    
    
    @IBOutlet weak var imageViewDiceRight: UIImageView!
    
    var randomDiceIndexLeft : Int = 0
    
    var randomDiceIndexRight : Int = 0
    
    let diceImages = ["Dice1", "Dice2", "Dice3", "Dice4", "Dice5", "Dice6"]
    
    let nFaces : UInt32
    
    required init?(coder aDecoder: NSCoder) {
        nFaces = UInt32(diceImages.count)
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        generateRandomDices()
    }
    
    
    
    @IBAction func buttonPress(_ sender: UIButton)
      {
    
        generateRandomDices()
    }
    
    func generateRandomDices(){
        
        
        
       randomDiceIndexLeft = Int(arc4random_uniform(nFaces))
        
      randomDiceIndexRight = Int(arc4random_uniform(nFaces))
        
        
            
        UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            
            self.imageViewDiceLeft.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: -100, y: 100))
            
            self.imageViewDiceRight.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: 100, y: 100))
            
            
        }) { (completed) in
            
            self.imageViewDiceLeft.transform = CGAffineTransform.identity
            
            self.imageViewDiceRight.transform = CGAffineTransform.identity
            
            self.imageViewDiceLeft.image = UIImage(named: self.diceImages[self.randomDiceIndexLeft] )
                  
                  
            self.imageViewDiceRight.image = UIImage(named: self.diceImages[self.randomDiceIndexRight])
        }
        
        
    }
    
    override func becomeFirstResponder() -> Bool {
        true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake{generateRandomDices()
            
        }
    }

}
