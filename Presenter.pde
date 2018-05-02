import de.bezier.data.sql.*;
import java.sql.SQLException;

class Presenter implements Ipresenter{
  private ArrayList<Ticket> tickets = new ArrayList<Ticket>();
  private Texts txt = new Texts();
  private View v = null;
  private tIVParkingDB tIVParkingDB;
  MySQL msqlEnt, msqlTPA, msqlTPM;

  Presenter(View v,tIVParkingDB tIVParkingDB){
    this.v=v;
    this.tIVParkingDB=tIVParkingDB;
    msqlEnt = new MySQL(tIVParkingDB,txt.dir,
      txt.database,txt.e,txt.pass);
    msqlTPA = new MySQL(tIVParkingDB,txt.dir,
       txt.database,txt.tpa,txt.pass);
    msqlTPM = new MySQL(tIVParkingDB,txt.dir,
      txt.database,txt.userP,txt.pass);
    initiArrayT();

  }
  @Override
  void initiArrayT( ) {
    if(msqlTPM.connect()){
      msqlTPM.query("SELECT COUNT(*) "+
      "FROM tiquets" );
      msqlTPM.next();
      int l = msqlTPM.getInt(1);
      msqlTPM.query(
        "SELECT id_tiquet,fecha_init,fecha_end, "+
        " plate, state, e_emisor FROM tiquets"
        );
      for(int i = 0;i < l ;i++){
        msqlTPM.next();
        Ticket t = new Ticket(
            msqlTPM.getInt(1),
            msqlTPM.getString(2),
            msqlTPM.getString(3),
            msqlTPM.getString(4),
            msqlTPM.getBoolean(5),
            msqlTPM.getString(6)
          );
          tickets.add(t);
      }
    } else{
      G4P.showMessage(tIVParkingDB, "DB no conectada",
       "Error conexion BD",
       G4P.ERROR );
    }
  }

  @Override
  ArrayList getAllTicket(){
    ArrayList<String> r = new ArrayList<String>();
    for(int i=0; i < tickets.size();i++) {
      //println("tiquet: "+tickets.get(i).getPlate());
      r.add(tickets.get(i).getPlate());
    }
    //return txt.testArray;
      return r;
  }
  @Override
  void setTpa(String plc){
    v.setTpa(searchTicket(plc));
  }
  @Override
  void setPay(String plc, String user ) {

    Ticket t = searchTicket(plc);
    int id_tiquet = t.getId();
    boolean stt = t.getPay();
    String ee = t.getEquiEmisor();

    if(msqlTPA.connect()){
      msqlTPA.query("UPDATE tiquets "+
      "SET state = true, "+
      "fecha_end = (SELECT NOW()) "+
      "WHERE plate = '"+plc+"';" );
      setTpa(plc);

    }else{
      G4P.showMessage(tIVParkingDB, "DB no conectada",
       "Error conexion BD",
       G4P.ERROR );
     }
     aud_tiquets(id_tiquet,
       user,"tiquete pagado placa: "+t.getPlate()+" EE: "+ee,
       stt,true);
  }
  Ticket searchTicket(String plc){
    Ticket t=null;
    for(int i=0; i < tickets.size();i++) {
      if(tickets.get(i).getPlate().equals(plc))
        t=tickets.get(i);
    }
    return t;
  }
  @Override
  void createTicket(String plt, String ee ) {
    msqlEnt.connect();
     msqlEnt.query(
         "INSERT INTO tiquets"+
         "(fecha_init,plate,state,e_emisor)"+
         " VALUES((SELECT NOW()),"+
         "'"+plt+"',false,'"+ee+"');"
       );
      v.showMessageSuccefulDB();
      v.addItem(plt);
      initiArrayT();
      aud_tiquets(searchTicket(plt).getId(),
        ee,"tiquete creado placa: "+plt+"EE: "+ee,
        false,false);
  }
  @Override
  void deleteTicket(String plt, String user ) {
    Ticket t = searchTicket(plt);
    int id_tiquet = t.getId();
    boolean stt = t.getPay();
    String ee = t.getEquiEmisor();

    if(msqlTPM.connect())
    msqlTPM.query("delete from tiquets "+
    "where plate ='"+plt+"';");

    v.showMessageSuccefulDB();
    initiArrayT();
    aud_tiquets(id_tiquet,
      user,"tiquete borrado placa: "+plt+" EE: "+ee,
      stt,stt);
  }
  void aud_tiquets(
    int id_tiquet,
    String u,
    String d,
    boolean e_ant,
    boolean e_new)
  {
    if(msqlTPM.connect())
    msqlTPM.query(
    //println(
      "INSERT INTO aud_tiquets"+
      "(id_tiquet,date_change,user,"+
      "descript,ant_state,new_state)"+
      "VALUES("+id_tiquet+",(SELECT NOW()),'"+
      u+"','"+d+"',"+e_ant+","+e_new+");"
      );
      String log = "id_tiquet:"+id_tiquet+
        " date_change:"+getDate()+
        " descript:"+d+
        " ant_state:"+e_ant+
        " new_state:"+e_new;
      String[]  lstLog= split(log,' ');
      saveStrings("log.log",lstLog);

  }
  String getDate(){
    int dd = day();
    int mm = month();
    int yyyy = year();
    int h = hour();
    int m = minute();
    int s = second();
    String r= ""+dd+"-"+mm+"-"+yyyy+" "+h+":"+m+":"+s;
    println(r);
    return r;
  }
}
