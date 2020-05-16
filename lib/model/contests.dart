class ContestsModel{
    final String contestName;
    final String contestDescription;
    final int price;
    final String displayImage;
    final int totalTickets;
    final int soldTickets;
    final bool charity;
    
    ContestsModel({this.contestName,this.price,this.displayImage,this.charity,this.soldTickets,this.totalTickets,this.contestDescription});
}