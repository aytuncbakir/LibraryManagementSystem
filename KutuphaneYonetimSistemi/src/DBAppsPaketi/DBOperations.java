package DBAppsPaketi;
import java.sql.*;
import java.util.ArrayList;
import kisiler.SistemKullanicisi;
import net.ucanaccess.jdbc.*;

public class DBOperations {

	
	
	public Connection baglan ()
	{
		Connection baglanti = null ;
		try{
			
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			String dbURL = "jdbc:ucanaccess://C:/Users/HAB/DB/kutuphane.accdb" ;
			baglanti = DriverManager.getConnection(dbURL,"","");
			return baglanti;
		}catch(ClassNotFoundException ex){
			System.out.println("class bulunamadi olustu...");
			ex.printStackTrace();
		}
		catch(SQLException ex1){
			ex1.printStackTrace();
			System.out.println("SQL2 Hata olustu...");
		}
		
		return baglanti;
		
	}
	
	public void kapat(Connection baglanti)throws SQLException{
			baglanti.close();
	}

	public boolean yoneticimi (String Ad) throws SQLException{
		
		Connection baglantim = null ;
		String adi = "aa";
		String sifre = "12";
		
		String sqlSorgum ="SELECT * FROM Yoneticiler  WHERE Ad="+"'"+adi+"'"+" AND Sifre="+"'"+sifre+"'";
		baglantim = baglan();
		Statement sorgum = baglantim.createStatement();
		ResultSet sonucVeri = sorgum.executeQuery(sqlSorgum);
			//System.out.println(sqlSorgum);
		//	System.out.println("BURADAYIMMM");
			//System.out.println(sonucVeri.getRow());
			if(sonucVeri.getRow() == 0){
				sonucVeri.close();
				kapat(baglantim);
				return false;
			}
			if(sonucVeri.getRow() == 1){
				sonucVeri.close();
				kapat(baglantim);
				return true;
				}
		return false;
	}
	
	public void updateKullanici  (String eskikullanici,String kullanici) throws SQLException{
		
		Connection baglanti = null ;
		PreparedStatement sorgu = null;
		String sqlSorgu =  "UPDATE  ODUNCKAYIT SET UyeAD = ? WHERE UyeAD = ?";
		baglanti = baglan();
		sorgu = baglanti.prepareStatement(sqlSorgu);
		sorgu.setString(1,kullanici);
		sorgu.setString(2,eskikullanici);
		sorgu.executeUpdate();
		kapat(baglanti);
	
	}
	
	public boolean insert(String adi ,String sifre)
	{
		try{
		String sqlSorgu =  "INSERT INTO Uyeler (Ad,Sifre) VALUES(?,?)";
		
			Connection baglanti = baglan();
			PreparedStatement sorgu = baglanti.prepareStatement(sqlSorgu);
			sorgu.setString(1,adi);
			sorgu.setString(2,sifre);
				
			sorgu.executeUpdate();
			kapat(baglanti);
			return true;
			//out.println("<a href = 'uyegiris.jsp'>Login</a> sayfasýndan giriþ yapabilirsiniz.");
		}
		catch(SQLException ex1){
			ex1.printStackTrace();
			//out.println("SQL Hata olustu...");
		}
		return false;
	}
	
	public  int  insert(boolean mevcutmu,boolean varmi, String UyeAd,String UrunAd, int UrunID, String Turu, String Tarih ) throws SQLException {
		
		
		if(mevcutmu == true && varmi == true){
			Connection baglanti = null ;
			String sqlSorgu =  "INSERT INTO ODUNCKAYIT (UyeAd,UrunAd,UrunID,Turu,Tarih) VALUES(?,?,?,?,?)";
			baglanti = baglan();
			PreparedStatement sorgu = baglanti.prepareStatement(sqlSorgu);
								
			sorgu.setString(1, UyeAd);
			sorgu.setString(2, UrunAd);
			sorgu.setInt(3, UrunID);
			sorgu.setString(4,Turu);
			sorgu.setString(5,Tarih);
			sorgu.executeUpdate();
			kapat(baglanti);
				return 1;	
		}
		return 0;
	}
	
