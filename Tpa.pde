import g4p_controls.*;

GPanel pnlTPA;
GDropList selecPlate;
GButton btnPagoTpa;
public GLabel lbEquEmisor, lbDateInit,
  lbDateFinal, lbPay;
GButton btnEmitirTpa;


class Tpa {

  private Texts txt;
  private tIVParkingDB tIVParkingDB;
  private ArrayList<String> plts = null;

  Tpa(tIVParkingDB tIVParkingDB, ArrayList<String> plts){
    G4P.messagesEnabled(false);
    this.tIVParkingDB = tIVParkingDB;
    this.plts = plts;
    txt = new Texts();

    selecPlate = new GDropList(tIVParkingDB,0,0,120, 90, 5);
    selecPlate.setItems(plts,0);

    btnPagoTpa = new GButton(tIVParkingDB,0,0,50,25,
      txt.btnPago);
    btnPagoTpa.fireAllEvents(true);

    lbEquEmisor = new GLabel(tIVParkingDB,0,0,200,25,
      txt.testLb);
    lbDateInit = new GLabel(tIVParkingDB,0,0,200,25,
      txt.testLb);
    lbDateFinal = new GLabel(tIVParkingDB,0,0,200,25,
      txt.testLb);
    lbPay = new GLabel(tIVParkingDB,0,0,200,25,
      txt.testLb);

    pnlTPA = new GPanel(tIVParkingDB,220,30,190, 140,
      txt.titleTPA);
    pnlTPA.addControl(selecPlate, 10, 20);
    pnlTPA.addControl(btnPagoTpa, 70, 115);
    pnlTPA.addControl(lbEquEmisor, 10,30);
    pnlTPA.addControl(lbDateInit, 10,50);
    pnlTPA.addControl(lbDateFinal, 10,70);
    pnlTPA.addControl(lbPay, 10,90);
    pnlTPA.setCollapsed(false);

  }

  void setPlts(ArrayList<String> plts) {
    selecPlate.setItems(plts,0);
  }
  void setPlts(String plt) {
    plts.add(plt);
    //println("TPA >> placa:"+plt);
    selecPlate.setItems(plts,0);
    //selecPlate.addItem(plt);
  }
  void setlb(GLabel lb, String s){
     lb.setText(s);
   }

}
