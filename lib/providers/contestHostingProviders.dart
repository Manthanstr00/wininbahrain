import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wininbahrain/Constant/Constant.dart';

class ContestHosting extends ChangeNotifier {
  final contestTitle = TextEditingController(text: "Multiple Prize draw");
  final contestDescription = TextEditingController(text: "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software");
  File imageOne;
  File imageTwo;
  File imageThree;
  File promotionalPhoto;
  DateTime endTime;
  final prizeTitle = TextEditingController(text: "Apple one");
  final prizeCollection = TextEditingController(text: "Goa");

  int selectedQuestionId;
  String selectedQuestion;

  
  onSelectDate(DateTime value){
    endTime = value;
    notifyListeners();
  }
  
  List<Questions> questions = <Questions>[
    Questions(
        id: 1, question: "What is the color of Smurfs?", correctAnswer: "Blue"),
    Questions(
        id: 2,
        question: "Who is the President of USA?",
        correctAnswer: "Donald Trump"),
  ];

  
  
  
  
  List<Answers> answers = <Answers>[
    Answers(
        questionId: 1,
        optionOne: "Red",
        optiontwo: "Green",
        optionThree: "Yellow",
        optionFour: "Blue"),
    Answers(
        questionId: 2,
        optionOne: "Donald Trump",
        optiontwo: "Alexander Lukashenko",
        optionThree: "Francisco Guterres",
        optionFour: "Guðni Th. Jóhannesson"),
  ];

  //DropDown
  String selectedCurrency = "BD";
  String selectedItem = "Delivery not included";
  int selectedNumberOfTickets = 100;
  String selectedPricePerTicket;

  List<Delivery> delivery = <Delivery>[
    Delivery(id: 1, type: "Delivery not included"),
    Delivery(id: 2, type: "Internation delivery included"),
    Delivery(id: 3, type: "Delivery at additional Cost"),
    Delivery(id: 4, type: "Collection only"),
  ];
  
  List<Widget> prizesWidget = [];
  List<Prize> prizes = <Prize>[];
  
  
  bool charity = false;
  double charityPercentage = 1.0;

  onChangeCharitySlider(value) {
    charityPercentage = value;
    print(charityPercentage);
    notifyListeners();
  }

  onChangeCharity(value) {
    if (charity == false) {
      charity = true;
    } else {
      charity = false;
    }
    notifyListeners();
  }

  List<Ticket> tickets = <Ticket>[
    Ticket(numberOfTickets: 100),
    Ticket(numberOfTickets: 200),
    Ticket(numberOfTickets: 300),
    Ticket(numberOfTickets: 400),
    Ticket(numberOfTickets: 500),
    Ticket(numberOfTickets: 600),
    Ticket(numberOfTickets: 700),
    Ticket(numberOfTickets: 800),
    Ticket(numberOfTickets: 900),
    Ticket(numberOfTickets: 1000),
    Ticket(numberOfTickets: 5000),
    Ticket(numberOfTickets: 10000),
    Ticket(numberOfTickets: 20000),
  ];

  List<String> currency = <String>[
    "BD",
  ];

  List<String> pricePerTicket = <String>[
    "0.5 BD",
    "1 BD",
    "2 BD",
    "3 BD",
    "4 BD",
    "5 BD",
    "6 BD",
    "7 BD",
    "8 BD",
    "9 BD",
  ];

