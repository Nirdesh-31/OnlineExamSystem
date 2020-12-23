package com.examination;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AddStudents
 */
@WebServlet("/AddStudents")
public class AddStudents extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int studentId=Integer.parseInt(request.getParameter("id"));
		String sname = request.getParameter("sname");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String education = request.getParameter("education");
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		try {
			Connection connection = DatabaseConnection.getConnection();
			Statement statement = connection.createStatement();
			int addStudent = statement
					.executeUpdate("insert into student(id,studentName,email,address,education,uname,upass) values('"
							+ studentId + "','" + sname + "','" + email + "','" + address + "','" + education + "','"
							+ uname + "','" + upass + "')");
			if (addStudent > 0) {
				response.sendRedirect("addStudent.jsp");
			} else {
				response.sendRedirect("addStudent.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
