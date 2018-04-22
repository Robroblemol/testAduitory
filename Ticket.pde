class Ticket{
  private String equiEmisor = null;
  private String dateInit = null;
  private String dateFinal = null;
  private boolean pay = false;
  private String plate = null;
  private int id_tiquet = 0;

  Ticket(int id_tiquet,String dateInit,
    String dateFinal,String plate, boolean pay,
    String equiEmisor){
      this.equiEmisor=equiEmisor;
      this.dateInit=dateInit;
      this.dateFinal=dateFinal;
      this.pay=pay;
      this.id_tiquet=id_tiquet;
      this.plate = plate;
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
    return id_tiquet;
  }
  String getPlate(){
    return plate;
  }
}
