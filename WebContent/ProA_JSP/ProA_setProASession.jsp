<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.io.File"%>
	<%@ page import ="Run.*"%>
<%
	String path =request.getParameter("file");
	if(path!=null){
	ProA p = new ProA(path);
	session.setAttribute("filename",path);
	session.setAttribute("ProA", p);
	}
%>
    <script>location.href = "ProA_Main.jsp"; </script>