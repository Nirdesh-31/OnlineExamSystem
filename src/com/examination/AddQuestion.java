package com.examination;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AddQuestion
 */
@WebServlet("/AddQuestion")
public class AddQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
  	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String question=request.getParameter("question");
		String option1=request.getParameter("option1");
		String option2=request.getParameter("option2");
		String option3=request.getParameter("option3");
		String option4=request.getParameter("option4");
		String correctAnswer=request.getParameter("correctAnswer");
		String selectTopic=request.getParameter("selectTopic");
		Connection connection;
		try {
			connection = DatabaseConnection.getConnection();
			Statement statement=connection.createStatement();
			int addQuestion = statement.executeUpdate("insert into questions(question,option1,option2,option3,option4,answer,subjectTopic)values('"+question+"','"+option1+"','"+option2+"','"+option3+"','"+option4+"','"+correctAnswer+"','"+selectTopic+"')");
			if(addQuestion>0){
				response.sendRedirect("addQuestion.jsp");
			}else{
				response.sendRedirect("addQuestion.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
