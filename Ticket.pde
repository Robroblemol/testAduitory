class Ticket{
  private String equiEmisor = null;
  private String dateInit = null;
  private String dateFinal = null;
  private boolean pay = null;

  Ticket(String equiEmisor,String dateInit,
    String dateFinal,String lbPay){
      this.equiEmisor=equiEmisor;
      this.dateInit=dateInit;
      this.dateFinal=dateFinal;
      this.pay=pay;
    }
  void setDateFinal(String dateFinal ) {
    this.dateFinal=dateFinal;
  }
  void setDateFinal(String dateFinal ) {
    this.dateFinal=dateFinal;
  }
  void setpay(String pay ) {
    this.pay=pay;
  }
  String getEquiEmisor(){
    return equiEmisor;
  }
  String getDateInit(){
    return dateInit;
  }
  String getDateInit(){
    return dateInit;
  }
  String getDateFinal(){
    return dateFinal;
  }
  boolean getPay(){
    return pay;
  }
}
