//
//  ViewController.swift
//  X-O
//
//  Created by Haider Almansour on 6/29/20.
//  Copyright © 2020 zaro. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    
    @IBOutlet weak var b1: UIButton!
    
    @IBOutlet weak var b2: UIButton!
    
    @IBOutlet weak var b3: UIButton!

    @IBOutlet weak var b4: UIButton!
    
    @IBOutlet weak var b5: UIButton!
    
    @IBOutlet weak var b6: UIButton!
    
    @IBOutlet weak var b7: UIButton!
    
    @IBOutlet weak var b8: UIButton!
    
    @IBOutlet weak var b9: UIButton!
    
    @IBOutlet weak var turnLabel: UILabel!
  

    @IBAction func oopsButtonPressed(_ sender: Any) {
        audioPlayer.play()
    }
    @IBAction func hoorayButtonPressed(_ sender: Any) {
        audioPlayer.pause()
    }
    
    var buttons: [UIButton] = []
    var counter = 0
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        let sound = Bundle.main.path(forResource: "اغنية شوجي امبيه خسر خسر", ofType: "mp3")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: [AVAudioSession.CategoryOptions.duckOthers])
            
        } catch{
            print(error)
        }
        
        buttons = [b1, b2, b3, b4, b5, b6, b7, b8, b9]
        
    }
    
    @IBAction func press(_ sender: UIButton) {
        
        print("تم الضغط علي")
        print (counter)
        if counter % 2 == 0{
        sender.setTitle("X", for: .normal)
        sender.setTitleColor(.green, for: .normal)
            turnLabel.text = "O Turn"
        }
        else{
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.red, for: .normal)
            turnLabel.text = "X Turn"
    }
    counter += 1
        sender.isEnabled = false
        
        xWinning()
        oWinning()
        
        
}

    @IBAction func resetTapped() {
        restartGame()
    }
    
    
    func xWinning()
    {
        // X winning
        if (b1.titleLabel?.text == "X" && b2.titleLabel?.text == "X" && b3.titleLabel?.text == "X") || (b4.titleLabel?.text == "X" && b5.titleLabel?.text == "X" && b6.titleLabel?.text == "X") || (b7.titleLabel?.text == "X" && b8.titleLabel?.text == "X" && b9.titleLabel?.text == "X") || (b1.titleLabel?.text == "X" && b4.titleLabel?.text == "X" && b7.titleLabel?.text == "X") || (b2.titleLabel?.text == "X" && b5.titleLabel?.text == "X" && b8.titleLabel?.text == "X") || (b3.titleLabel?.text == "X" && b6.titleLabel?.text == "X" && b9.titleLabel?.text == "X") || (b1.titleLabel?.text == "X" && b5.titleLabel?.text == "X" && b9.titleLabel?.text == "X") || (b3.titleLabel?.text == "X" && b5.titleLabel?.text == "X" && b7.titleLabel?.text == "X")
        {
            print("X the winner")
            
            let alertController = UIAlertController(title: "X won", message: "press the button to restart", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "restart game", style: .cancel) { (alert) in
                // restart game
                self.restartGame()
            }
            alertController.addAction(restartAction)
            present(alertController, animated: true, completion: nil)
        }
        
    }
    
    func oWinning()
    {
        
        // O winning
        if (b1.titleLabel?.text == "O" && b2.titleLabel?.text == "O" && b3.titleLabel?.text == "O") || (b4.titleLabel?.text == "O" && b5.titleLabel?.text == "O" && b6.titleLabel?.text == "O") || (b7.titleLabel?.text == "O" && b8.titleLabel?.text == "O" && b9.titleLabel?.text == "O") || (b1.titleLabel?.text == "O" && b4.titleLabel?.text == "O" && b7.titleLabel?.text == "O") || (b2.titleLabel?.text == "O" && b5.titleLabel?.text == "O" && b8.titleLabel?.text == "O") || (b3.titleLabel?.text == "O" && b6.titleLabel?.text == "O" && b9.titleLabel?.text == "O") || (b1.titleLabel?.text == "O" && b5.titleLabel?.text == "O" && b9.titleLabel?.text == "O") || (b3.titleLabel?.text == "O" && b5.titleLabel?.text == "O" && b7.titleLabel?.text == "O")
        {
            print("O the winner")
            
            let alertController = UIAlertController(title: "O won", message: "press the button to restart", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "restart", style: .cancel, handler: nil)
            alertController.addAction(restartAction)
            present(alertController, animated: true, completion: nil)
        }
        
        
    }
    
 func restartGame()
 {
    
    for b in buttons{
        b.setTitle("", for: .normal)
        b.titleLabel?.text = ""
        b.isEnabled = true
    }
    
    b1.setTitle("", for: .normal)
    b1.titleLabel?.text = ""
    b1.isEnabled = true
    
    b2.setTitle("", for: .normal)
    b2.titleLabel?.text = ""
    b2.isEnabled = true
    
    b3.setTitle("", for: .normal)
    b3.titleLabel?.text = ""
    b3.isEnabled = true
    
    b4.setTitle("", for: .normal)
    b4.titleLabel?.text = ""
    b4.isEnabled = true
    
    b5.setTitle("", for: .normal)
    b5.titleLabel?.text = ""
    b5.isEnabled = true
    
    b6.setTitle("", for: .normal)
    b6.titleLabel?.text = ""
    b6.isEnabled = true
    
    b7.setTitle("", for: .normal)
    b7.titleLabel?.text = ""
    b7.isEnabled = true
    
    b8.setTitle("", for: .normal)
    b8.titleLabel?.text = ""
    b8.isEnabled = true
    
    b9.setTitle("", for: .normal)
    b9.titleLabel?.text = ""
    b9.isEnabled = true
    
    counter = 0
    turnLabel.text = "X Turn"
    
    }
    
}

func alert(title: String, message: String){
    
    let alertController = UIAlertController(title: title, message: "you are the winner", preferredStyle: .alert)
    let okAction = UIAlertAction(title: message, style: .cancel)
    alertController.addAction(okAction)
    
    
}
