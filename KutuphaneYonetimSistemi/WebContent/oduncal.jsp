<%
	HttpSession onemliSayfa = request.getSession(true);
	if(onemliSayfa.getAttribute("sifre")!= "gecerli")
		response.sendRedirect("uyari.html");
%>

<%@page import="DBAppsPaketi.DBOperations"	%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="net.ucanaccess.jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="utf-8"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Kütüphane Yönetim Sistemi</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function ctck()
{
var sds = document.getElementById("dum");

}
</script>

</head>

<body>

<%!
	String Ad, Id;
	public boolean kontrolEt(String girdiBilgisi)
	{
		if(girdiBilgisi == null)
			return false;
		else{
			if(girdiBilgisi.length()== 0)
				return false;
			else 
				return true;
		}
	}
%>

<% 
	Id = request.getParameter("ID");
	Ad = request.getParameter("Ad");
	
	
%>

<div id="top_links">
  

<div id="header">
	<h1>HALK KÜTÜPHANESİ<span class="style1"></span></h1>
    <h2>Kitaplar en sadık dostlardır.</h2>	
    <A href="index.html"><IMG SRC="images/home1.gif"></IMG></A>	
</div>

<div id="navigation">
     <ul>
	    <li><a href="cikis.jsp">ÇIKIŞ </a></li>
	     <li><a href="uyeislemsec.html">İŞLEMLER</a></li>
	    <li><a href="kitap.jsp">KİTAPLAR</a></li>
	    <li><a href="dergi.jsp">DERGİLER</a></li>
	    <li><a href="gazete.jsp">GAZETELER</a></li>
	    <li><a href="uyelikguncellemeformu.jsp">GÜNCELLE</a></li>
	    <li><a href="hakkimizda.jsp">HAKKIMIZDA</a></li>
	    </ul>
</div>



<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
	<td width="300" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="services"><h1>Services</h1><br>
		    <ul>
        	<li><a href="#">www.javatpoint.com</a></li>
            <li><a href="#">www.javacstpoint.com </a></li>
            <li><a href="#">www.javatpoint.com/forum.jsp</a></li>
            </ul>
			
       </div>
	</td>
	
	<td width="300" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="uye"><h1>Üye Girişi :</h1><br>
		   <table>
		   
	<%
		if(!kontrolEt(Ad))
			out.println("Ad girilmedi!<br>");
		if(!kontrolEt(Id))
			out.println("ID girilmedi!.<br>");

		if(kontrolEt(Ad) & kontrolEt(Id)){
			
			Connection baglanti = null ;
			PreparedStatement sorgu = null;
			int id = Integer.parseInt( request.getParameter("ID"));
			String UrunAd = request.getParameter("Ad");
			String kullanici = "";
			String turID = "";
			String tur = request.getParameter("Turu");
			String tur1 = tur;
			if(tur.equals("Kitap")){
				tur = "Kitaplar";
				turID = "KitapID";
			}else if(tur.equals("Dergi")){
				tur = "Dergiler";
				turID = "DergiID";
			}
			else if(tur.equals("Gazete")){
				tur = "Gazeteler";
				turID = "GazeteID";
			}

			DBOperations dbops = new DBOperations();
			boolean mevcutmu = dbops.kitapkutuphanedemi(UrunAd, id, tur1);
			boolean varmi = dbops.boylebirurunvarmi(UrunAd, id, tur1);
			
		if(mevcutmu == true && varmi == true){
			String sqlSorgu =  "UPDATE  "+tur+" SET Mevcutmu = ? WHERE "+turID+"= ?";
			try{
				Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
				String dbURL = "jdbc:ucanaccess://C:/Users/HAB/DB/kutuphane.accdb" ;
				baglanti = DriverManager.getConnection(dbURL,"","");
				sorgu = baglanti.prepareStatement(sqlSorgu);
			
				sorgu.setBoolean(1,false);
				sorgu.setInt(2,id);
				sorgu.executeUpdate();
				baglanti.close();
				
				HttpSession islemler = request.getSession(true);
				kullanici = (islemler.getAttribute("KullaniciAdi")).toString();
				islemler.setAttribute("sifre", "gecerli");
				islemler.setAttribute("KullaniciAdi", kullanici);
		
				
			
			
				//out.println(kullanici + id + tur);
				int sonuc = dbops.insert(mevcutmu,varmi,kullanici,UrunAd, id, tur1, "15");
				if(sonuc == 0)
					out.println("Seçtiğiniz ürün mevcut değil."+"<br>");
				else if(sonuc == 1)
					out.println("Ödünç süresi 15 gündür."+"<br>");
				
				out.println("<br>"+"<a href = 'uyeislemsec.html'>GERİ DÖN</a>");
			}	
			catch(ClassNotFoundException ex){
				out.println("class bulunamadi olustu...");
				ex.printStackTrace();
			}
			catch(SQLException ex1){
				out.println("oduncal SQL Hata olustu...");
			}
			
			}else
				out.println("<a href='javascript: history.back()'>Kitap mevcut değil!<br>");
		}else
			out.println("<a href='javascript: history.back()'>Eksik bilgilerinizi girmelisiniz<br>");
		
	%>
	
		   
		   </table>
			
       </div>
	</td>
    
    <td width="1200" valign="top">
    	
    	

<table>


			</table>

    	
    	
		</table>



</div>
</body>
</html>

