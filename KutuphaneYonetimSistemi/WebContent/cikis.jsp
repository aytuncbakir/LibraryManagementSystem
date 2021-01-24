<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="utf-8"%>
<%
	HttpSession onemliSayfa = request.getSession(true);
	onemliSayfa.invalidate(); 
	response.sendRedirect("index.html");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Çıkış</title>
</head>
<body>
</body>
</html>

