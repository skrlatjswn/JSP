package myservlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setCharacterEncoding("euc-kr");
		
		String irum = req.getParameter("irum");
		String addr = req.getParameter("addr");
		
		PrintWriter out = resp.getWriter();
		out.println("<html><body>");
		
		Cookie[] cooks = req.getCookies();
		
		if(irum.length() > 0 && addr.length() > 0){
			out.println("<h1>����� ���� �����ʹ� ������ ����.</h1>");
			out.println("name : " + irum + ", addr : " + addr + "<br/><br/>");
			out.println("�� ������ ��Ű�� ����� ���̴�. ������");
		
			Cookie cookIrum = new Cookie("irum", irum);
			Cookie cookAddr = new Cookie("addr", addr);
			
			cookIrum.setMaxAge(60*60*24);
			cookAddr.setMaxAge(60*60*24);
			
			resp.addCookie(cookIrum);
			resp.addCookie(cookAddr);
		}
		else{
			if(cooks.length > 0){
				out.println("<h1>��Ű�� ����� ������ ������ ����.</h1>");
				for(int i=0; i<cooks.length; i++){
					Cookie c = cooks[i];
					String n = c.getName();
					String v = c.getValue();
					out.println(n + " : " + v + "<br/>");
				}
			}
			else{
				out.println("����� ��Ű�� �����ϴ�.");
			}
		}
	}
}
// http://localhost:8080/ServletApp/cook.action



