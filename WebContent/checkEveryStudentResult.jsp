<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Mirrored from www.binarytheme.com/BTlivedemos/2014/08/29/horizontal-admin/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 Jul 2019 14:48:34 GMT -->
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
<title>Online Exam System</title>
<!-- BOOTSTRAP CORE STYLE  -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONT AWESOME STYLE  -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE  -->
<link href="assets/css/style.css" rel="stylesheet" />
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />

</head>
<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<div class="navbar navbar-inverse set-radius-zero">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index-2.html"> <img
					src="images/logo.png" width=45%  />
				</a>

			</div>

			<div class="right-div">
				<a href="logout.jsp" class="btn btn-info pull-right">LOG ME OUT</a>
			</div>
		</div>
	</div>
	<jsp:include page="adminHeader.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
				<a style=float:right; href="checkStudentList.jsp">Back</a>
					<h4 class="header-line" style="float:left">&nbsp;&nbsp;&nbsp;&nbsp;Exam Result</h4>
					<br>
					
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>2 Marks for each question.<strong>
			</div>
			<div class="row">
				<div class="col-md-12">
					<%
						try {
						int id = 0;
						String answer = null;
						String hitAnswer = null;
						String studentName = "";
						int resultCorrect = 0;
						int resultWrong = 0;
						int testMarks = 0;
						Timestamp timestamp = new Timestamp(System.currentTimeMillis());
						int tblresultreport = DatabaseConnection.insertUpdateFromSqlQuery("truncate tblresultreport");
						ResultSet resultSet = DatabaseConnection.getResultFromSqlQuery("select distinct examdate from tblstudentresult where studentId='" + request.getParameter("id") + "'");
						while (resultSet.next()) {
							resultCorrect = 0;
							resultWrong = 0;
							id = Integer.parseInt(request.getParameter("id"));
							ResultSet rsStudentInfo = DatabaseConnection.getResultFromSqlQuery("select * from tblStudentResult where studentid='" + id + "' and examdate='"+ resultSet.getTimestamp("examdate") + "' ");
							while (rsStudentInfo.next()) {
						int questionID = rsStudentInfo.getInt("question_id");
						hitAnswer = rsStudentInfo.getString("hitAnswer");
						ResultSet rsActualAnswer = DatabaseConnection
								.getResultFromSqlQuery("select * from questions where id='" + questionID + "'");
						if (rsActualAnswer.next()) {
							answer = rsActualAnswer.getString("answer");
						}
						if (answer.equals(hitAnswer)) {
							resultCorrect++;
							testMarks = resultCorrect * 2;
						} else {
							resultWrong++;

						}
							}
							ResultSet rsStudentName = DatabaseConnection
							.getResultFromSqlQuery("select studentName from student where id='" + id + "'");
							if (rsStudentName.next()) {
						studentName = rsStudentName.getString("studentName");
							}
							int resultReport = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblresultreport(student_id,student_name,correct_answer,wrong_answer,test_marks,examtime)values('"+ id + "','" + studentName + "','" + resultCorrect + "','" + resultWrong + "','" + testMarks+ "','" + resultSet.getTimestamp("examdate") + "')");
						}
					%>
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">Student Test Results</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>Id</th>
												<th>Student Name</th>
												<th>Test Correct Answer</th>
												<th>Test Wrong Answer</th>
												<th>Test Marks</th>
												<th>Exam Date & Time</th>
											</tr>
										</thead>
										<%
											ResultSet studentResultReport = DatabaseConnection.getResultFromSqlQuery("select * from tblresultreport");
											while (studentResultReport.next()) {
										%>
										<tbody>
											<tr class="success">
												<td><%=studentResultReport.getInt(1)%></td>
												<td><%=studentResultReport.getString(2)%></td>
												<td><%=studentResultReport.getString(3)%></td>
												<td><%=studentResultReport.getString(4)%></td>
												<td><%=studentResultReport.getString(5)%></td>
												<td><%=studentResultReport.getString(6)%></td>
											</tr>
										</tbody>
										<%
											}
										%>
									</table>
									<%
										} catch (Exception e) {
											e.printStackTrace();
									}
									%>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	<section class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">&copy; Professional Practice Project</div>

			</div>
		</div>
	</section>
	<!-- FOOTER SECTION END-->
	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS  -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- CUSTOM SCRIPTS  -->
	<script src="assets/js/custom.js"></script>
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})
				(
						window,
						document,
						'script',
						'../../../../../../www.google-analytics.com/analytics.js',
						'ga');

		ga('create', 'UA-58127580-1', 'auto');
		ga('send', 'pageview');
	</script>
	<%
		} else {
	response.sendRedirect("index.jsp");
	}
	%>
</body>

<!-- Mirrored from www.binarytheme.com/BTlivedemos/2014/08/29/horizontal-admin/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 Jul 2019 14:48:34 GMT -->
</html>
