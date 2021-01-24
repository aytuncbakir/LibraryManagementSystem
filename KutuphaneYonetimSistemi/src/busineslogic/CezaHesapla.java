package busineslogic;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBAppsPaketi.DBOperations;

/**
 * Servlet implementation class CezaHesapla
 */
@WebServlet("/CezaHesapla")
public class CezaHesapla extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CezaHesapla() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		DBOperations dbops = new DBOperations();
		ArrayList <String> cezalist ;
		try {
			cezalist = dbops.cezaHesapla();
			out.println("<html>"+
						"<center>"+"<head>"+"<h1>Ceza Bildirim<h1>"+"</head>"+"</center>"+
						"<body>"+
						"<center>"+"<table border=2>"+
						
						"<th> Ýsim"+"</th>"+
						"<th> Ceza Miktarý"+"</th>"+"<br>"
					);
			int i = 0;
			while(i<cezalist.size()){
				String ad = cezalist.get(i++);
				int gun = Integer.parseInt( cezalist.get(i++));
				int ceza = hesapla(gun)*10;
				if(ceza != 0){
				out.println(
						"<tr>"+
						"<td>"+ad+"</td>"+
						"<td>"+ceza+"</td>"+"<br>"+
						"</tr>"
					);
				}
			}
						
			out.println(
						"<table>"+"</center>"+
						"<a href =\"yoneticiislemsec.html\">Islemlere Don</a>"+
						"</body>"+
						"</html>"
					);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int hesapla (int gun){
		
		GregorianCalendar bugun = new GregorianCalendar();
		int bgn = bugun.get(GregorianCalendar.DATE);
		System.out.println(bgn);
		
		int durum = bgn - gun;
		if(durum > 15)
			return durum%15;
		if(durum < 0){
			durum = bgn + gun;
			if (durum > 15)
			return durum%15;;
		}
		return 0;
		
		
	}
	
	

}
