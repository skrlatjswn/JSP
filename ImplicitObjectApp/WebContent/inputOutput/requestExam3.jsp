<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>request��ü�� Context���� �޼��� �׽�Ʈ</h1>
<%
	Date date = (Date)request.getAttribute("currentDate");
%>
���� ��¥�� <%=date %> �Դϴ�.<br/><br/>
<%
	request.setAttribute("currentDate", new Date());
	date = (Date)request.getAttribute("currentDate");
%>
�ٽ� ���� ��¥�� <%=date %> �Դϴ�.<br/><br/>
<%
	request.removeAttribute("currentDate");
	date = (Date)request.getAttribute("currentDate");
%>
�� �ٽ� ���� ��¥�� <%=date %> �Դϴ�.<br/><br/>
</body>
</html>


