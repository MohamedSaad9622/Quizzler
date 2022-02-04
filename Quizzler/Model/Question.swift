
import Foundation

struct Question {
    let questionText : String
    /* first version
    let answer : String
    */
    let answer : [String]
    let correctAnswer : String
    
    init(q : String, a : [String], correctAnswer : String) {
        self.questionText = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}
