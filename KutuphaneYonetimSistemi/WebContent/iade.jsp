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
		
		String sqlSorgu =  "UPDATE  "+tur+" SET Mevcutmu = ? WHERE "+turID+"= ?";
		try{
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			String dbURL = "jdbc:ucanaccess://C:/Users/HAB/DB/kutuphane.accdb" ;
			baglanti = DriverManager.getConnection(dbURL,"","");
			sorgu = baglanti.prepareStatement(sqlSorgu);
		
			sorgu.setBoolean(1,true);
			sorgu.setInt(2,id);
			
			sorgu.executeUpdate();
			HttpSession islemler = request.getSession(true);
			kullanici = (islemler.getAttribute("KullaniciAdi")).toString();
			islemler.setAttribute("sifre", "gecerli");
			islemler.setAttribute("KullaniciAdi", kullanici);
	
			baglanti.close();
			
			
			DBOperations dbops = new DBOperations();
			//out.println(kullanici + id + tur);
			dbops.insert(kullanici,UrunAd, id, tur1);
			
			out.println("Teslim ettiniz"+"<br>");
			
			out.println("<br>"+"<a href = 'uyeislemsec.html'>GERİ DÖN</a>");
		}	
		catch(ClassNotFoundException ex){
			out.println("class bulunamadi olustu...");
			ex.printStackTrace();
		}
		catch(SQLException ex1){
			out.println("SQL Hata olustu...");
		}
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



