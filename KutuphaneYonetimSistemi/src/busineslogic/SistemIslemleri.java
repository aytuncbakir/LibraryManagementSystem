package busineslogic;

import java.sql.SQLException;
import java.util.ArrayList;

import DBAppsPaketi.DBOperations;
import kisiler.SistemKullanicisi;

public class SistemIslemleri {

	public SistemKullanicisi Login(String adi, String sifre)
	{
		DBOperations dbops = new DBOperations();
		SistemKullanicisi sk = null;
		try {
			sk = dbops.Uyebilgiler(adi, sifre);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sk;
		
	}
	
	public ArrayList <String> Arama (String ad, String yazar, String tur){
		DBOperations dbops = new DBOperations();
		ArrayList <String> sonucListe = null;
		try {
			 sonucListe =  dbops.AramaListe(ad, yazar, tur);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sonucListe;
		
	}
}
