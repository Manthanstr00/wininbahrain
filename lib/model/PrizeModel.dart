
import 'dart:io';

class Prize {
    String title;
    String deliveryType;
    String collection;
    List<PrizeImage> images;
    
    Prize({this.title, this.deliveryType, this.collection,this.images});
}



class PrizeImage{
    File image;
    PrizeImage({this.image});
}



class Delivery {
    final int id;
    String type;
    
    Delivery({this.id, this.type});
}

