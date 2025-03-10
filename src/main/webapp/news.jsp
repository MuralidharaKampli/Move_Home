<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet" %>

<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
  <title>Move Home</title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
  <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
      
</head>

<body class="sub_page">
  <div class="hero_area">
    <div class="hero_bg_box">
      <img src="images/hero-bg.jpg" alt="">
    </div>
    
 <!-- header section strats -->
    <header class="header_section">
      <div class="header_top">
        <div class="container header_top_container">
          <div class="row">
          <div class="col-md-4">
            <div class="full">
              <div class="social_box">
                <a target="blank" href="http://www.facebook.com">
                  <i class="fa fa-facebook" aria-hidden="true"></i>
                </a>
                <a target="blank" href="http://www.twitter.com">
                  <i class="fa fa-twitter" aria-hidden="true"></i>
                </a>
                <a target="blank" href="http://www.instagram.com">
                  <i class="fa fa-instagram" aria-hidden="true"></i>
                </a>
                <a target="blank" href="http://www.youtube.com">
                  <i class="fa fa-youtube" aria-hidden="true"></i>
                </a>
              </div>
            </div>
          </div>
          <div class="col-md-8">
            <div class="full">
              <div class="contact_nav">
                <a target="_blank" href="https://goo.gl/maps/fApY8KtUCVfTNU8ZA">
                  <i class="fa fa-map-marker" aria-hidden="true"></i>
                  <span>
                    Move Home
                  </span>
                </a>
                <a target="_blank" href="http://www.gmail.com">
                  <i class="fa fa-envelope" aria-hidden="true"></i>
                  <span>
                    muralidhara@gmail.com
                  </span>
                </a>
                <a target="_blank" href="tel:+91 6360237711" class="call-link">
                  <i class="fa fa-phone" aria-hidden="true"></i>
                  <span>
                    Call : +91 6360237711
                  </span>
                </a>   
                <a></a>            
				<a target="_blank" style="float: right; margin-right: 0px;" href="http://localhost:8081/JSP_Programs/move_home/jsp/admin.html">
				  <i class="fa fa-sign-in" aria-hidden="true"></i>
				  <span>Admin Login</span>
				</a>
              </div>
            </div>
          </div>
        </div>
        </div>
      </div>
      <div class="header_bottom">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="full">
                <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand " href="index.html"><img width="120" src="images/logo_main.png" alt="#" /></a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class=""> </span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav">
                <li class="nav-item active">
                  <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="about.html">About</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="services.html">Services</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="news.jsp">Reviews</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="contact.html">Register</a>
                </li>
                <li class="nav-item">
                  <a target="_blank" class="nav-link" href="jsp/login.html">Login</a>
                </li>
              </ul>
            </div>
          </nav>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
    <!-- end header section -->
    
  </div><br><br>

  <!-- Review section -->

  <section class="news_section ">
    <div class="container">
      <div class="heading_container">
        <h2>
          Customer <span>Rating & </span>Reviews
        </h2><br>

    <table border="1" style="border-collapse: collapse; width: 50%; text-align: center; border-style: groove;">
    <tr style="background-color: #f2f2f2;">
    	<th style="padding: 8px;">Customer ID</th>
        <th style="padding: 8px;">Rating</th>
        <th style="padding: 8px;">Message</th>
    </tr>
    
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                // Load the database driver (you only need to load it once)
                Class.forName("com.mysql.jdbc.Driver");

                // Establish a database connection
                String URL = "jdbc:mysql://localhost:3306/movehome";
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(URL, "root", "");

                // Create a SQL statement
                String sql = "SELECT * FROM reviews"; // Modify your SQL query as needed
                stmt = conn.createStatement();

                // Execute the query
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
                	int id = rs.getInt("id");
                    int rating = rs.getInt("rating");
                    String message = rs.getString("message");
        %>
                    <tr>
                    	<td><%= id %></td>
                        <td><%= rating %>&#9733;</td>
                        <td><%= message %></td>
                    </tr>
        <%
                } 

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close resources
                try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
                try { if (stmt != null) stmt.close(); } catch (Exception e) { e.printStackTrace(); }
                try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
            }
        %>
    </table>
      </div>
      
    </div>
  </section>

  <!-- end review section -->
  
<br><br>
  <!-- footer section -->
  <footer class="footer_section">
    <div class="container">
     <a href="index.html" class="footer-brand">
        <img src="images/logo_main.png" alt="#" />
      </a>
      <div class="col-lg-10 mx-auto px-0">
        <div class="footer_items">
          <div class="row">
            <div class="col-md-4">
              <a target="_blank" href="https://goo.gl/maps/fApY8KtUCVfTNU8ZA">
                <div class="item ">
                  <div class="img-box ">
                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                  </div>
                  <p>
                    Move Home is simply
                  </p>
                </div>
              </a>
            </div>
            <div class="col-md-4">
              <a target="_blank" href="tel:+91 6360237711" class="call-link">
                <div class="item ">
                  <div class="img-box ">
                    <i class="fa fa-phone" aria-hidden="true"></i>
                  </div>
                  <p>
                    +91 6360237711
                  </p>
                </div>
              </a>
            </div>
            <div class="col-md-4">
              <a target="blank" href="http://www.gmail.com">
                <div class="item ">
                  <div class="img-box">
                    <i class="fa fa-envelope" aria-hidden="true"></i>
                  </div>
                  <p>
                    muralidhara@gmail.com
                  </p>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
      <div class="social-box">
        <h4>
          Follow Us On
        </h4>
        <div class="box">
          <a target="blank" href="http://www.facebook.com">
            <i class="fa fa-facebook" aria-hidden="true"></i>
          </a>
          <a target="blank" href="http://www.twitter.com">
            <i class="fa fa-twitter" aria-hidden="true"></i>
          </a>
          <a target="blank" href="http://www.youtube.com">
            <i class="fa fa-youtube" aria-hidden="true"></i>
          </a>
          <a target="blank" href="http://www.instagram.com">
            <i class="fa fa-instagram" aria-hidden="true"></i>
          </a>
          <a target="blank" href="http://www.google.com">
            <i class="fa fa-google-plus" aria-hidden="true"></i>
          </a>
        </div>
      </div>
      <div class="col-lg-10 mx-auto px-0">
        <div class="footer_form">
          <h4>
            Enquiry Box
          </h4>
          <form action="jsp/enquiry.jsp">
            <input type="text" name="email" placeholder="Enter Your Email" />
            <input type="text" name="message" placeholder="Message/Question" />
            <button type="submit">
              Submit
            </button>
          </form>
        </div>
      </div>
    </div>
    <div class="footer-info">
      <div class="container">
        <p>
          &copy; <span id="displayYear"></span> All Rights Reserved 
          <a href="https://html.design/"></a>
        </p>
      </div>
    </div>
  </footer>
  <!-- footer section -->

  <!-- jQery -->
  <script src="js/jquery-3.4.1.min.js"></script>
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap"></script>
  <!-- End Google Map -->
</body>

</html>