<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="utf-8"%>
 <%@ page import="java.io.*" %>
<%@page import="java.io.IOException"%>
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
    <li><a href="uyegiris.jsp">ÜYE GİRİŞİ </a></li>
    <li><a href="uyeislemsec.html">İŞLEMLER</a></li>
    <li><a href="kitap.jsp">KİTAPLAR</a></li>
    <li><a href="dergi.jsp">DERGİLER</a></li>
    <li><a href="gazete.jsp">GAZETELER</a></li>
    <li><a href="ziyaretci.jsp">ZİYARETÇİ</a></li>
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
			  <%
		try{
			RandomAccessFile ziyaretciler = new RandomAccessFile("C:\\Users\\HAB\\workspace\\KutuphaneYonetimSistemi\\WebContent\\ziyaretci_defteri.txt","rw"); // biz yeri söyledik
			String satir = "";
			
			/// FORM VALİDATİON GEREKLİ
			
				satir ="<b>Gönderen</b> "+request.getParameter("Isim")+"<br>";
				satir = satir + "<b>Email</b> <a href ='mailto:"+ request.getParameter("Email")+"'>"+request.getParameter("Email")+"</a><br>";
				satir = satir + "<b>Mesaj: </b>" + request.getParameter("Mesaj");
				satir = satir +"<hr>";
				ziyaretciler.seek(ziyaretciler.length());
				ziyaretciler.writeBytes(satir);
				ziyaretciler.writeByte('\n');//kayıtları çizgi ile birbirinden ayiralim
				
		
			ziyaretciler.close();
			out.println("<br>Ziyaretçi defterini imzaladığınız için teşekkürler... ");
			
		}catch(IOException ex){
			out.println("Hata olustu...!");
		}
	%>
	  
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
