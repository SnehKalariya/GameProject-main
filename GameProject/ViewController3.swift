//
//  ViewController3.swift
//  GameProject
//
//  Created by Sneh kalariya on 22/02/23.
//

import UIKit

class ViewController3: UIViewController {
    
    var frequncy = 0.1
    var time1 = Timer()
    var score = 0
    var first = 0
    var second = 0
    var ans = 0
    var array2 = [Int]()
    var highScore = UserDefaults.standard.integer(forKey: "highscore")
    var abc = 0
    var life = 1
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var questionLabel1: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var questionLabel2: UILabel!
    @IBOutlet weak var equalToLabel: UILabel!
    @IBOutlet weak var ansLabel: UILabel!
    @IBOutlet weak var lifeLine1: UIImageView!
    @IBOutlet weak var lifeLine2: UIImageView!
    @IBOutlet weak var lifeLine3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trueButton.layer.cornerRadius = 10
        falseButton.layer.cornerRadius = 10
        genret()
        progressbar.progress = 1.0
        progress()
        scoreLabel1()
    }
    
    func progress(){
        var a : Float = 1.0
        time1.invalidate()
        self.progressbar.progress = a
        time1 = Timer.scheduledTimer(withTimeInterval: frequncy, repeats: true, block: { (timer) in
            a -= 0.01
            self.progressbar.progress = a
            if self.progressbar.progress == 0.0{
                self.progressbar.progress = 1.0
                self.time1.invalidate()
                self.updatehighscore()
                self.showAlert(title: "")
            }
        })
    }
    
    func scoreLabel1(){
        scoreLabel.layer.cornerRadius = 15
        scoreLabel.layer.masksToBounds = true
    }
    func updatehighscore(){
        if score > highScore
        {
            highScore = score
            UserDefaults.standard.set(score, forKey: "highscore")
        }
    }
    
    func genret(){
        let firstNumber = Int.random(in: 1...99)
        let secondNumber = Int.random(in: 1...99)
        
        let array = ["+","-"]
        let opretor = array.randomElement()
        
        let addition = firstNumber + secondNumber
        let subsraction = firstNumber - secondNumber
        
        operatorLabel.text = opretor
        
        if operatorLabel.text == "+"{
            ans = addition
        }
        else{
            ans = subsraction
        }
        
        let randomAnswer = Int.random(in: 1...200)
        var array2 = [ans,randomAnswer]
        
        array2.shuffle()
        
        questionLabel1.text = "\(firstNumber)"
        questionLabel2.text = "\(secondNumber)"
        
        abc = array2.randomElement() ?? 0
        ansLabel.text = "\(Int(abc ))"
        
    }
    
    func showAlert(title:String){
        updatehighscore()
        let alert = UIAlertController(title: "Game Over", message: "Score:\(score)\n High score:\(highScore)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Home", style: .default,handler: { _ in
            self.naviget()
        }))
        alert.addAction(UIAlertAction(title: "Restart", style: .default,handler: { _ in
            self.lifeLine1.image = UIImage(systemName: "heart.fill")
            self.lifeLine2.image = UIImage(systemName: "heart.fill")
            self.lifeLine3.image = UIImage(systemName: "heart.fill")
            self.life = 1
            self.scoreLabel.text = "\(self.score -= self.score)"
            self.score = 0
            self.scoreLabel.text = "0"
            self.progress()
            self.genret()
            self.updatehighscore()
            
        }))
        present(alert, animated: true)
    }
    
    func naviget(){
        let n = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.popViewController(animated: false)
    }
    
    
    @IBAction func trueButtonAction(_ sender: UIButton) {
        if ansLabel.text == "\(ans)" && (abc != 0)  {
            score+=1
            scoreLabel.text = "\(score)"
            genret()
        }
        else if  life == 1{
            lifeLine1.image = UIImage(systemName: "heart")
            life+=1
        }
        else if  life == 2{
            lifeLine2.image = UIImage(systemName: "heart")
            life+=1
        }
        
        else{
            lifeLine3.image = UIImage(systemName: "heart")
            showAlert(title: "game over")
        }
        progress()
    }
    
    @IBAction func falseButtonAction(_ sender: UIButton) {
        if ansLabel.text != "\(ans)"   && (abc != 0) {
            score+=1
            scoreLabel.text = "\(score)"
            genret()
        }
        else if  life == 1{
            lifeLine1.image = UIImage(systemName: "heart")
            life+=1
        }
        else if  life == 2{
            lifeLine2.image = UIImage(systemName: "heart")
            life+=1
        }
        else{
            lifeLine3.image = UIImage(systemName: "heart")
            showAlert(title: "game over")
        }
        progress()
    }
}
