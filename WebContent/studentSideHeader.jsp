<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<section class="menu-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="navbar-collapse collapse ">
					<ul id="menu-top" class="nav navbar-nav navbar-right">
						<li><a href="examination.jsp">Test Take</a></li>
						<li><a href="checkResult.jsp">Result</a></li>
						<li><a href="studentProfile.jsp">Profile</a></li>
						<li><a href="editStudentProfile.jsp">Edit Profile</a></li>
						<li><a href="passwordChange.jsp">Change Password</a></li>
						<li><a href=""><font color="#ff8c00"><%=session.getAttribute("uname")%></font></a></li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</section>