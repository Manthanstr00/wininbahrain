
class Questions {
    final int id;
    final String question;
    final String correctAnswer;
    
    Questions({this.id, this.correctAnswer, this.question});
}

class Answers {
    final int questionId;
    final String optionOne;
    final String optiontwo;
    final String optionThree;
    final String optionFour;
    
    Answers(
        {this.questionId,
            this.optionOne,
            this.optiontwo,
            this.optionThree,
            this.optionFour});
}
