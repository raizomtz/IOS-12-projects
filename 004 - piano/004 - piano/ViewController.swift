//
//  ViewController.swift
//  004 - piano
//
//  Created by Alonso Martinez on 03/09/20.
//  Copyright © 2020 Alonso Martinez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer : AVAudioPlayer!
    
    let soundsArray = ["c1", "c1s", "d1", "d1s", "e1", "f1", "f1s", "g1", "g1s", "a1", "a1s", "b1", "c2"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func playSound(_ sender: UIButton) {
        let idKey = sender.tag
        let fileName = soundsArray[idKey-1]
        //print ("haz pulsado la tecla  \(fileName)")
        
        if  let soundUrl : URL = Bundle.main.url(forResource: fileName, withExtension: "mp3"){
            //print (soundUrl)
            
            do{
                audioPlayer =  try AVAudioPlayer(contentsOf: soundUrl)
                
            } catch {
                print (error)
            }
            
            audioPlayer.play()
        }
        
    }
    

}

