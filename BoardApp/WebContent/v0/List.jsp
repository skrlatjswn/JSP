<%@page import="mybean.board.BoardDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html;charset=euc-kr" %>
<HTML>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check(){
		if(document.search.keyWord.value == ""){
			alert("�˻�� �Է��ϼ���.");
			document.search.keyWord.focus();
			return;
		}
		document.search.submit();
	}
</script>
<BODY>
<center><br>
<h2>JSP Board</h2>
<jsp:useBean id="dao" class="mybean.board.BoardDao" />
<%
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	Vector list = dao.getBoardList(keyField, keyWord);
%>
<table align=center border=0 width=80%>
<tr>
	<td align=left>Total :  <%=list.size()%> Articles(
		<font color=red>  1 / 10 Pages </font>)
	</td>
</tr>
</table>

<table align=center width=80% border=0 cellspacing=0 cellpadding=3>
<tr>
	<td align=center colspan=2>
		<table border=0 width=100% cellpadding=2 cellspacing=0>
			<tr align=center bgcolor=#D0D0D0 height=120%>
				<td width="10%"> ��ȣ </td>
				<td widht="40%"> ���� </td>
				<td width="20%"> �̸� </td>
				<td width="20%"> ��¥ </td>
				<td width="10%"> ��ȸ�� </td>
			</tr>		
			<% if(list.isEmpty()){ %>
					<b>��ϵ� ���� �����ϴ�.</b>
			<%
				}
				else{
					for(int i=0; i<list.size(); i++){
						BoardDto dto = (BoardDto)list.get(i);
			%>
			<tr>
				<td><%=dto.getNum()%></td>
				<td><%=dto.getSubject()%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getRegdate()%></td>
				<td><%=dto.getCount()%></td>
			</tr>
			<%
					}
				}
			%>
		</table>
	</td>
</tr>
<tr><td></td></tr>
<tr>
	<td align="left">Go to Page </td>
	<td align=right>
		<a href="Post.jsp">[�۾���]</a>
		<a href="javascript:list()">[ó������]</a>
	</td>
</tr>
</table>
<BR>
<form action="List.jsp" name="search" method="post">
	<table border=0 width=527 align=center cellpadding=4 cellspacing=0>
	<tr>
		<td align=center valign=bottom>
			<select name="keyField" size="1">
				<option value="name"> �̸�
				<option value="subject"> ����
				<option value="content"> ����
			</select>

			<input type="text" size="16" name="keyWord" >
			<input type="button" value="ã��" onClick="check()">
			<input type="hidden" name="page" value= "0">
		</td>
	</tr>
	</table>
</form>
</center>	
</BODY>
</HTML>