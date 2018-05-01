import g4p_controls.*;
GPanel pnlTPM;
GButton btnEmitirTpm, btnPagoTpm;
GDropList selecPlateTpm;
GTextField edtTextPlateTpm;


class Tpm{
  private Texts txt;
  private tIVParkingDB tIVParkingDB;
  private ArrayList<String> plts = null;

  Tpm(tIVParkingDB tIVParkingDB,ArrayList<String> plts){
    G4P.messagesEnabled(false);
    this.tIVParkingDB = tIVParkingDB;
    this.plts =plts;
    txt = new Texts();

    edtTextPlateTpm = new GTextField(tIVParkingDB,0,0,70,20);
    edtTextPlateTpm.setPromptText("placa");

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
    pnlTPM.addControl(edtTextPlateTpm,10,70);
    pnlTPM.addControl(btnEmitirTpm, 10, 100);
    pnlTPM.addControl(btnPagoTpm, 10,40);
    pnlTPM.setCollapsed(false);
  }
  void setPlts(ArrayList<String> plts ) {
    selecPlateTpm.setItems(plts,0);
  }
  void setPlts(String plt) {
    plts.add(plt);
    selecPlateTpm.setItems(plts,0);
  }
}
