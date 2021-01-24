package FileAppsPaketi;

import java.io.BufferedReader;
import java.io.*;
import java.util.ArrayList;

public class FileOperations {
	
	public ArrayList <String> dosyadanyukle(String dosyayolu, int secenek){
			try{
				
				
				
				FileReader okuyucu  = new FileReader(dosyayolu); // biz yeri söyledik
				BufferedReader okumaTamponu = new BufferedReader(okuyucu);
				ArrayList <String> aList = new ArrayList<String>();
				String satir = okumaTamponu.readLine();
				int i ;
				String[] str = null; 
				while(satir != null){
					//out.println(satir+"<br>");
					i = 0;
					str = satir.split(",");
					while(i < str.length){
						
						aList.add(str[i]);
						//System.out.println(str[i]);
						i++;
					}
					str = null;
					satir = okumaTamponu.readLine();
				}
				okumaTamponu.close();	
				
				return aList;
				
				
			}catch(FileNotFoundException ex){
				System.out.println("Hata olustu...!");
			}
			catch(IOException ex1){
				System.out.println("Hata olustu...!");
			}
			return null;
		
	}
}
