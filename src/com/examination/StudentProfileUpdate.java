package com.examination;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class StudentProfileUpdate
 */
@WebServlet("/StudentProfileUpdate")
public class StudentProfileUpdate extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String sname = request.getParameter("sname");
			String email = request.getParameter("email");
			String education = request.getParameter("education");
			String address=request.getParameter("address");
			HttpSession hs = request.getSession();
			int editProfile=DatabaseConnection.insertUpdateFromSqlQuery("update student set studentName='"+sname+"',email='"+email+"',address='"+address+"',education='"+education+"' where uname='"+hs.getAttribute("uname")+"'");
			if(editProfile>0) {
				response.sendRedirect("editStudentProfile.jsp");
			}else {
				response.sendRedirect("editStudentProfile.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
