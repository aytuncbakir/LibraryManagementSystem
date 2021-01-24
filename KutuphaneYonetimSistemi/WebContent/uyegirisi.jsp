<%@page import="busineslogic.SistemIslemleri"%>
<%@page import="DBAppsPaketi.DBOperations"%>
<%@page import="kisiler.SistemKullanicisi"%>
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
   
    
    		<li><a href="cikis.jsp">ÇIKIŞ</a></li>
		    <li><a href="yonetici.jsp">YÖNETİCİ</a></li>
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
    	<div id="uye"><h1>Giriş Yapınız:</h1><br>
		   <table>
	
	<%
	String adi = request.getParameter("KullaniciAdi");;
	String sifre = request.getParameter("Sifre");
		if(!kontrolEt(adi))
			out.println("KullaniciAdi girilmedi!<br>");
		if(!kontrolEt(sifre))
			out.println("Sifre girilmedi!.<br>");
		

		if(!(kontrolEt(adi) & kontrolEt(sifre)))
				out.println("<a href='javascript: history.back()'>Eksik bilgilerinizi girmelisiniz<br>");
		
		
		SistemIslemleri giris = new SistemIslemleri();
		SistemKullanicisi kisi = null;
		if((sifre != null) && (sifre.length()>0)&& (adi != null) && (adi.length()>0))
			kisi = giris.Login(adi, sifre);
		else{// Eğer ad/şifre girilmediyse
			HttpSession islemler = request.getSession(true);
			islemler.setAttribute("sifre", "gecersiz");
			out.println("<a href='uyegiris.jsp'>Giriş</a>sayfasına giderek ad ve şifre giriniz.<br>");
		}
			
		
		if(kisi != null){
		
			String hatirlatma;
			hatirlatma = request.getParameter("Hatirlatma");
			//out.println(hatirlatma);
			
				if(sifre.equals(kisi.getSifre()) && adi.equals(kisi.getAdi()) ){//Eğer ad/şifre geçerliyse
					HttpSession islemler = request.getSession(true);
					islemler.setAttribute("sifre", "gecerli");
					islemler.setAttribute("KullaniciAdi", kisi.getAdi());
					if(hatirlatma != null){
						Cookie cookieKullaniciAdi = new Cookie("KullaniciAdi",kisi.getAdi());
						cookieKullaniciAdi.setMaxAge(900000);
						response.addCookie(cookieKullaniciAdi);
						
						Cookie cookieSifre = new Cookie("Sifre",kisi.getSifre());
						cookieSifre.setMaxAge(900000);
						response.addCookie(cookieSifre);
						
					}else{
						Cookie cookieKullaniciAdi = new Cookie("KullaniciAdi","");
						cookieKullaniciAdi.setMaxAge(900000);
						response.addCookie(cookieKullaniciAdi);
						
						Cookie cookieSifre = new Cookie("Sifre","");
						cookieSifre.setMaxAge(900000);
						response.addCookie(cookieSifre);
						out.println("Bir daha ki sefere Login bilgilerinizi hatırlayacağım.<br>");
						
					}
					
					if(kisi.isYoneticimi())
						response.sendRedirect("yoneticiislemsec.html");// otamatik yönlendirma
					else
						response.sendRedirect("uyeislemsec.html");// otamatik yönlendirma
					// manuel yönlendirme
					out.println("Sifreniz gecerli. Sitemizde istediginiz sayfaya gidebilirsiniz<br>");
					out.println("Hatta <a href='uyeislemsec.html'>onemli bilgiler icren sayfamiza</a> bile!<br>");
				}else{// Eğer ad/şifre geçersizse
					HttpSession islemler = request.getSession(true);
					islemler.setAttribute("sifre", "gecersiz");
					out.println("<a href='uyegiris.jsp'>Giriş</a> sayfasına giderek tekrar deneyiniz.<br>");
				}
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



