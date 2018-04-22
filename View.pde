//import g4p_controls.*;



Tpm tpm;
Eentrada ent;
Tpa tpa;


class View implements Iview {
  //private Presenter presenter = new Presenter(this);
  private Texts txt;
  private tIVParkingDB tIVParkingDB;
  private Presenter presenter;


  View(tIVParkingDB tIVParkingDB){

    presenter = new Presenter(this,tIVParkingDB);

    this.tIVParkingDB = tIVParkingDB;
    txt = new Texts();
    ent = new Eentrada(tIVParkingDB);
    tpa = new Tpa(tIVParkingDB,presenter.getAllTicket());
    tpm = new Tpm(tIVParkingDB,presenter.getAllTicket());

    G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
    G4P.setCursor(ARROW);
    surface.setTitle(txt.titleApp);

  }
  @Override
  void setTpa(Ticket t,String[] plts){
    String s = ""+t.getPay();
    tpa.setlb(lbEquEmisor,t.getEquiEmisor());
    tpa.setlb(lbDateInit,t.getDateInit());
    tpa.setlb(lbDateFinal,t.getDateFinal());
    tpa.setlb(lbPay,s);
    tpa.setPlts(plts);
  }
  @Override
  void setTpa(Ticket t){
    String s = ""+t.getPay();
    tpa.setlb(lbEquEmisor,t.getEquiEmisor());
    tpa.setlb(lbDateInit,t.getDateInit());
    tpa.setlb(lbDateFinal,t.getDateFinal());
    tpa.setlb(lbPay,s);
  }
  @Override
  void setTpa(String[] plts){
    tpa.setPlts(plts);
  }
}
public void handleButtonEvents(GButton button, GEvent event) {
  if(button == btnPagoTpa && event == GEvent.PRESSED){
    println("btnPagoTpa");
    tpa.setlb(lbDateInit,"btnPagoTpa");
  }
  if(button == btnEmitirTicke && event == GEvent.PRESSED){
    println("btnEmitirTicke");
  }
  if(button == btnEmitirTpm && event == GEvent.PRESSED){
    println("btnEmitirTpm");
  }
  if(button == btnPagoTpm && event == GEvent.PRESSED){
    println("btnPagoTpm");
  }
 }
public void handleDropListEvents(GDropList list, GEvent event) {
  println("hicieron algo en el drop list");
 }
