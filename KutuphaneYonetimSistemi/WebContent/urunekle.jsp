<%@page import="DBAppsPaketi.DBOperations"%>
<%
	HttpSession onemliSayfa = request.getSession(true);
	if(onemliSayfa.getAttribute("sifre")!= "gecerli")
		response.sendRedirect("uyari.html");
%>
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
	String Sifre, KullaniciAdi;
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
    	<div id="uye"><h1>Ekleme:</h1><br>
		   <table>
		   
	<%
		
	
		String isbn = request.getParameter("Isbn");
		String ad = request.getParameter("Ad");
		String tur = request.getParameter("Turu");
		int rafno = Integer.parseInt( request.getParameter("Rafno"));
		String icerik = request.getParameter("Icerik");
		String yazar = request.getParameter("Yazar");
		String cins = request.getParameter("EklemeTuru");
		String rf = " "+rafno;
		if(!kontrolEt(isbn))
			out.println("İsbn girilmedi!<br>");
		if(!kontrolEt(ad))
			out.println("Ad girilmedi!.<br>");
		if(!kontrolEt(tur))
			out.println("Tur girilmedi!<br>");
		if(!kontrolEt(rf))
			out.println("Rafno girilmedi!.<br>");
		if(!kontrolEt(icerik))
			out.println("İçerik girilmedi!<br>");
		if(!kontrolEt(yazar))
			out.println("Yazar girilmedi!.<br>");
		if(!kontrolEt(cins))
			out.println("Cins girilmedi!<br>");
		

		if(kontrolEt(isbn) & kontrolEt(ad)& kontrolEt(tur)& kontrolEt(rf)& kontrolEt(icerik)& kontrolEt(yazar)& kontrolEt(cins)){
			
			DBOperations dbops = new DBOperations();
			boolean ekledinmi = false;
			if(cins.equals("Kitap"))
				ekledinmi = dbops.inserturun(isbn, ad, rafno, tur, icerik, yazar, 1);
			else if(cins.equals("Dergi"))
				ekledinmi =dbops.inserturun("", ad, rafno, tur, icerik, "", 2);
			else if(cins.equals("Gazete"))
				ekledinmi =dbops.inserturun("", ad, rafno, tur, icerik, "", 3);
			
			if(ekledinmi){
				out.println ("Eklenen Ürün :" +"<br>" );
				out.println (isbn  +"<br>");
				out.println ( ad  +"<br>");
				out.println (rafno  +"<br>" );
				out.println ( tur  +"<br>");
				out.println (icerik +"<br>" );
				out.println ( yazar  +"<br>");
				out.println ("Ekleme başarılı." +"<br>" );
				
			}else
				out.println("<a href='javascript: history.back()'>Geri Dön");
		
		}else{
			out.println("<a href='javascript: history.back()'>Eksik bilgilerinizi girmelisiniz<br>");
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

