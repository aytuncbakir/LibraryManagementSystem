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
    	<div id="uye"><h1>Üzerinizdeki mecmuat :</h1><br>
		   <table>
		   
	 		
	<%	int modul = 1;
		String fonRengi ="";
		Connection baglanti = null ;
		Statement satir = null;
		ResultSet sonucVeriler = null;
		
			
		
		%>

		<table cellpadding="4">
			<tr>
			<td width="60"><b>ÜyeID</b></td>
			<td width="100"><b>ÜyeAdi</b></td>
			<td width="100"><b>Şifre</b></td>
			
			</tr>
		<%	
		
		
			String gonderValue = request.getParameter("Gonder");
		
				DBOperations dbops = new DBOperations();
				ArrayList <String> uyeler = new ArrayList<String>();
				uyeler = dbops.uyelistele();
				int i = 0;
				String adi = "",sifre = "";
				int id = 0;
				System.out.println(uyeler.size());
				 while(i < uyeler.size()){
						if((modul%2)==1)
							fonRengi = "#dddddd";
						else
							fonRengi = "#eeeeee";
			
						id = Integer.parseInt(uyeler.get(i++));
						adi = uyeler.get(i++);
						sifre = uyeler.get(i++);
		
					modul++;
						 %>
						<tr bgcolor="<%=fonRengi%>">
						<td><%=id%></td>
						<td><%=adi%></td>
						<td><%=sifre%></td>
						
						</tr>
						<%
				}
		
		
			 
		
		
		
	%>
		   </table>
			
       </div>
	</td>
    
    <td width="1200" valign="top">
    	</td>
    	

<table>


			</table>

    	
    	
		</table>

</div>
</body>


</html>
