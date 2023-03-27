
import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    @IBOutlet weak var progressBar2: UIProgressView!
    
  var time = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      progressBar2.progress = 0.0
        easyButton.layer.cornerRadius = 10
        mediumButton.layer.cornerRadius = 10
        hardButton.layer.cornerRadius = 10
    }
    
    @IBAction func easyButtonAction(_ sender: UIButton) {
       progress()
        naviget()
    }
    
    @IBAction func mudiumButtonAction(_ sender: UIButton) {
       progress()
        naviget1()
    }
    
    @IBAction func hardButtonAction(_ sender: UIButton) {
        progress()
        naviget2()
    }
    
    
    func progress(){
        var value : Float = 0.0
        self.progressBar2.progress = value
        time = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { (timer) in
            value += 0.03
            self.progressBar2.progress = value
            if self.progressBar2.progress == 1.0{
                self.progressBar2.progress = 0.0

                self.time.invalidate()
            }
        })
    }
    
    func naviget(){
        let n = storyboard?.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        n.frequncy = 0.090
        navigationController?.pushViewController(n, animated: true)
    }
    func naviget1(){
        let n = storyboard?.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        n.frequncy = 0.050
        navigationController?.pushViewController(n, animated: true)
    }
    func naviget2(){
        let n = storyboard?.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        n.frequncy = 0.020
        navigationController?.pushViewController(n, animated: true)
    }
    
}
