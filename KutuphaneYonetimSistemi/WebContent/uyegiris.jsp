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
<meta http-equiv="Content-Type" >
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
	       	<li><a href="uyegiris.jsp">ÜYE GİRİŞ </a></li>
		    <li><a href="yonetici.jsp">YÖNETİCİ</a></li>
		    <li><a href="kitap.jsp">KİTAPLAR</a></li>
		    <li><a href="dergi.jsp">DERGİLER</a></li>
		    <li><a href="gazete.jsp">GAZETELER</a></li>
		    <li><a href="ziyaretci.jsp">ZİYARETÇİ</a></li>
		  	<li><a href="hakkimizda.jsp">HAKKIMIZDA</a></li>
   	 	</ul>    
	</div>

<%! String kullaniciAdi= "", sifre = "";%>
	
	<% 
	Cookie[] cookieler = request.getCookies();
	for(int i= 0; i<cookieler.length;i++){
		Cookie cookieAktif = cookieler[i];
		String isimAktif = cookieAktif.getName();
		String degerAktif = cookieAktif.getValue();
		if("KullaniciAdi".equals(isimAktif) & (degerAktif != null))
			kullaniciAdi = degerAktif;
		else if("Sifre".equals(isimAktif) & (degerAktif != null))
			sifre = degerAktif;
		
	}
%>

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
	
	<td width="600" valign="top" style="border-right:#666666 1px dotted;">
    	
    	<div id="uye"><h1>Giriş Yapınız:</h1><br>
		   
		   		<form action="uyegirisi.jsp" name="basitBirForm" method="post">
	
					<table>
					<tr>
						<td><label> Kullanıcı Adı:</label></td>
						<td> <input type="text" name ="KullaniciAdi" value ="<%=kullaniciAdi%>"size="20" > </td>
					</tr>
					
					<tr>
						<td><label>Şifre:</label></td>
						<td> <input type="password" name ="Sifre" value ="<%=sifre%>"size="20" > </td>
					</tr>
					
					<tr>
					<td>Beni hatirla!:<input type="checkbox" name="Hatirlatma" value ="secili" checked ="checked"></td>
					<td>Yönetici:<input type="checkbox" name="Yonetici"></td>
					
					</tr>
					
					<tr>
						<td> &nbsp;</td>
						<td>
								<input type="submit" name="Gonder" value="Giris" size="12">
								<input type="reset" name="Sil" value="Sil"  size="12">
						</td>
					</tr>
					
					<tr>
						<td> &nbsp;</td>
						<td> <a href ="uyekayit.html">Üye olmak</a> için tıklayınız. </td>
					</tr>
				</table>
			</form>
		 </div>
	</td>
    
    <td width="400" valign="top">
    	<div>
		<h3>her hasalmdlsdodsjfdklmfldkfj</h3>
	</div>
    </td>
    	
</table>

	<div>
		<h3>DÄ°VÄ°MDE DÄ°VÄ°M Ä°ÅTE BENÄ°M DÄ°VÄ°M</h3>
	</div>
 
</div>

</body>
</html>

