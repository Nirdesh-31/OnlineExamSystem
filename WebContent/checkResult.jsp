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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
				<a class="navbar-brand" href="index.jsp"> <img
					src="images/logo.png" style="width: 200px; height: 70px;" />
				</a>

			</div>

			<div class="right-div">
				<a href="logout.jsp" class="btn btn-info pull-right">LOG ME OUT</a>
			</div>
		</div>
	</div>
	<jsp:include page="studentSideHeader.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Exam Result</h4>

				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="alert alert-default">
						<strong>2 marks for each question.<strong>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">Test Results</div>
					<div class="panel-body">
						<%
							try {
						%>
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>Total Questions</th>
										<th>Topic Name</th>
										<th>Test Correct Answer</th>
										<th>Test Wrong Answer</th>
										<th>Test Marks</th>
										<th>Date & Time</th>
									</tr>
								</thead>
								<%
								int id = 0;
								String answer = null;
								String hitAnswer = null;
								String dateTime = null;
								ResultSet correctAnswer = null;
								int countAnswer = 0;
								int resultCorrect = 0;
								int resultWrong = 0;
								int marks = 0;

								ResultSet resultTimestamp = DatabaseConnection.getResultFromSqlQuery("select distinct subjectTopic, examdate from tblstudentresult where studentId='"+ session.getAttribute("uid") + "'");
								while (resultTimestamp.next()) {
									countAnswer = 0;
									resultCorrect = 0;
									resultWrong = 0;
									marks = 0;

									ResultSet resultCount = DatabaseConnection.getResultFromSqlQuery("select count(question) from questions where subjectTopic='"+ resultTimestamp.getString("subjectTopic") + "'");
									resultCount.next();
									int count = resultCount.getInt(1);

									ResultSet resultSet = DatabaseConnection.getResultFromSqlQuery("select * from questions where subjectTopic='" + resultTimestamp.getString("subjectTopic") + "'");
									while (resultSet.next()) {
										id = resultSet.getInt(1);
										answer = resultSet.getString(7);
										ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from tblStudentResult where studentId='" + session.getAttribute("uid") + "' and question_id='"+ id + "' and  examdate='" + resultTimestamp.getTimestamp("examdate") + "'");
										if (rs.next()) {
											hitAnswer = rs.getString("hitAnswer");
											dateTime = rs.getString("examdate");
										}
										if (answer.equals(hitAnswer)) {
											resultCorrect++;
											marks = resultCorrect * 4;
										} else {
											resultWrong++;
										}
									}
								%>
								<tbody>
									<tr class="success">
										<td> <%=count%> </td>
										<td> <%=resultTimestamp.getString("subjectTopic")%> </td>
										<td> <%=resultCorrect%> </td>
										<td> <%=resultWrong%> </td>
										<td> <%=marks%> </td>
										<td> <%=dateTime%> </td>
									</tr>
								</tbody>
								<%
									}
								} catch (Exception e) {
								e.printStackTrace();
								}
								%>
							</table>
						</div>
					</div>
				</div>
				<!--  end  Context Classes  -->
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
</html>
