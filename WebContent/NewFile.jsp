<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.io.File"%>
<%@ page import ="Run.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>
<%
	String path = "C:/Users/admin/Desktop/eclipse-jee-luna-SR2-win32/eclipse/running.mxml";
	System.out.println(path);
	ProA p = new ProA(path);
%>
<%p.getActToActMap(); %>
</body>

</html>