	public  void  inserturun(ArrayList <String> aList,int secenek) throws SQLException{
		
		Connection baglanti = null ;
		String sqlSorgu ="";
		if(secenek == 1)
			sqlSorgu =  "INSERT INTO KITAPLAR (ISBN,Kitapadi,Turu,Rafno,Icerik,Yazar,Mevcutmu) VALUES(?,?,?,?,?,?,?)";
		else if(secenek==2)
			sqlSorgu =  "INSERT INTO DERGILER (Dergiadi,Turu,Rafno,Icerik,Mevcutmu) VALUES(?,?,?,?,?)";
		else if(secenek==3)
			sqlSorgu =  "INSERT INTO GAZETELER (Gazeteadi,Turu,Rafno,Icerik,Mevcutmu) VALUES(?,?,?,?,?)";
	
		//System.out.println(sqlSorgu);
		baglanti = baglan();
		PreparedStatement sorgu = baglanti.prepareStatement(sqlSorgu);
			
		boolean mevcut = true;
		//System.out.println("Liste Boyutu"+aList.size());
		if(secenek == 1){
			int i = 0;
			while(i < aList.size()){
				sorgu.setString(1, aList.get(i++));
				sorgu.setString(2, aList.get(i++));
				sorgu.setString(3, aList.get(i++));
				sorgu.setInt(4, Integer.parseInt(aList.get(i++)));
				sorgu.setString(5,aList.get(i++));
				sorgu.setString(6, aList.get(i++));
				sorgu.setBoolean(7, mevcut);
				sorgu.executeUpdate();
			}
				//System.out.println("Liste Boyutu");
			//	System.out.println ("3"+isbn + ad+ rafno+ tur+icerik+ yazar );
		}else if(secenek==2){
			int i = 0;
			while(i < aList.size()){
				sorgu.setString(1, aList.get(i++));
				sorgu.setString(2, aList.get(i++));
				sorgu.setInt(3, Integer.parseInt(aList.get(i++)));
				sorgu.setString(4,aList.get(i++));
				sorgu.setBoolean(5, mevcut);
				sorgu.executeUpdate();
			}
		}else if(secenek==3){	
			int i = 0;
			while(i < aList.size()){
				sorgu.setString(1, aList.get(i++));
				sorgu.setString(2, aList.get(i++));
				sorgu.setInt(3, Integer.parseInt(aList.get(i++)));
				sorgu.setString(4,aList.get(i++));
				sorgu.setBoolean(5, mevcut);
				sorgu.executeUpdate();
			}
		}	
		kapat(baglanti);	
	}// endof insert urun
	
	public  boolean  inserturun(String isbn,String ad, int rafno, String tur, String icerik, String yazar,int secenek ) throws SQLException{
	
		Connection baglanti = null ;
		String sqlSorgu ="";
		if(secenek == 1)
			sqlSorgu =  "INSERT INTO KITAPLAR (ISBN,Kitapadi,Turu,Rafno,Icerik,Yazar,Mevcutmu) VALUES(?,?,?,?,?,?,?)";
		else if(secenek==2)
			sqlSorgu =  "INSERT INTO DERGILER (Dergiadi,Turu,Rafno,Icerik,Mevcutmu) VALUES(?,?,?,?,?)";
		else if(secenek==3)
			sqlSorgu =  "INSERT INTO GAZETELER (Gazeteadi,Turu,Rafno,Icerik,Mevcutmu) VALUES(?,?,?,?,?)";	
		//	System.out.println(sqlSorgu);
		baglanti = baglan();
		PreparedStatement sorgu = baglanti.prepareStatement(sqlSorgu);
		boolean mevcut = true;
		if(secenek == 1){
		//	System.out.println("BURADAYIM");
		//	System.out.println ("2"+isbn + ad+ rafno+ tur+icerik+ yazar );
			sorgu.setString(1, isbn);
			sorgu.setString(2, ad);
			sorgu.setString(3, tur);
			sorgu.setInt(4, rafno);
			sorgu.setString(5,icerik);
			sorgu.setString(6, yazar);
			sorgu.setBoolean(7, mevcut);
			sorgu.executeUpdate();
			kapat(baglanti);
			return true;
		//	System.out.println ("3"+isbn + ad+ rafno+ tur+icerik+ yazar );
		}else if(secenek==2){
			sorgu.setString(1, ad);
			sorgu.setString(2, tur);
			sorgu.setInt(3, rafno);
			sorgu.setString(4,icerik);
			sorgu.setBoolean(5, mevcut);
			sorgu.executeUpdate();
			kapat(baglanti);
			return true;
		}else if(secenek==3){
			sorgu.setString(1, ad);
			sorgu.setString(2, tur);
			sorgu.setInt(3, rafno);
			sorgu.setString(4,icerik);
			sorgu.setBoolean(5, mevcut);
			sorgu.executeUpdate();
			kapat(baglanti);
			return true;
		}
		kapat(baglanti);
		return false;
	}//endofinserturun
	
	
	public  void  delete(String UyeAd,String UrunAd, int UrunID, String Turu) throws SQLException{
		
		Connection baglanti = null ;
		String sqlSorgu =  "DELETE FROM ODUNCKAYIT  WHERE UyeAD = ? AND UrunAd = ? AND UrunID = ? AND Turu = ?";
		baglanti = baglan();
		PreparedStatement sorgu = baglanti.prepareStatement(sqlSorgu);
		sorgu.setString(1, UyeAd);
		sorgu.setString(2, UrunAd);
		sorgu.setInt(3, UrunID);
		sorgu.setString(4,Turu);
		sorgu.executeUpdate();
		kapat(baglanti);
	}//endofdelete
	
