
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playButtonOutlet: UIButton!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var time = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        playButtonOutlet.layer.cornerRadius = 10
        progressBar.isHidden = true
        loadingLabel.isHidden = true
    }
    
    func progress(){
        var value : Float = 0.0
        self.progressBar.progress = value
        time = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { (time) in
            value += 0.02
            self.progressBar.progress = value
            if self.progressBar.progress == 1.0{
                self.progressBar.progress = 0.0
                self.showAlert(title: "1. There will be one math equation.\n 2. If equation is right,press 'FALSE'.\n  3. If equation is wrong,press 'TRUE'.")
                self.time.invalidate()
                self.naviget()
            }
        })
    }
    
    func showAlert(title:String){
        let alert = UIAlertController(title: "Error", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Play", style: .default,handler: { _ in
            self.naviget()
        }))
        present(alert,animated: true)
    }
    
    func naviget(){
        let naviget = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(naviget, animated: true)
    }
    
    @IBAction func playButtonAction(_ sender: UIButton) {
        progress()
        loadingLabel.isHidden = false
        progressBar.isHidden = false
    }
}

