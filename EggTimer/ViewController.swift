import UIKit
import AVFoundation
var player: AVAudioPlayer?

class ViewController: UIViewController {
    
    let eggTimes = ["Soft" : 300 , "Medium" : 420 , "Hard" : 700 ]
    
    @IBOutlet weak var pBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func click(_ sender: UIButton) {
        
        timer.invalidate()
        totalTime = 0
        secondsPassed = 0
        let hardness = sender.currentTitle!
        titleLabel.text = hardness
        totalTime = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    @objc func updateTimer(){
        if  secondsPassed < totalTime{
            pBar.progress = Float(secondsPassed) / Float(totalTime)
            print(pBar.progress)
            secondsPassed += 1
        
        }
        else{
            timer.invalidate()
            pBar.progress = Float(secondsPassed) / Float(totalTime)
            titleLabel.text = "Done!"
            playSound()
        }
        
    }
    func playSound() {
        guard let path = Bundle.main.path(forResource: "alarm_sound", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }

    
}
