<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
   	
		<title>&#2313;&#2346;&#2325;&#2366;&#2352;</title>

		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href='https://fonts.googleapis.com/css?family=Oxygen:400,300,700' rel='stylesheet' type='text/css'>	
		<style>
							*{
								box-sizing: border-box;
							 }
						body {
								font-family: 'Oxygen', sans-serif;	
							 }
				div.container{
								width: 100%;
								border: 1px solid gray;
							  }
				       header {
								padding: 1em;
								color: white;
								background-color: black;
								clear: left;
								text-align: center;
							  }
					   footer {
								position:fixed;
								bottom:2px;
								padding: 1em;
								color: white;
								background-color: black;
								clear: left;
								text-align: center;
								width:100%;
							  }
					nav {
							    float: left;
								margin: 0;
								padding: 1em;
								border-right: 1px solid gray;
							  }
					 nav ul   {
								list-style-type: none;
								padding: 0;
							  }
   
					nav ul a  {
								text-decoration: none;
							  }
					article   {
								margin-left: 170px;
								padding: 1em;
								overflow: hidden;
							   }
							
	@media (max-width: 767px) {
								article{
								display:none;
										}
							   }
							  
		</style>
	</head>
	
	<body>
		<%
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setHeader("Expires","0");
			response.setHeader("Cache-Control", "no-store");
			response.setDateHeader("Expires", 0);
			
			//response.setHeader("Cache-Control","no-cache"); 
			//response.setHeader("Pragma","no-cache"); 
			//response.setDateHeader ("Expires", -1);
		%>
		<div class="container">
			<header>
				<h1 style="color:red">&#2344;&#2350;&#2360;&#2381;&#2325;&#2366;&#2352;</h1>
			</header>
			<nav>
				<ul>
					<div class="list-group">
						<a href="milan_main_member.jsp" class="list-group-item" style="background-color:black;color:red;font-weight:bold">Back</a>
					</div>
				</ul>
				
					<div class="list-group">
						<a style="color:red;font-weight:bold" href="#" class="list-group-item disabled">Message Details</a>
						<!-- <a href="hamro_biz.jsp" class="list-group-item">Send Email to all Nepalese</a>-->
						<!-- <a href="emailtoall.jsp" class="list-group-item">Send Email to all Nepalese</a>-->
						<p>Message Date:<%out.print(request.getAttribute("msg_dt"));%></p>
						<p>Sender:<%out.print(request.getAttribute("sender"));%></p>
						<p>Sender Email: <%out.print(request.getAttribute("sender_email")); %></p>
					</div>
				</ul>
				
				
				<!-- <ul>
					<div class="list-group">
						<a style="color:red;font-weight:bold" href="#" class="list-group-item disabled">&#2350;&#2367;&#2354;&#2344;&#0032;&#2405;&#0032;&#2357;&#2367;&#2357;&#2366;&#2361;</a>
						
						<a href="viv_create.jsp" class="list-group-item">Create My Profile</a>
						<a href="editmyprofile	" class="list-group-item">Edit My Profile</a>
						<a href="deletemyprofile" class="list-group-item">Delete My Profile</a>
						<a href="viewmyprofile" class="list-group-item">View My Profile</a>
						<a href="viv_search_form.jsp" class="list-group-item">Search Matching Profiles</a>
						<a href="respondtorequest" class="list-group-item">View Requests & Respond</a>
						<a href="listacceptors" class="list-group-item">Communicate With Matches</a>
					</div>
				</ul>-->
			</nav>
			<article>
				<h1>ANNOUNCEMENTS</h1>
				<p>Following is the message sent by <%out.print(request.getAttribute("sender"));%>. Please try to communicate at <%out.print(request.getAttribute("sender_email"));%></p>
				<p><%out.print(request.getAttribute("msg"));%></p>
				
			</article>
			
			<footer style="color:red">Welcome <%out.print(session.getAttribute("sessionattr"));%></footer>
			
		</div>
	</body>
</html>