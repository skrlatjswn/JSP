<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<% if(request.getMethod().equals("GET")){ %>
	<form method="post" action="requestExam2.jsp">
		�̸� : <input type="text" name="irum" /><br/><br/>
		�ּ� : <input type="text" name="addr" /><br/><br/>
		����� ��� : <br/>
		<input type="checkbox" name="hobby" value="����" />����<br/>
		<input type="checkbox" name="hobby" value="���" />���<br/>
		<input type="checkbox" name="hobby" value="����" />����<br/><br/>
		<input type="submit" value="����" /> 
	</form>
<% 
	} // if close 
	else{
%>
	<h1>����� ������ �����ʹ� ������ �����ϴ�.</h1>
	<%
		request.setCharacterEncoding("euc-kr");
		String name = request.getParameter("irum");
		String addr = request.getParameter("addr");
	%>
	
	�̸� : <%= name %><br/>
	�ּ� : <%= addr %><br/><br/>

	<%
		String[] hobbies = request.getParameterValues("hobby");
		if(hobbies != null){
			for(String s : hobbies){
	%>
				<li><%=s%></li>
	<%
			}
		}
	}// else close
	%>
</body>
</html>