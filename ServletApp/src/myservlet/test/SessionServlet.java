package myservlet.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setCharacterEncoding("euc-kr");
		
		HttpSession session = req.getSession();
		
		String irum = req.getParameter("irum"); 
		session.setAttribute("id", irum);
		
		PrintWriter out = resp.getWriter();
		out.println("<html><body>");
		out.println("���ǿ� ����� �̸��� ����Ǿ����ϴ�.<br/>");
		out.println("����� �̸��� " + session.getAttribute("id") + "<br/>");
		
		Date date = new Date(session.getCreationTime());
		out.println("����� ���� �ð��� : " + date + "<br/>");
		
		date = new Date(session.getLastAccessedTime());
		out.println("����� ���������� ��û�� �ð��� : " + date + "<br/>");
		
		out.println("����� ����ID�� : " + session.getId() + "<br/>");
		
		out.println("���� ���� �ð��� : " + session.getMaxInactiveInterval() + "<br/>");
		
		session.setMaxInactiveInterval(60 * 60 * 5);
		out.println("���� ���� �ð��� : " + session.getMaxInactiveInterval() + "<br/>");
		
		if(session.isNew()){
			out.println("���� ó�� �����ϼ̱���.");
		}
		else{
			out.println("�������� �� �ȵ� ����� �Դϴ�.");
		}
	}
}







