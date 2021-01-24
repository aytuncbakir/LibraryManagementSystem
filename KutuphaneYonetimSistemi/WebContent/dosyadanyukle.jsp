<%@page import="FileAppsPaketi.FileOperations"%>
<%@page import="DBAppsPaketi.DBOperations"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.*" %>
<%@page import="java.io.IOException"%>
<%@ page import="javax.servlet.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="net.ucanaccess.jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="utf-8"%>

<%
	HttpSession onemliSayfa = request.getSession(true);
	if(onemliSayfa.getAttribute("sifre")!= "gecerli")
		response.sendRedirect("uyari.html");
%>


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
   
    
    		<li><a href="cikis.jsp">ÇIKIŞ</a></li>
		    <li><a href="yoneticiislemsec.html">İŞLEMLER</a></li>
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
    	<div id="uye"><h1>Yükleme Durumu:</h1><br>
		   <table>
		   
	<%

				String dosyayolu = "";
				 String yuklemeTuru = request.getParameter("Gonder");
				 int secenek = 0;
				if(yuklemeTuru.equals("TKekle")){
					dosyayolu = "C:\\Users\\HAB\\workspace\\Files\\kitap.txt";
					secenek = 1;
				}else if(yuklemeTuru.equals("TDekle")){
					dosyayolu = "C:\\Users\\HAB\\workspace\\Files\\dergi.txt";
					secenek = 2;
				}else if(yuklemeTuru.equals("TGekle")){
					dosyayolu = "C:\\Users\\HAB\\workspace\\Files\\gazete.txt";
					secenek = 3;
				}
		
				ArrayList <String> aList = new ArrayList<String>();
				FileOperations fops = new FileOperations();
				aList = fops.dosyadanyukle(dosyayolu, secenek);
				DBOperations dbops = new DBOperations();
				dbops.inserturun(aList, secenek);
				out.println("Yükleme başarıyla gerşekleştirildi.");
		
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



