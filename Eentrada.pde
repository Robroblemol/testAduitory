import g4p_controls.*;
GPanel pnlEnt;
GButton btnEmitirTicke;
GTextField edtTextPlate;

class Eentrada{
  private Texts txt;
  private tIVParkingDB tIVParkingDB;

  Eentrada(tIVParkingDB tIVParkingDB){
    G4P.messagesEnabled(false);

    this.tIVParkingDB = tIVParkingDB;
    txt = new Texts();

    btnEmitirTicke = new GButton(tIVParkingDB,0,0,100,50,
      txt.btnEmitirTicke);
    btnEmitirTicke.fireAllEvents(true);

    edtTextPlate = new GTextField(tIVParkingDB,0,0,70,20);
    edtTextPlate.setPromptText("placa");

    pnlEnt = new GPanel(tIVParkingDB,20,30,160, 140,
      txt.titleEnt);
    pnlEnt.addControl(btnEmitirTicke, 30, 70);
    pnlEnt.addControl(edtTextPlate, 45, 40);
    pnlEnt.setCollapsed(false);

  }
}
