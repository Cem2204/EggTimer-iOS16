import UIKit

class ViewController: UIViewController {
    
    let softTime = 5
    let mediumTime = 8
    let hardTime = 12
    
    @IBAction func click(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        if hardness == "Soft"{
            print("Egg is Soft")
        }
        else if hardness == "Medium"{
            print("Egg is Medium")
        }
        else if hardness == "Hard"{
            print("Egg is Hard")
        }

    }
    
    
}