	public  void  insert(String UyeAd,String UrunAd, int UrunID, String Turu) throws SQLException{
		
		Connection baglanti = null ;
		String sqlSorgu =  "INSERT INTO IADEKAYIT (UyeAd,UrunAd,UrunID,Turu) VALUES(?,?,?,?)";
		baglanti = baglan();
		PreparedStatement sorgu = baglanti.prepareStatement(sqlSorgu);
		sorgu.setString(1, UyeAd);
		sorgu.setString(2, UrunAd);
		sorgu.setInt(3, UrunID);
		sorgu.setString(4,Turu);
		sorgu.executeUpdate();
		kapat(baglanti);
		delete( UyeAd, UrunAd,  UrunID,  Turu); // üyenin üzerinden düþ
	}
	
	public  boolean  kitapkutuphanedemi(String UrunAd,int UrunID,String Turu) throws SQLException{
		
		String tur = "";
		if(Turu.equals("Kitap")){
			tur = "Kitaplar";
			
		}else if(Turu.equals("Dergi")){
			tur = "Dergiler";
		}
		else if(Turu.equals("Gazete")){
			tur = "Gazeteler";	
		}
		Connection baglanti = null ;
		String sqlSorgu =  "SELECT Mevcutmu FROM "+tur+" WHERE "+Turu+"adi"+"="+"'"+UrunAd+"'"+" AND "+Turu+"ID"+"="+"'"+UrunID+"'";
		System.out.println();System.out.println(sqlSorgu);System.out.println();
		baglanti = baglan();
		Statement sorgu = baglanti.createStatement();
		ResultSet sonucVeriler = sorgu.executeQuery(sqlSorgu);
		boolean mevcutmu = false;
		while(sonucVeriler.next()){
				mevcutmu=sonucVeriler.getBoolean("Mevcutmu");
				return mevcutmu;
		}
		
		sonucVeriler.close();
		kapat(baglanti);
		return mevcutmu;
	}
	
	public  boolean  boylebirurunvarmi(String UrunAd,int UrunID,String Turu) throws SQLException{
		
		String tur = "";
		if(Turu.equals("Kitap")){
			tur = "Kitaplar";
			
		}else if(Turu.equals("Dergi")){
			tur = "Dergiler";
		}
		else if(Turu.equals("Gazete")){
			tur = "Gazeteler";	
		}
		Connection baglanti = null ;
		String sqlSorgu =  "SELECT Mevcutmu FROM "+tur+" WHERE "+Turu+"adi"+"="+"'"+UrunAd+"'"+" AND "+Turu+"ID"+"="+"'"+UrunID+"'";
		baglanti = baglan();
		Statement sorgu = baglanti.createStatement();
		ResultSet sonucVeriler = sorgu.executeQuery(sqlSorgu);
		boolean varmi = false;
		while(sonucVeriler.next()){
				varmi = true;
				return varmi;
		}
		
		sonucVeriler.close();
		kapat(baglanti);
		return varmi;
	}
	
