//import g4p_controls.*;



Tpm tpm;
Eentrada ent;
Tpa tpa;

class View implements Iview {
  //private Presenter presenter = new Presenter(this);
  private Texts txt;
  private tIVParkingDB tIVParkingDB;

  View(tIVParkingDB tIVParkingDB){

    this.tIVParkingDB = tIVParkingDB;
    txt = new Texts();
    ent = new Eentrada(tIVParkingDB);
    tpa = new Tpa(tIVParkingDB,txt.testArray);
    tpm = new Tpm(tIVParkingDB,txt.testArray);

    G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
    G4P.setCursor(ARROW);
    G4P.messagesEnabled(false);
    surface.setTitle(txt.titleApp);

  }
}
public void handleButtonEvents(GButton button, GEvent event) {
  if(button == btnPagoTpa && event == GEvent.PRESSED){
    println("btnPagoTpa");
    tpa.setlb(lbDateInit,"btnPagoTpa");
  }
 }
