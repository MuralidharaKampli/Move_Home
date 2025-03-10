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

<body>
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
				<a target="_blank" style="float: right; margin-right: 0px;" href="http://localhost:8081/Move_Home/jsp/admin.html">
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
    
    <!-- slider section -->
    <section class="slider_section ">
      <div id="customCarousel1" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="container ">
              <div class="row">
                <div class="col-md-9 col-lg-6">
                  <div class="detail-box">
                    <h1>
                      Best Moving Service
                    </h1>
                    <p>
                      A packer and mover service, also known as a Move Home company or relocation service, is a professional service that specializes in assisting individuals and businesses with the process of relocating from one place to another.
                    </p>
                    <div class="btn-box">
                      
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <div class="container ">
              <div class="row">
                <div class="col-md-9 col-lg-6">
                  <div class="detail-box">
                    <h1>
                      Best Furniture Disassembly and Assembly
                    </h1>
                    <p>
                      They can disassemble large furniture items like beds and cabinets before transport and reassemble them at the new location.
                    </p>
                    <div class="btn-box">
                      
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <div class="container ">
              <div class="row">
                <div class="col-md-9 col-lg-6">
                  <div class="detail-box">
                    <h1>
                      Best Transportation
                    </h1>
                    <p>
                      Moving companies provide transportation for your belongings, often with a variety of truck sizes to accommodate different needs.
                    </p>
                    <div class="btn-box">
                      
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="carousel_btn-box">
          <a class="carousel-control-prev" href="#customCarousel1" role="button" data-slide="prev">
            <i class="fa fa-angle-left" aria-hidden="true"></i>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#customCarousel1" role="button" data-slide="next">
            <i class="fa fa-angle-right" aria-hidden="true"></i>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>
    </section>
    <!-- end slider section -->
  </div>

  <!-- about section -->

  <section class="about_section layout_padding">
    <div class="container  ">
      <div class="row">
        <div class="col-md-6 ">
          <div class="img-box">
            <img src="images/about-img.jpg" alt="">
          </div>
        </div>
        <div class="col-md-6">
          <div class="detail-box">
            <div class="heading_container">
              <h2>
                We Are <span>Move Home</span>
              </h2>
            </div>
            <p>
              A top-tier home moving company is more than just a service; it's a trusted partner in the journey of transition and transformation. With a seamless blend of professionalism, expertise, and unwavering commitment, these companies orchestrate the delicate symphony of relocation with finesse. From the moment you engage their services, you're enveloped in a sense of assurance, knowing that every cherished possession, every piece of furniture, and every memory-laden item will be treated with utmost care. Their proficient teams, armed with precision and attention to detail, handle the intricate dance of packing, loading, transporting, and unloading, transforming the often daunting process of moving into a graceful and stress-free experience. Beyond the logistical excellence, these companies offer a refuge of reliability, ensuring that your new beginning unfolds seamlessly, making them the unsung heroes of the journey to a new home.
            </p>
            <a target="blank" href="https://cloudpackers.com/blog/what-is-packers-and-movers/">
              Read More
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end about section -->

  <!-- service section -->

  <section class="service_section layout_padding-bottom">
    <div class="service_container">
      <div class="container ">
        <div class="heading_container heading_center">
          <h2>
            Our <span>Services</span>
          </h2>
          <p>
            Move home services streamline the complex process of relocating, turning the daunting task of moving into a hassle-free experience.
          </p>
        </div>
        <div class="row">
          <div class="col-sm-6 col-lg-4 mx-auto ">
            <div class="box ">
              <div class="img-box">
                <img src="images/s1.png" alt="">
              </div>
              <div class="detail-box">
                <h5>
                  Residential Moves
                </h5>
                <p>
                  A residential move, often referred to as a household move or home relocation, is the process of relocating one's residence and personal belongings from one location to another. This type of move can occur for various reasons, such as changing jobs, upgrading to a larger home, downsizing, or simply seeking a change in scenery.
                </p>
                <a target="_blank""  href="https://en.wikipedia.org/wiki/Moving">
                  Read More
                  <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                </a>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 mx-auto ">
            <div class="box ">
              <div class="img-box">
                <img src="images/s2.png" alt="">
              </div>
              <div class="detail-box">
                <h5>
                  Office Relocation
                </h5>
                <p>
                  Office relocation, also known as office move, is the process of moving a business from one physical location to another. This can involve moving an entire office, including furniture, equipment, files, and personnel, to a new space. Office relocations can occur for various reasons like seeking a more suitable location.
                </p>
                <a target="_blank" href="https://en.wikipedia.org/wiki/Relocation">
                  Read More
                  <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                </a>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 mx-auto ">
            <div class="box ">
              <div class="img-box">
                <img src="images/s3.png" alt="">
              </div>
              <div class="detail-box">
                <h5>
                  Long Distance Moves
                </h5>
                <p>
                  A long-distance move, also known as an interstate or cross-country move, is a significant relocation that involves moving one's home or business across a substantial distance. Long-distance moves can be complex ,This type of move typically spans state lines, regions, or even countries. 
                </p>
                <a target="_blank" href="https://en.wikipedia.org/wiki/Long_distance">
                  Read More
                  <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
        <div class="btn-box">
          <a target="_blank" href="https://golden.com/wiki/Packers_and_Movers-MNVMGV3">
            View More
          </a>
        </div>
      </div>
    </div>
  </section>

  <!-- end service section -->


  <!-- call section -->

  <section class="call_section ">
    <div class="container  ">
      <div class="row">
        <div class="col-md-6 ">
          <div class="img-box">
            <img src="images/call-img.jpg" alt="">
          </div>
        </div>
        <div class="col-md-6">
          <div class="detail-box">
            <h5>
              Call Us Today
            </h5>
            <h3>
              +91 6360237711
            </h3>
            <p>
              we invite you to connect with us at any time, making your relocation as effortless as possible. Our experienced and accommodating customer service team is available to provide you with personalized assistance, answer your inquiries, and guide you through every step of your move. 
            </p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end call section -->

  <!-- faq section -->

  <section class="faq_section layout_padding">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <div class="detail-box">
            <div class="heading_container">
              <h2>
                Frequently Asked <span>Questions</span>
              </h2>
            </div>
            <p>
              One common frequently asked question (FAQ) regarding Move Home services is, "How can I ensure the safety of my belongings during the move?" It's natural to be concerned about the security of your possessions. To address this, reputable Move Home typically have measures in place. They employ trained professionals who handle your items with care, use proper packing materials, and secure your belongings in transit. 
            </p>
            <a target="_blank" href="https://www.rehousingpackers.in/faq-frequently-asked-questions.php">
              Read More
            </a>
          </div>
        </div>
        <div class="col-md-6">
          <div class="faq_container">
            <div class="accordion" id="faqAccordion">
              <div class="card">
                <div class="card-header" id="faqItem1Header">
                  <h5 class="mb-0">
                    <button class="  collapsed" type="button" data-toggle="collapse" data-target="#faqItem1" aria-expanded="false" aria-controls="faqItem1">
                      How does the Move Home app work?
                    </button>
                  </h5>
                </div>
                <div id="faqItem1" class="collapse" aria-labelledby="faqItem1Header" data-parent="#faqAccordion">
                  <div class="card-body">
                    <p>
                      The Move Home app simplifies the moving process by allowing users to book and manage moving services through their smartphones. Users can select services, receive cost estimates, communicate with service providers, make payments, and leave feedback all within the app, making the moving experience more convenient and efficient.
                    </p>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header" id="faqItem2Header">
                  <h5 class="mb-0">
                    <button class=" " type="button" data-toggle="collapse" data-target="#faqItem2" aria-expanded="false" aria-controls="faqItem2">
                       How can I book a Move Home service using the app?
                    </button>
                  </h5>
                </div>
                <div id="faqItem2" class="collapse " aria-labelledby="faqItem2Header" data-parent="#faqAccordion">
                  <div class="card-body">
                    <p>
						Booking a Move Home service through the app is a straightforward process. Upon downloading the app and registering, you can easily select the specific moving services you require. Next, input essential details like your moving date and pickup/delivery locations. The app will then provide you with a cost estimate, which you can review and adjust as needed. Once satisfied, you can confirm your booking, typically by making a deposit or payment within the app. This secures your moving date and services, ensuring a smooth relocation experience managed right from your smartphone.
                    </p>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header" id="faqItem3Header">
                  <h5 class="mb-0">
                    <button class="  collapsed" type="button" data-toggle="collapse" data-target="#faqItem3" aria-expanded="false" aria-controls="faqItem3">
                      Are the Move Home licensed and insured?
                    </button>
                  </h5>
                </div>
                <div id="faqItem3" class="collapse" aria-labelledby="faqItem3Header" data-parent="#faqAccordion">
                  <div class="card-body">
                    <p>
						Yes, Move Home are licensed and insured. A licensed and insured moving company provides credibility and protection for your belongings during the move. Licensing indicates that the company complies with industry standards and regulations, while insurance offers coverage in case of unexpected incidents or damages during the relocation process. Always verify the credentials of your chosen Packers and Movers to guarantee a secure and reliable moving experience.
                    </p>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header" id="faqItem3Header">
                  <h5 class="mb-0">
                    <button class="  collapsed" type="button" data-toggle="collapse" data-target="#faqItem4" aria-expanded="false" aria-controls="faqItem4">
                      What happens if there are delays or damages during the move?
                    </button>
                  </h5>
                </div>
                <div id="faqItem4" class="collapse" aria-labelledby="faqItem3Header" data-parent="#faqAccordion">
                  <div class="card-body">
                    <p>
						In case of delays or damages during the move, it's important to communicate with your Move Home promptly. They typically have policies in place to address such situations. Delays may be due to unforeseen circumstances like traffic or weather, and the moving company should keep you informed. If damages occur, document them thoroughly with photos and descriptions, and report them to the moving company immediately. They should have a claims process to address and compensate for any damages incurred during the move, typically governed by their insurance policies and terms of service. It's important to understand these policies before your move to ensure a smooth resolution if any issues arise.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end faq section -->


  <!-- Registration section -->
  <section class="contact_section layout_padding">
    <div class="container">
      <div class="row">
        <div class="col-md-11 col-lg-9 mx-auto">
          <div class="map_form_container">
            <div class="form_container">
              <div class="heading_container heading_center">
                <h2 class="contact_heading">
                  Registration<span> Form</span>
                </h2>
              </div>
              <form target="_blank" action="jsp/submit.jsp">
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <input type="text" class="form-control" name="first_name" placeholder="First Name" />
                  </div>
                  <div class="form-group col-md-6">
                    <input type="text" class="form-control" name="last_name" placeholder="Last Name" />
                  </div>
                </div>
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <input type="text" class="form-control" name="email" placeholder="Email" />
                  </div>
                  <div class="form-group col-md-6">
                    <input type="password" class="form-control" name="password" placeholder="Password" />
                  </div>
                </div>
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <input type="text" class="form-control" name="phone_number" placeholder="Phone Number" />
                  </div>
                  <div class="form-group col-md-6">
                    <input type="text" class="form-control" name="city" placeholder="City" />
                  </div>
                </div>
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <input type="text" class="form-control" name="state" placeholder="State" />
                  </div>
                  <div class="form-group col-md-6">
                    <input type="text" class="form-control" name="pincode" placeholder="Pincode" />
                  </div>
                </div>
                <div class="form-group ">
                  <input type="text" class="message-box" name="address" placeholder="Full Address" />
                </div>
               
                <div class="btn-box">
                  <button type="submit" class="submit_btn">
                    Submit
                  </button>
                  
                </div>
              </form>
            </div>
            <div class="map_container">
              <div class="map">
                <div id="googleMap"></div>
              </div>
              <div class="btn-box">
                <button id="showForm" class="map_btn">
                  Form
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- end Registration section -->  
  
   <!-- Review section -->

  <section class="news_section">
    <div class="container">
        <div class="heading_container">
            <h2>Customer <span>Rating & </span>Reviews</h2>
            <br>
            <table border="1" style="border-collapse: collapse; width: 70%; text-align: center; border-style: groove; margin: auto;">
                <tr style="background-color: #f2f2f2;">
                    <th style="padding: 10px;">Customer ID</th>
                    <th style="padding: 10px;">Rating</th>
                    <th style="padding: 10px;">Message</th>
                </tr>

                <%
                    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movehome", "root", "root");
                         Statement stmt = conn.createStatement();
                         ResultSet rs = stmt.executeQuery("SELECT customer_id, rating, message FROM reviews LIMIT 10 OFFSET 0")) {
                        
                        if (!rs.isBeforeFirst()) { // Check if ResultSet is empty
                %>
                            <tr>
                                <td colspan="3" style="padding: 10px; color: red;">No reviews available</td>
                            </tr>
                <%
                        } else {
                            while (rs.next()) {
                %>
                                <tr>
                                    <td><%= rs.getInt("customer_id") %></td>
                                    <td><%= rs.getInt("rating") %> &#9733;</td>
                                    <td><%= rs.getString("message") %></td>
                                </tr>
                <%
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                %>
                        <tr>
                            <td colspan="3" style="padding: 10px; color: red;">Error fetching reviews!</td>
                        </tr>
                <%
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
  <script src="js/popper.min.js"></script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap"></script>
  <!-- End Google Map -->
</body>

</html>