class Ticket{
  private String equiEmisor = null;
  private String dateInit = null;
  private String dateFinal = null;
  private boolean pay = false;
  private int id = 0;

  Ticket(String equiEmisor,String dateInit,
    String dateFinal,String lbPay, int id){
      this.equiEmisor=equiEmisor;
      this.dateInit=dateInit;
      this.dateFinal=dateFinal;
      this.pay=pay;
      this.id=id;
    }
  void setDateFinal(String dateFinal ) {
    this.dateFinal=dateFinal;
  }

  void setpay(boolean pay ) {
    this.pay=pay;
  }
  String getEquiEmisor(){
    return equiEmisor;
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
  int getId(){
    return id=id;
  }
}
