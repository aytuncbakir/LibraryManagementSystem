<%@page import="java.util.ArrayList"%>
<%@page import="DBAppsPaketi.DBOperations"%>
<%
	HttpSession onemliSayfa = request.getSession(true);
	if(onemliSayfa.getAttribute("sifre")!= "gecerli")
		response.sendRedirect("uyari.html");
%>
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
    <li><a href="ziyaretci.jsp">ZİYARETÇİ</a></li>
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
    	<div id="uye"><h1>Listeleme sonucu:</h1><br>
		   <table>
		   
	 		
	<%	int modul = 1;
		String fonRengi ="";
		Connection baglanti = null ;
		Statement satir = null;
		ResultSet sonucVeriler = null;
		
		HttpSession simdiki = request.getSession(true);
		String kadi = ((simdiki.getAttribute("KullaniciAdi")).toString()).trim();
		
		ArrayList <String> odunc = new ArrayList<String>();
	
		try{
			String gonderValue = request.getParameter("Gonder");
			if(gonderValue.equals("OduncListele")){
				DBOperations dbops = new DBOperations();
				odunc = dbops.odunclistele(kadi);
				int i = 0;
				String oid = "" ,uadi = "",uradi = "",urid = "" ,tur = "", tarih = "";
				System.out.println(odunc.size());
				
	%>
		
				<tr>
				<td width="60"><b>ÖdünçID</b></td>
				<td width="100"><b>ÜyeAdı</b></td>
				<td width="100"><b>Ürün</b></td>
				<td width="150"><b>ÜrünID</b></td>
				<td width="200"><b>Turu</b></td>
				<td width="200"><b>Teslim</b></td>
				</tr>
			
			<% 	
				 while(i < odunc.size()-1){
						if((modul%2)==1)
							fonRengi = "#dddddd";
						else
							fonRengi = "#eeeeee";
			
						oid = odunc.get(i);
						i++;
						uadi = odunc.get(i);
						i++;
						uradi = odunc.get(i);
						i++;
						urid = odunc.get(i);
						i++;
						tur = odunc.get(i);
						i++;
						tarih = odunc.get(i);
						i++;
			%>
						<tr bgcolor="<%=fonRengi%>">
						<td><%=oid%></td>
						<td><%=uadi%></td>
						<td><%=uradi%></td>
						<td><%=urid%></td>
						<td><%=tur%></td>
						<td><%=tarih%></td>
						
						</tr>
				
			<% 	
				modul++;
				 }
			
			}else{
			
				Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
				String dbURL = "jdbc:ucanaccess://C:/Users/HAB/DB/kutuphane.accdb" ;
				baglanti = DriverManager.getConnection(dbURL,"","");
				satir = baglanti.createStatement();
				String sqlsorgu = null;
				
				if(gonderValue.equals("Klistele")){
					sqlsorgu = "SELECT * FROM Kitaplar";
				}else 	if(gonderValue.equals("Glistele")){
					sqlsorgu = "SELECT * FROM Gazeteler";
				}else 	if(gonderValue.equals("Dlistele")){
					sqlsorgu = "SELECT * FROM Dergiler";
				}
					
				sonucVeriler = satir.executeQuery(sqlsorgu);
			
			
	%>


			<tr bgcolor="<%=fonRengi%>">
			<td width="60"><b>Rafno</b></td>
			<td width="100"><b>Kitapadi</b></td>
			<td width="100"><b>Turu</b></td>
			<td width="100"><b>UrunID</b></td>
			<td width="150"><b>Yazar</b></td>
			<td width="200"><b>Icerik</b></td>
			<td width="200"><b>Mevcutmu</b></td>
			</tr>
			
		<%
			
		String adi = "" ,Yazar = "" ,Turu = "", Icerik = "";
		String id ="";
		boolean Mevcutmu= false;
		int Rafno = 0;
	
		while(sonucVeriler.next()){
			if((modul%2)==1)
				fonRengi = "#dddddd";
			else
				fonRengi = "#eeeeee";
			
			if(gonderValue.equals("Klistele")){
				Rafno = sonucVeriler.getInt("Rafno");
				adi=sonucVeriler.getString("Kitapadi");
				Yazar=sonucVeriler.getString("Yazar");
				Turu = sonucVeriler.getString("Turu");
				Icerik=sonucVeriler.getString("Icerik");
				id = sonucVeriler.getString("KitapID");
				Mevcutmu=sonucVeriler.getBoolean("Mevcutmu");
			}else 	if(gonderValue.equals("Dlistele")){
				Rafno = sonucVeriler.getInt("Rafno");
				adi=sonucVeriler.getString("Dergiadi");
				Turu = sonucVeriler.getString("Turu");
				id = sonucVeriler.getString("DergiID");
				Icerik=sonucVeriler.getString("Icerik");
				Mevcutmu=sonucVeriler.getBoolean("Mevcutmu");
			}else 	if(gonderValue.equals("Glistele")){
				Rafno = sonucVeriler.getInt("Rafno");
				id = sonucVeriler.getString("GazeteID");
				adi=sonucVeriler.getString("Gazeteadi");
				Yazar="";
				Turu = sonucVeriler.getString("Turu");
				Icerik=sonucVeriler.getString("Icerik");
				Mevcutmu=sonucVeriler.getBoolean("Mevcutmu");
			}
	%>
		
		<tr bgcolor="<%=fonRengi%>">
		<td><%=Rafno%></td>
		<td><%=adi%></td>
		<td><%=Turu%></td>
		<td><%=id%></td>
		<td><%=Yazar%></td>
		<td><%=Icerik%></td>
		<td><%=Mevcutmu%></td>
		
		</tr>
	<% 
			modul++;
			}
		
		sonucVeriler.close();
		baglanti.close();
		}
		
		
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
