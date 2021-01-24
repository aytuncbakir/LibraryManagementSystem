<%
	HttpSession onemliSayfa = request.getSession(true);
	if(onemliSayfa.getAttribute("sifre")!= "gecerli")
		response.sendRedirect("uyari.html");
%>

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

</div>

<div id="navigation">
    <ul>
     <li><a href="cikis.jsp">ÇIKIŞ</a></li>
    <li><a href="uyeislemsec.html">iŞLEMLER</a></li>
    <li><a href="kitap.jsp">KİTAPLAR</a></li>
    <li><a href="dergi.jsp">DERGİLER</a></li>
    <li><a href="gazete.jsp">GAZETELER</a></li>
    <li><a href="uyelikguncellemeformu.jsp">GÜNCELLE</a></li>
    <li><a href="hakkimizda.jsp">HAKKIMIZDA</a></li>
    </ul>
</div>


   

<table style="width:897px; background:#FFFFFF; margin:0 auto;">

	
	<tr align="justify">
	<td width="200" valign="top" style="border-right:#666666 1px dotted;">
    	<div id=""><br>
       </div>
	</td>
	<td width="350" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="services"><br>
			  <p> Binlerce kitap sizi beklemekte, hemen üye olun. </p>
	  
       </div>
	</td>
	<td width="200" valign="top" style="border-right:#666666 1px dotted;">
    	<div id=""><br>
       </div>
	</td>
	</tr>
	
	
</table>

<div id="footer_top">
  <div id="footer_navigation">
  

  </div>
  
  <div id="footer_copyright" >
 
    	    <center><img  alt="business"  width="196" height="106"></center><br>
		  
  Copyright © Aytunç Bakır</div>
</div>

<script type="text/javascript">
document.onload = ctck();
</script>
</div>

</body>
</html>
