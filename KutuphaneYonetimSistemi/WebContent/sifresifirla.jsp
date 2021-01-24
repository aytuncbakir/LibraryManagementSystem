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
	String Sifre, KullaniciAdi, Id;
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
	Id = request.getParameter("Id");
	KullaniciAdi = request.getParameter("KullaniciAdi");
	Sifre = request.getParameter("Sifre");

	
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
	     <li><a href="yoneticiislemsec.html">İŞLEMLER</a></li>
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
    	<div id="uye"><h1>Şifre Sıfırlama Sayfası:</h1><br>
		   <table>
		
		 <%
			if(!kontrolEt(KullaniciAdi))
				out.println("KullaniciAdi girilmedi!<br>");
			if(!kontrolEt(Sifre))
				out.println("Sifre girilmedi!.<br>");
			if(!kontrolEt(Id))
				out.println("ID girilmedi!.<br>");
	
	if(kontrolEt(Sifre) & kontrolEt(KullaniciAdi) & kontrolEt(Id)){
		
		DBOperations dbops = new DBOperations();
		dbops.sifreUpdate(request.getParameter("KullaniciAdi"), request.getParameter("Sifre"), Integer.parseInt(request.getParameter("Id")));	
	}else
		out.println("<a href='javascript: history.back()'>Eksik bilgilerinizi girmelisiniz<br>");
	
	%>
	
		   
		   </table>
			
       </div>
	
    
<table>


			</table>

    	
    	
		</table>


</div>
</body>
</html>