  addPrize() {
    if (prizeTitle.text.isNotEmpty || selectedItem != null) {
        prizes.add(Prize(title: prizeTitle.text,deliveryType: selectedItem,collection: prizeCollection.text));
        prizesWidget.add(
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [boxShadow(shadowStrength: 1, offset: Offset(-2,2))],
                  borderRadius: borderRadius(radius: 10),
                ),
              padding:  EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Prize ${prizes.length}",style: h1,),
                Text(prizeTitle.text, style: TextStyle(fontSize: 17, color: Colors.red[300], fontWeight: FontWeight.bold),),
                SizedBox(height: 3,),
                  Text(selectedItem, style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.w400),),
              Row(children: [
                Text("Prize collection : ", style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.w600),),Text(prizeCollection.text, style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.w400),)
              ],),
              ],),
            ),
          )
        );
      prizeTitle.clear();
      selectedItem = null;
      prizeCollection.clear();
    }
    notifyListeners();
  }

  clearPrizes() {
    prizesWidget.clear();
    prizes.clear();
    notifyListeners();
  }

  Future uploadUsingCamera(imageFlag, context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    checkImage(imageFlag, image, context);
  }

  Future uploadFromImageGallery(imageFlag, context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    checkImage(imageFlag, image, context);
  }

  checkImage(imageFlag, File image, context) {
    if (imageFlag == 0) {
      imageOne = image;
    } else if (imageFlag == 1) {
      imageTwo = image;
    } else if (imageFlag == 2) {
      imageThree = image;
    } else {
      promotionalPhoto = image;
    }
    Navigator.of(context).pop();
    print(image.path);
    notifyListeners();
  }

  onChangeDropdown(value) {
    selectedItem = value;
    notifyListeners();
  }

  onChangeTicketDropdown(value) {
    selectedNumberOfTickets = int.parse(value);
    notifyListeners();
  }

  onChangeCurrency(value) {
    selectedCurrency = value;
    notifyListeners();
  }

  onChangePricePerTicket(value) {
    selectedPricePerTicket = value;
    notifyListeners();
  }

  onChangeQuestion(value) {
    answerWidget.clear();
    correctAnswerWidget.clear();
    selectedQuestion = value;
    questions.forEach((element) {
      if (element.question == value) {
        selectedQuestionId = element.id;
      }
    });
    onQuestionSelect();
    notifyListeners();
  }

  List<Widget> answerWidget = [];
  List<Widget> correctAnswerWidget = [];

  onQuestionSelect() {
    if (selectedQuestionId != null) {
      answers.forEach((element) {
        if (element.questionId == selectedQuestionId) {
          answerWidget.add(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Options",
                          style: TextStyle(
                              color: Colors.red[300],
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        element.optionOne,
                        style: h3,
                      ),
                      Text(
                        element.optiontwo,
                        style: h3,
                      ),
                      Text(
                        element.optionThree,
                        style: h3,
                      ),
                      Text(
                        element.optionFour,
                        style: h3,
                      ),
                    ],
                  ),
                ),
                  Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                  Text(
                                      "Correct Answer",
                                      style: TextStyle(
                                          color: Colors.red[300],
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,
                                  ),
                              ],
                          ),
                      ),
                  ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: correctAnswerWidget,
                )
              ],
            ),
          );
          questions.forEach((element) {
              if(element.id == selectedQuestionId){
                  correctAnswerWidget.add(
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(element.correctAnswer,style: TextStyle(fontSize: 23, color: Colors.green[300], fontWeight: FontWeight.bold),),
                      )
                  );
              }
          });
        }
      });
    }
    notifyListeners();
  }

  showUploadMenu(BuildContext context, imageFlag) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
              child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ModalTile(
                    title: 'Select image',
                    icon: Icons.photo_library,
                    tap: () {
                      uploadFromImageGallery(imageFlag, context);
                    },
                  ),
                  ModalTile(
                    title: 'Take picture',
                    icon: Icons.camera_alt,
                    tap: () {
                      uploadUsingCamera(imageFlag, context);
                    },
                  ),
                ],
              ),
            ),
          ));
        });
  }
  
  
  Color selfPromoteBox  = Colors.white;
  Color featuredBox  = Colors.white;
  Color selfPromoteBoxText  = Colors.red[300];
  Color featuredBoxText  = Colors.red[300];
  Color borderColor = Colors.red[300];
  bool selfPromote = false;
  bool featured = false;
  
  double featuredBoxHeight = 80;
  double selfPromotedBoxHeight = 80;
  
  
  
  Color publishBoxSelectedColor = Colors.red[300];
  Color publishBoxUnselectedColor = Colors.white;
  
  onSelectPublishButton(flag){
    if(flag == 0){
      selfPromote = true;
      featured = false;
      selfPromotedBoxHeight = 85;
      featuredBoxHeight = 80;
      selfPromoteBox = publishBoxSelectedColor;
      selfPromoteBoxText = publishBoxUnselectedColor;
      featuredBoxText = publishBoxSelectedColor;
      featuredBox = publishBoxUnselectedColor;
    }
    else{
      featured = true;
      selfPromote = false;
      selfPromotedBoxHeight = 80;
      featuredBoxHeight = 85;
      featuredBoxText = publishBoxUnselectedColor;
      featuredBox = publishBoxSelectedColor;
      selfPromoteBox = publishBoxUnselectedColor;
      selfPromoteBoxText = publishBoxSelectedColor;
    }
    notifyListeners();
  }
  
  
}

class Delivery {
  final int id;
  String type;

  Delivery({this.id, this.type});
}

class Prize {
  String title;
  String deliveryType;
  String collection;

  Prize({this.title, this.deliveryType,this.collection});
}

class Ticket {
  final int numberOfTickets;
  Ticket({this.numberOfTickets});
}

class Currency {
  final String currency;
  Currency({this.currency});
}

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
