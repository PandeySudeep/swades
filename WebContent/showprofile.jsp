<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.*"%>

<html>
	<head>
		<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    	<meta name="description" content="">
    	<meta name="author" content="">
    	<link rel="icon" href="img/favicon.ico">
    	
    	<meta http-equiv="Pragma" content="no-cache"> 
 		<meta http-equiv="Cache-Control"      content="no-cache"> 
		<meta http-equiv="Expires" content="Sat, 01 Dec 2012 00:00:00 GMT">

    	<title>&#2350;&#2367;&#2354;&#2344;&#0032;&#2405;&#0032;&#2357;&#2367;&#2357;&#2366;&#2361;</title>

    	<link href="css/bootstrap.min.css" rel="stylesheet">
    	<link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
		<script src="js/ie-emulation-modes-warning.js"></script>
		<link href="css/carousel.css" rel="stylesheet">
	</head>
	<body>
	
		<%!
	  	Connection con = null;
	  	Statement stmt = null;
	  	DataSource dataSource = null;
		%>
		<%!
	  	int _Id = 0;
	  	int profileid = 0;
	  	String _Nickname = null;
	  	String _usr = null;
	  	String _pwd = null;
	  	String _Gender = null;
	  	String _Age = null;
	  	String _Address = null;
	  	String _Hobby = null;
	  	String _Lookingfor = null;
	  	String _About = null;
	  	String _Lifeis = null;
	  	String _Favquote = null;
	  	String _Otherinfo = null;
	  	String profilepic = null;
	  	String secondpic = null;
	  	String thirdpic = null;
		%>
		<%!public void jspInit(){
		
	    try {
			// Get DataSource
			Context initContext  = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			dataSource = (DataSource)envContext.lookup("jdbc/hamroaa1_hamro_db");
				} catch (NamingException e) {
					e.printStackTrace();
			}
	    }
		%>
		
		<%
			//response.setHeader("Pragma", "no-cache");
			//response.setHeader("Cache-Control", "no-cache");
			//response.setHeader("Expires","0");
			//response.setHeader("Cache-Control", "no-store");
			//response.setDateHeader("Expires", 0);
			
			response.setHeader("Cache-Control","no-cache"); 
			response.setHeader("Pragma","no-cache"); 
			response.setDateHeader ("Expires", -1);
		%>
		<%
		
		//HttpSession session = request.getSession();
		
		String usr = (String)session.getAttribute("sessionattr");
		
		if(usr==null){
			request.setAttribute("message", "Session expired. Please click 'Back' button to the left and log in again.");
			request.setAttribute("link", "welcome.jsp");
			RequestDispatcher view = request.getRequestDispatcher("msg_display.jsp");
			view.forward(request,response);
		}else{
		
		String selected_id = (String)request.getParameter("desiredprofile");
		boolean valerr=false;
		try{
			
			profileid = Integer.parseInt(selected_id);
			}catch(NumberFormatException ne){
				valerr=true;
				request.setAttribute("message", "Please enter only numbers.");
				request.setAttribute("link", "main.jsp");
				RequestDispatcher view = request.getRequestDispatcher("msg_display.jsp");
				view.forward(request,response);
				
		}
		
		if(valerr==false){
		String profilecheck = "SELECT ID from dating_profile;";
		boolean check = false;
		ResultSet rs1 = null;
		try
			{
				con = dataSource.getConnection();
    			stmt = con.createStatement();
				rs1 = stmt.executeQuery(profilecheck);
				while(rs1.next())
					{
						int _Id1 = rs1.getInt("ID");
						if(_Id1==(profileid))
							{
								check=true;
								break;
						}
				}
			}catch(SQLException se){
				out.print(se.getMessage());
		}

		if(check==false)
			{
				try{if(null!=rs1)rs1.close();}catch(SQLException e){out.print(e.getMessage());}
				try{if(null!=stmt)stmt.close();}catch(SQLException e){e.getMessage();}
				try{if(null!=con)con.close();}catch(SQLException e){out.print(e.getMessage());}
				
				request.setAttribute("message", "Wrong Profile ID Selection. Please try again.");
				request.setAttribute("link", "main.jsp");
				RequestDispatcher view = request.getRequestDispatcher("msg_display.jsp");
				view.forward(request,response);
				//RequestDispatcher view = request.getRequestDispatcher("invalidprofile.jsp");
				//view.forward(request,response);
		}else{

				String query = "Select ID,USERNAME,PASS_WORD,NICKNAME,GENDER,AGE,ADDRESS,HOBBY,LOOKING_FOR,ABOUT,LIFE_IS,FAV_QUOTE,OTHER_INFO from dating_profile where ID="+profileid+";";
				ResultSet rs2 = null;
				try {
						rs2 = stmt.executeQuery(query);
						while(rs2.next())
							{
								_Id = rs2.getInt("ID");
								_usr=rs2.getString("USERNAME");
								_pwd=rs2.getString("PASS_WORD");
								_Nickname = rs2.getString("NICKNAME");
								_Gender = rs2.getString("GENDER");
								_Age = rs2.getString("AGE");
								_Address = rs2.getString("ADDRESS");
								_Hobby = rs2.getString("HOBBY");
								_Lookingfor = rs2.getString("LOOKING_FOR");
								_About = rs2.getString("ABOUT");
								_Lifeis = rs2.getString("LIFE_IS");
								_Favquote = rs2.getString("FAV_QUOTE");
								_Otherinfo = rs2.getString("OTHER_INFO");
							}
					}catch (SQLException e) {
						out.print(e.getMessage());
					}finally{
							try{if(null!=rs2)rs2.close();}catch(SQLException e){out.print(e.getMessage());}
							try{if(null!=stmt)stmt.close();}catch(SQLException e){e.getMessage();}
							try{if(null!=con)con.close();}catch(SQLException e){out.print(e.getMessage());}
						}
					}
				}}
			%>

		<div class="navbar-wrapper">
      		<div class="container">
				<nav class="navbar navbar-inverse navbar-static-top">
          			<div class="container">
            			<div class="navbar-header">
              				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                				<span class="sr-only">Toggle navigation</span>
                				<span class="icon-bar"></span>
                				<span class="icon-bar"></span>
                				<span class="icon-bar"></span>
              				</button>
              				<a style="color:red" class="navbar-brand" href="main.jsp">&#2350;&#2367;&#2354;&#2344;&#0032;&#2405;&#0032;&#2357;&#2367;&#2357;&#2366;&#2361;</a>
            			</div>
            			<div id="navbar" class="navbar-collapse collapse">
              				<ul class="nav navbar-nav">
                				<li class="active"><a style="color:red" href="welcome.jsp">Home</a></li>
                				<li><a style="color:red" href="main.jsp">Main</a></li>
                        	</ul>
            			</div>
            		</div>
        		</nav>
			</div>
    	</div>
    
    
    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="First slide">
		  <div class="container">
            <div class="carousel-caption">
              <h1 style="color:black">Profile ID/Profile Name</h1>
              <p>ID: <%out.print(_Id);%>/Name: <%out.print(_Nickname);%></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1 style="color:black">Age</h1>
              <p><%out.print(_Age);%></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1 style="color:black">Address</h1>
              <p><%out.print(_Address);%></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    
    <!-- /.carousel -->

 <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->
	<div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div class="row">
        <div class="col-lg-4">
          <img class="img-circle" src="\img\vivah.jpg" alt="Generic placeholder image" width="180" height="140">
          <h2>About Me</h2>
          <p><%out.print(_About);%></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="\img\vivah2.jpg" alt="Generic placeholder image" width="180" height="140">
          <h2>I Am Looking For</h2>
          <p><%out.print(_Lookingfor);%></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="\img\vivah3.jpg" alt="Generic placeholder image" width="180" height="140">
          <h2>According To Me, Life Is</h2>
          <p><%out.print(_Lifeis);%></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->
      
      <%secondpic = "/sagarmatha/my_images/"+_usr+_pwd+"sagarmatha1.jpg";%>
	  <%thirdpic = "/sagarmatha/my_images/"+_usr+_pwd+"sagarmatha2.jpg";%>
	  <%profilepic = "/sagarmatha/my_images/"+_usr+_pwd+"sagarmatha0.jpg";%>


<!-- START THE FEATURETTES -->

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">My Hobbies <span class="text-muted">Don't judge me though :)</span></h2>
          <p class="lead"><%out.print(_Hobby);%></p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" src=<%out.print(profilepic);%> alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7 col-md-push-5">
          <h2 class="featurette-heading">Favorite Quote <span class="text-muted">I have quite a few. But this one's the best</span></h2>
          <p class="lead"><%out.print(_Favquote);%></p>
        </div>
        <div class="col-md-5 col-md-pull-7">
          <img class="featurette-image img-responsive center-block" src=<%=secondpic%> alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">Everything Else I Want You To Know <span class="text-muted">May be more when we get to know each other :)</span></h2>
          <p class="lead"><%out.print(_Otherinfo);%></p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" src=<%=thirdpic%> alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

<!-- /END THE FEATURETTES -->


      <!-- FOOTER -->
      <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p style="color:blue">&copy;pAnalyticsTech Solutions. &#2343;&#2344;&#2381;&#2351;&#2357;&#2366;&#2342;</p>
      </footer>

    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    
    <script src="js/holder.min.js"></script>
    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    
    <script src="js/ie10-viewport-bug-workaround.js"></script>
	
	</body>
</html>