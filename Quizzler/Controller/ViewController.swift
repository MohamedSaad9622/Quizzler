
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateQuestionLabel()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
       
       if quizBrain.checkAnswer(userAnswer: sender.currentTitle!) {
            sender.backgroundColor = #colorLiteral(red: 0.2303866514, green: 1, blue: 0.1928658102, alpha: 1)
        }
        else{
            sender.backgroundColor = #colorLiteral(red: 1, green: 0.1802739278, blue: 0.2213374638, alpha: 1)
        }
        
        quizBrain.nextQuestion()
                
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateQuestionLabel), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateQuestionLabel() {
        
        questionLabel.text = quizBrain.getQuestionText()
        updateButton()
        // +1 because questionNumber start from 0 to quiz.count - 1
        progressBar.progress = quizBrain.getProgressValue()
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
      
    func updateButton() {
        chooseButton.setTitle(quizBrain.getChoose(index: 0), for: .normal)
        trueButton.setTitle(quizBrain.getChoose(index: 1), for: .normal)
        falseButton.setTitle(quizBrain.getChoose(index: 2), for: .normal)
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        chooseButton.backgroundColor = UIColor.clear
    }
    
}