	public SistemKullanicisi Uyebilgiler (String adi)throws SQLException{
		

		ResultSet sonucVeriler = null;
		String sqlSorgu = "";
		
		SistemKullanicisi kisi = new SistemKullanicisi();
		sqlSorgu=  "SELECT * FROM Uyeler WHERE Ad="+"'"+adi+"'";;
		System.out.println(sqlSorgu);
		Connection baglanti = null ;
		baglanti = baglan();
		Statement sorgu = baglanti.createStatement();
		sonucVeriler = sorgu.executeQuery(sqlSorgu);
		while(sonucVeriler.next()){
				kisi.setId(sonucVeriler.getInt("UyeID"));
				kisi.setAdi(sonucVeriler.getString("Ad"));
				kisi.setSifre(sonucVeriler.getString("Sifre"));
				kisi.setYoneticimi(sonucVeriler.getBoolean("Yoneticimi"));
			
			}
		System.out.println(kisi.getAdi());
		System.out.println(kisi.getSifre());
		kisi.setKisi(kisi);
		sonucVeriler.close();
		kapat(baglanti);
		return kisi;
	}
	public SistemKullanicisi Uyebilgiler (String adi,String sifre)throws SQLException{
		

		ResultSet sonucVeriler = null;
		String sqlSorgu = "";
		
		SistemKullanicisi kisi = new SistemKullanicisi();
		sqlSorgu=  "SELECT * FROM Uyeler WHERE Ad="+"'"+adi+"'"+" AND Sifre="+"'"+sifre+"'";
		System.out.println(sqlSorgu);
		Connection baglanti = null ;
		baglanti = baglan();
		Statement sorgu = baglanti.createStatement();
		sonucVeriler = sorgu.executeQuery(sqlSorgu);
		while(sonucVeriler.next()){
				kisi.setId(sonucVeriler.getInt("UyeID"));
				kisi.setAdi(sonucVeriler.getString("Ad"));
				kisi.setSifre(sonucVeriler.getString("Sifre"));
				kisi.setYoneticimi(sonucVeriler.getBoolean("Yoneticimi"));
			
			}
		System.out.println(kisi.getAdi());
		System.out.println(kisi.getSifre());
		kisi.setKisi(kisi);
		sonucVeriler.close();
		kapat(baglanti);
		return kisi;
	}
	
	public ArrayList <String> AramaListe (String ad, String yazar, String tur) throws SQLException{
		
		
		Connection baglanti = null ;
		Statement satir = null;
		ResultSet sonucVeriler= null;
		ArrayList <String> aList = new ArrayList <String> ();
		String sqlSorgu = "";
		
		
		baglanti = baglan();
		int secenek = 0;
		if(tur.equals("Kitap")){
			tur = "";
			
			sqlSorgu =  "SELECT * FROM  Kitaplar WHERE Kitapadi="+"'"+ad+"'"+" AND Yazar="+"'"+yazar+"'";
			secenek =1;
		}else if(tur.equals("Dergi")){
			tur = "Dergiler";
			
			sqlSorgu =  "SELECT * FROM  Dergiler WHERE Dergiadi="+"'"+ad+"'";
		
			secenek =2;
		}
		else if(tur.equals("Gazete")){
			tur = "Gazeteler";
			
			sqlSorgu =  "SELECT * FROM  Gazeteler WHERE Gazeteadi="+"'"+ad+"'";
			secenek = 3;
		}
		satir = baglanti.createStatement();
		sonucVeriler = satir.executeQuery(sqlSorgu);
		
		while(sonucVeriler.next())	{	
			
			if(secenek==1){
				aList.add(sonucVeriler.getString("KitapID"));
				aList.add(sonucVeriler.getString("Kitapadi"));
				aList.add(sonucVeriler.getString("Yazar"));
				aList.add(sonucVeriler.getString("ISBN"));
			}else if(secenek==2){
				aList.add(sonucVeriler.getString("DergiID"));
				aList.add(sonucVeriler.getString("Dergiadi"));
			}
			else if(secenek==3){
				aList.add(sonucVeriler.getString("GazeteID"));
				aList.add(sonucVeriler.getString("Gazeteadi"));
			}
			
			aList.add(sonucVeriler.getString("Turu"));
			aList.add(sonucVeriler.getString("Icerik"));
			aList.add(sonucVeriler.getString("Rafno"));
			aList.add(sonucVeriler.getString("Mevcutmu"));
			
		}
		sonucVeriler.close();
		kapat(baglanti);
		
		return aList;
	}	
	
		
	
