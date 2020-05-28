import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wininbahrain/Constant/Constant.dart';
import 'package:wininbahrain/model/CharityModel.dart';
import 'package:wininbahrain/model/PrizeModel.dart';
import 'package:wininbahrain/model/QuestionAnswerModel.dart';

class ContestHostingProvider extends ChangeNotifier {
  final contestTitle = TextEditingController();
  final contestDescription = TextEditingController();
  File imageOne;
  File imageTwo;
  File imageThree;
  File promotionalPhoto;
  DateTime endTime;

  
  ///Introduction Swiper
  final int swiperIndex = 0;

  static Color activeColor = Colors.black54;
  static Color inactiveColor = Colors.black26;

  Color dotOneColor = activeColor;
  Color dotTwoColor = inactiveColor;
  Color dotThreeColor = inactiveColor;

  onChanged(index) {
    if (index == 0) {
      dotOneColor = activeColor;
      dotTwoColor = inactiveColor;
      dotThreeColor = inactiveColor;
      notifyListeners();
    }
    if (index == 1) {
      dotOneColor = inactiveColor;
      dotTwoColor = activeColor;
      dotThreeColor = inactiveColor;
      notifyListeners();
    }
    if (index == 2) {
      dotOneColor = inactiveColor;
      dotTwoColor = inactiveColor;
      dotThreeColor = activeColor;
      notifyListeners();
    }
  }

  ///Introduction Swiper

  int selectedQuestionId;
  String selectedQuestion;

  onSelectDate(DateTime value) {
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
  int selectedNumberOfTickets;
  String selectedPricePerTicket;




  
  ///Prize Section
  var prizeTitle = TextEditingController();
  var prizeCollection = TextEditingController();
  String selectedDeliveryType;
  File tempPrizeImage;
  File emptyFile;
  List<Prize> prizes = <Prize>[];
  List<PrizeImage> prizeImages = <PrizeImage>[];


  onChangeDropdown(value) {
      selectedDeliveryType = value;
      notifyListeners();
  }


  List<Delivery> delivery = <Delivery>[
      Delivery(id: 1, type: "Delivery not included"),
      Delivery(id: 2, type: "Internation delivery included"),
      Delivery(id: 3, type: "Delivery at additional Cost"),
      Delivery(id: 4, type: "Collection only"),
  ];


  addPrize() {
      if (prizeTitle.text.isNotEmpty || selectedDeliveryType != null || prizeImages.isEmpty) {
          prizes.add(Prize(
              title: prizeTitle.text,
              images: prizeImages,
              deliveryType: selectedDeliveryType,
              collection: prizeCollection.text));
          prizes.forEach((element) {
              element.images.forEach((element) {
                  print(element.image.path);
              });
          });
          clearPrizeInputs();
          notifyListeners();
      }
  }



  clearPrizeInputs(){
      prizeTitle.clear();
      selectedDeliveryType = null;
      prizeImages = [];
      prizeCollection.clear();
      notifyListeners();
  }


  Future uploadPrizeImage(type,context) async {
      if(type == "gallery"){
          var image = await ImagePicker.pickImage(source: ImageSource.gallery);
          tempPrizeImage = image;
          addToPrizeImageList();
      }else{
          var image = await ImagePicker.pickImage(source: ImageSource.camera);
          tempPrizeImage = image;
          addToPrizeImageList();
      }
      notifyListeners();
      navPop(context);
  }

  addToPrizeImageList(){
      prizeImages.add(PrizeImage(image: tempPrizeImage));
      tempPrizeImage = emptyFile;
      prizeImages.forEach((element) {print("addedImage ${element.image.path}");});
      notifyListeners();
  }

  removePrize(index){
      prizes.removeAt(index);
      notifyListeners();
  }

  removePrizeImage(index){
      prizeImages.removeAt(index);
      notifyListeners();
  }

  String entryType = "Add";

  editPrize(title){
      entryType = "update";
      prizes.forEach((prize) {
          if(prize.title == title){
              prizeTitle = TextEditingController(text: prize.title);
              selectedDeliveryType = prize.deliveryType;
              prize.images.forEach((images) {
                  prizeImages.add(PrizeImage(image: images.image));
              });
              prizeCollection = TextEditingController(text: prize.collection);
          }
      });
      notifyListeners();
  }

  updatePrize(title){
      prizes.forEach((element) {
          if(element.title == title){
              element.title = prizeTitle.text;
              element.deliveryType = selectedDeliveryType;
              element.collection = prizeCollection.text;
              element.images = prizeImages;
              notifyListeners();
          }
      });
      clearPrizeInputs();
      entryType = "Add";
      notifyListeners();
  }

  addImagesForPrize(context){
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
                                          uploadPrizeImage("gallery",context);
                                      },
                                  ),
                                  ModalTile(
                                      title: 'Take a Picture',
                                      icon: Icons.camera_alt,
                                      tap: () {
                                          uploadPrizeImage("camera",context);
                                      },
                                  ),
                              ],
                          ),
                      ),
                  ));
          });
      notifyListeners();
  }


  clearPrizes() {
      prizes.clear();
      notifyListeners();
  }
  
  ///Prize Section
  
  ///Image Picker Handlers
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
                                      title: 'Take a Picture',
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
  
  ///Image Picker Handlers
  
  ///Tickets Selection
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

  ///Tickets Selection

 

