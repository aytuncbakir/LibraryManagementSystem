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
    	
    		<form action="ziyaretci_ekle.jsp" method="post" name="">
	<b>Bende mesaj gondermek istiyorum</b><br>
	
	<table>
						
			<tr>
				<td> Ad-Soyad :</td>
				<td> <input type="text" name ="Isim" size="20" > </td>
			</tr>
			
			<tr>
				<td> E-Mail :</td>
				<td> <input type="text" name ="Email" size="20" > </td>
			</tr>
			
						
			<tr>
				<td> Mesaj:</td>
				<td> <textarea name ="Mesaj" cols="40" rows="8"> </textarea></td>
			</tr>
			
			<tr>
				<td> &nbsp;</td>
				<td>
						<input type="submit" name="Gonder" value="Gönder">
						<input type="reset" name="Sil" value="Sil" >
				</td>
			</tr>
			
		</table>
	
	</form>
       
		</td>
		<td width="200" valign="top" style="border-right:#666666 1px dotted;">
	    	<div id=""><br>
	    	
	    		<hr>
					<jsp:include page="ziyaretci_defteri.txt" flush="true"/>
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