	public ArrayList <String> odunclistele (String UyeAd) throws SQLException{
		
		Connection baglanti = null ;
		String ad = null, urunad = null, tur = null,tarih;
		String  urunid = null, oduncid = null;
		ArrayList <String> odunclist = new ArrayList<String>();		
		String sqlSorgu =  "SELECT * FROM ODUNCKAYIT WHERE UyeAd="+"'"+UyeAd+"'";
		baglanti = baglan();
		Statement sorgu = baglanti.createStatement();
		ResultSet sonucVeriler = sorgu.executeQuery(sqlSorgu);
		while(sonucVeriler.next()){	
			oduncid=  sonucVeriler.getString("OduncID");
			ad=sonucVeriler.getString("UyeAd");
			urunad=sonucVeriler.getString("UrunAd");
			urunid= sonucVeriler.getString("UrunID");
			tur=sonucVeriler.getString("Turu");
			tarih=sonucVeriler.getString("Tarih");
			odunclist.add(oduncid);
			odunclist.add(ad);
			odunclist.add(urunad);
			odunclist.add(urunid);
			odunclist.add(tur);
			odunclist.add(tarih);
		}
		kapat(baglanti);
		return odunclist;
		
	}// EOF odunclistele
	
	
	public ArrayList <String> uyelistele ()throws SQLException{
		
		Connection baglanti = null ;
		ArrayList <String> kisilist = new ArrayList<String>();	
		String sqlSorgu =  "SELECT * FROM UYELER";
		baglanti =baglan();
		Statement sorgu = baglanti.createStatement();
		ResultSet sonucVeriler = sorgu.executeQuery(sqlSorgu);
		while(sonucVeriler.next()){
			kisilist.add( sonucVeriler.getString("UyeID"));
			kisilist.add(sonucVeriler.getString("Ad"));
			kisilist.add(sonucVeriler.getString("Sifre"));
		}
		kapat(baglanti);
		return kisilist;
	}
	
	public void sifreUpdate(String ad, String sifre, int id) throws SQLException{
		
			Connection baglanti = null ;
			PreparedStatement sorgu = null;
			baglanti = baglan();
			String sqlSorgu ="UPDATE  Uyeler SET Ad = ?, Sifre = ? WHERE UyeID = ?";	
			sorgu = baglanti.prepareStatement(sqlSorgu);
			sorgu.setString(1,ad);
			sorgu.setString(2,sifre);
			sorgu.setInt(3,id);
			sorgu.executeUpdate();
	
		kapat(baglanti);
			
		
	}
	
public ArrayList <String> cezaHesapla () throws SQLException{
		
		Connection baglanti = null ;
		String ad = null, urunad = null, tur = null,tarih;
		String  urunid = null, oduncid = null;
		ArrayList <String> cezalist = new ArrayList<String>();		
		String sqlSorgu =  "SELECT UyeAd,Tarih FROM ODUNCKAYIT";
		baglanti = baglan();
		Statement sorgu = baglanti.createStatement();
		ResultSet sonucVeriler = sorgu.executeQuery(sqlSorgu);
		while(sonucVeriler.next()){	

			ad=sonucVeriler.getString("UyeAd");
			tarih=sonucVeriler.getString("Tarih");
			cezalist.add(ad);
			cezalist.add(tarih);
		}
		kapat(baglanti);
		return cezalist;
		
	}// EOF odunclistele

}// end of Class
