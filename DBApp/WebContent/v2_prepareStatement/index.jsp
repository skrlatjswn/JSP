<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
<script type="text/javascript">
	function delCheck(no){
		var result = confirm("정말 삭제하시겠습니까?");
		if(result == true){
			location.href="deleteSawon.jsp?no=" + no;
		}
	}
</script>
</head>
<body>
<h1>직원 정보 리스트</h1>
<a href="addSawon.html">사원 추가</a><br/><br/>
<form method="post" action="index.jsp">
	<select name="search">
		<option value="id">id</option>
		<option value="addr">근무지</option>
		<option value="dept">부서</option>
		<option value="ext">내선번호</option>
	</select>
	<input type="text" name="searchText" />
	<input type="submit" value="검색" />
</form><br/>
<table border="1">
	<tr>
		<th>사번</th><th>ID</th><th>이름</th><th>패스워드</th><th>나이</th>
		<th>근무지</th><th>부서명</th><th>내선번호</th>
		<th>수정</th><th>삭제</th>
	</tr>
<%
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@192.168.0.29:1521:orcl";
	String id = "scott";
	String pw = "1111";
	
	request.setCharacterEncoding("euc-kr");
	String search = request.getParameter("search");
	String searchText = request.getParameter("searchText");
	String sql = null;
	
	try{
		if(searchText.isEmpty()){
			sql = "select * from tblsawon";	
		}
		else{
			sql = "select * from tblsawon where " + search + " like '%"
				+ searchText + "%'";
		}
	}
	catch(NullPointerException err){
		sql = "select * from tblsawon";	
	}
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, id, pw);
		
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			int s_no = rs.getInt("no");
			String s_id = rs.getString("id");
			String s_name = rs.getString("name");
			String s_pw = rs.getString("pass");
			int s_age = rs.getInt("age");
			String s_addr = rs.getString("addr");
			String s_dept = rs.getString("dept");
			String s_ext = rs.getString("ext");
%>
	<tr>
		<td><%=s_no%></td> <td><%=s_id%></td> <td><%=s_name%></td>
		<td><%=s_pw%></td> <td><%=s_age%></td> <td><%=s_addr%></td>
		<td><%=s_dept%></td> <td><%=s_ext%></td> 
		<td><a href="editSawon.jsp?no=<%=s_no%>">수정</a></td>
		<td><a href="javascript:delCheck(<%=s_no%>)">삭제</a></td>
	</tr>
<%
		}
	}
	catch(Exception err){
		System.out.println("index.jsp : " + err);
	}
	finally{
		if(rs != null) try{ rs.close(); } catch(Exception err){}
		if(stmt != null) try{ stmt.close(); } catch(Exception err){}
		if(con != null)	try{ con.close(); } catch(Exception err){}
	}
%>
</table>
</body>
</html>