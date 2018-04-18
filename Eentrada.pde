import g4p_controls.*;
GPanel pnlEnt;
GButton btnEmetirTicke;

class Eentrada{
  private Texts txt;
  private tIVParkingDB tIVParkingDB;

  Eentrada(tIVParkingDB tIVParkingDB){
    G4P.messagesEnabled(false);

    this.tIVParkingDB = tIVParkingDB;
    txt = new Texts();

    btnEmetirTicke = new GButton(tIVParkingDB,0,0,100,50,
      txt.btnEmetirTicke);
    btnEmetirTicke.fireAllEvents(true);

    pnlEnt = new GPanel(tIVParkingDB,20,30,160, 140,
      txt.titleEnt);
    pnlEnt.addControl(btnEmetirTicke, 30, 50);
    pnlEnt.setCollapsed(false);

  }
}
