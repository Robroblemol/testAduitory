import g4p_controls.*;
GPanel pnlTPM;
GButton btnEmitirTpm, btnPagoTpm;
GDropList selecPlateTpm;


class Tpm{
  private Texts txt;
  private tIVParkingDB tIVParkingDB;
  private String [] plts = null;

  Tpm(tIVParkingDB tIVParkingDB,String[] plts){
    G4P.messagesEnabled(false);
    this.tIVParkingDB = tIVParkingDB;
    txt = new Texts();

    selecPlateTpm = new GDropList(tIVParkingDB,0,0,120, 90, 5);
    selecPlateTpm.setItems(plts,0);

    btnEmitirTpm = new GButton(tIVParkingDB,0,0,100,25,
      txt.btnEmitirTicke);
    btnEmitirTpm.fireAllEvents(true);
    btnPagoTpm = new GButton(tIVParkingDB,0,0,50,25,
      txt.btnPago);
    btnPagoTpm.fireAllEvents(true);

    pnlTPM = new GPanel(tIVParkingDB,450,30,160, 140,
      txt.titleTPM);
    pnlTPM.addControl(selecPlateTpm, 10, 20);
    pnlTPM.addControl(btnEmitirTpm, 5, 50);
    pnlTPM.addControl(btnPagoTpm, 110, 50);
    pnlTPM.setCollapsed(false);
  }
  void setPlts(String[] plts ) {
    selecPlateTpm.setItems(plts,0);
  }
  void setPlts(String[] plts, int selec ) {
    selecPlateTpm.setItems(plts,selec);
  }
}