///Question Answer Entrance

  onChangeQuestion(value, context) {
      answerWidget.clear();
      correctAnswerWidget.clear();
      selectedQuestion = value;
      questions.forEach((element) {
          if (element.question == value) {
              selectedQuestionId = element.id;
          }
      });
      onQuestionSelect(context);
      notifyListeners();
  }

  List<Widget> answerWidget = [];
  List<Widget> correctAnswerWidget = [];

  onQuestionSelect(context) {
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
                                                  "Answers",
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
                                          Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Container(
                                                  width: screenWidth(context),
                                                  padding:
                                                  EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.all((Radius.circular(10))),
                                                      border: Border.all(
                                                          width: 1, color: Color(0x55E57373))),
                                                  child: Text(
                                                      "Answer 1 ${element.optionOne}",
                                                      style: h1,
                                                  ),
                                              ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Container(
                                                  width: screenWidth(context),
                                                  padding:
                                                  EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.all((Radius.circular(10))),
                                                      border: Border.all(
                                                          width: 1, color: Color(0x55E57373))),
                                                  child: Text(
                                                      "Answer 2 ${element.optiontwo}",
                                                      style: h1,
                                                  ),
                                              ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Container(
                                                  width: screenWidth(context),
                                                  padding:
                                                  EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.all((Radius.circular(10))),
                                                      border: Border.all(
                                                          width: 1, color: Color(0x55E57373))),
                                                  child: Text(
                                                      "Answer 3 ${element.optionThree}",
                                                      style: h1,
                                                  ),
                                              ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Container(
                                                  width: screenWidth(context),
                                                  padding:
                                                  EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.all((Radius.circular(10))),
                                                      border: Border.all(
                                                          width: 1, color: Color(0x55E57373))),
                                                  child: Text(
                                                      "Answer 4 ${element.optionFour}",
                                                      style: h1,
                                                  ),
                                              ),
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
                      if (element.id == selectedQuestionId) {
                          correctAnswerWidget.add(Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                  width: screenWidth(context),
                                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all((Radius.circular(10))),
                                      border: Border.all(width: 1, color: Color(0x7766BB6A))),
                                  child: Text(
                                      element.correctAnswer,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.green[300],
                                          fontWeight: FontWeight.bold,
                                      ),
                                  ),
                              ),
                          ));
                      }
                  });
              }
          });
      }
      notifyListeners();
  }
  ///Question Answer Entrance

  
  
  ///Charity

  bool charity = false;
  double charityPercentage = 0.0;
  final charityOrgName = TextEditingController();

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
  
  onchangeCharityOgr(value){
      selectedCharityOrg = value;
      notifyListeners();
  }
  String selectedCharityOrg;
  List<CharityModel> charityOrganisations = [
      CharityModel(organisationName: "Covid-19"),
      CharityModel(organisationName: "SAAS"),
      CharityModel(organisationName: "Breast cancer"),
      CharityModel(organisationName: "Orphant house")
  ];
  
  ///Charity
  // Default Radio Button Item
  String selectedFeatured = 'Aggressive';

  // Group Value for Radio Button.
  int featuredTypeId = 1;

  List<FeaturedTypes> featuredTypeList = [
      FeaturedTypes(
          index: 1,
          name: "Aggressive",
          numberOfDays: "3 days"
      ),
      FeaturedTypes(
          index: 2,
          name: "Moderate",
          numberOfDays: "1 week"
      ),
      FeaturedTypes(
          index: 3,
          name: "Conservative",
          numberOfDays: "1 month"
      ),
      FeaturedTypes(
          index: 4,
          name: "Speculative",
          numberOfDays: "2 month"
      ),
      FeaturedTypes(
          index: 5,
          name: "Forever",
          numberOfDays: "Forever"
      ),
  ];
  
  
  onChangeFeaturedType(selected,id){
      selectedFeatured = selected ;
      featuredTypeId = id;
      notifyListeners();
  }

}


class FeaturedTypes {
    String name;
    int index;
    String numberOfDays;
    FeaturedTypes({this.name, this.index,this.numberOfDays});
}
class Ticket {
  final int numberOfTickets;
  Ticket({this.numberOfTickets});
}

class Currency {
  final String currency;
  Currency({this.currency});
}
