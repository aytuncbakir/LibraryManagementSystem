<%@page import="kisiler.SistemKullanicisi"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DBAppsPaketi.DBOperations"%>

<%
	HttpSession onemliSayfa = request.getSession(true);
	if(onemliSayfa.getAttribute("sifre")!= "gecerli")
		response.sendRedirect("uyari.html");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="utf-8"%>
    <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="net.ucanaccess.jdbc.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

	<%
		
		HttpSession islemler = request.getSession(true);
		String kullanici = (islemler.getAttribute("KullaniciAdi")).toString();
		SistemKullanicisi sk = null  ;
		DBOperations dbops = new DBOperations();
		sk = dbops.Uyebilgiler(kullanici);
	
		int dbid =  sk.getId();
		String dbadi= sk.getAdi();
		String dbsifre= sk.getSifre();
		String yoneticimiyim =""; 
		if(sk.isYoneticimi())
			yoneticimiyim = "true";
		else
			yoneticimiyim = "false";
	
		
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
    	
    	<div id="uye"><h1>Bilgi Güncelleme:</h1><br>
		   
		   		<form action="uyelikguncelle.jsp?id=<%=dbid%>" method="post">
					<table>
						<tr>
							<td><input type="text" name="Ad" size="25" value ="<%=dbadi%>"></td>
						</tr>
						
						<tr>
							<td><input type="password" name="Sifre" size="25" value ="<%=dbsifre%>"></td>
						</tr>
						
						<tr>
							<td><input type="text" name="KullaniciTur" size="25" value = "<%=yoneticimiyim%>"></td>
						</tr>				
					</table>
		<br>
		<input type="submit" value ="Bilgilerimi Güncelle">
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
		<h3>DİVİMDE DİVİM İŞTE BENİM DİVİM</h3>
	</div>
 
</div>
	
	
	

	
	

</body>
</html>


