import g4p_controls.*;



Tpm tpm;
Eentrada ent;
Tpa tpa;
Presenter presenter;


class View implements Iview {
  //private Presenter presenter = new Presenter(this);
  private Texts txt;
  private tIVParkingDB tIVParkingDB;


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
    //String s = presenter.getAllTicket().get(0).toString();
    //println("View >> "+ s);
    presenter.setTpa(presenter.getAllTicket().
    get(0).toString());

  }
  @Override
  void setTpa(Ticket t,ArrayList<String> plts){
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
  void setTpa(String plt){
    tpa.setPlts(plt);
  }
  @Override
  void setTpm(String plt ) {
    tpm.setPlts(plt);
  }
  @Override
  void showMessageSuccefulDB( ) {
    G4P.showMessage(tIVParkingDB, txt.mgnInsertDato,
     txt.titleInsertDato,
     G4P.INFO );
  }
  @Override
  void addItem(String plt) {
    tpa.setPlts(plt);
    setTpm(plt);
    //tpm.setPlts(plt);
  }
  @Override
  void saveLog() {
    presenter.saveLog();
  }
}
public void handleButtonEvents(GButton button, GEvent event) {
  if(button == btnPagoTpa && event == GEvent.PRESSED){
    println("btnPagoTpa");
      presenter.setPay(selecPlate.getSelectedText(),"TPA");
  }
  if(button == btnEmitirTicke && event == GEvent.PRESSED){
    println("btnEmitirTicke");
    presenter.createTicket(edtTextPlate.getText(),"E001");
  }
  if(button == btnEmitirTpm && event == GEvent.PRESSED){
    println("btnEmitirTpm");
    presenter.createTicket(edtTextPlateTpm.getText(),"UserP");
  }
  if(button == btnPagoTpm && event == GEvent.PRESSED){
    println("btnPagoTpm");
    presenter.setPay(selecPlateTpm.getSelectedText(),"UserP");
  }
  if(button == btnDeleteTicket && event == GEvent.PRESSED){
    println("btnDeleteTicket");
    presenter.deleteTicket(selecPlateTpm.getSelectedText(),"Usep");
  }
 }
public void handleDropListEvents(GDropList list, GEvent event) {
  println("hicieron algo en el drop list");
  if(list == selecPlate)
    presenter.setTpa(selecPlate.getSelectedText());
 }
