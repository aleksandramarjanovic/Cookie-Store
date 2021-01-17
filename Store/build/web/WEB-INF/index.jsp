<%-- 
    Document   : newjsp
    Created on : Jan 15, 2021, 6:40:30 PM
    Author     : zivko
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- site metas -->
<title>Cookies</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">	
<!-- bootstrap css -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<!-- style css -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- Responsive-->
<link rel="stylesheet" href="css/responsive.css">
<!-- fevicon -->
<link rel="icon" href="images/footer-img3.png" type="image/gif" />
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
<!-- Tweaks for older IEs-->
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<!-- owl stylesheets --> 
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">

</head>
<body style="padding: 3%">
    <header>
	<div class="layout_padding banner_section_start">
         <!-- header inner -->
         <div class="header">
            <div class="container">
               <div class="row">
                  <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                     <div class="full">
                        <div class="center-desk">
                           <div class="logo"><a href="#home"><img src="images/footer-img3.png" style="max-width: 40%;"></a>
                           </div>
                           
                        </div>
                     </div>
                  </div>
                       
                  <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                     <div class="menu-area">
                        <div class="limit-box">
                           <nav class="main-menu">
                              <ul class="menu-area-main">
                                 <li class="active"><a href="#home">Home</a></li>
                                 <li><a href="#gallery">gallery</a></li>
                                 <li><a href="#contact">Contact Us</a></li>
                              </ul>
                           </nav>
                        </div>
                     </div>
                 </div>
               </div>
            </div>
         </div>
         <!-- end header inner -->
         
	<!-- banner start-->
        <div class="layout_padding banner_section">
	    <div class="container">
                <div id="main_slider" class="carousel slide" data-ride="carousel">
                   <div class="carousel-inner">
                      <div class="carousel-item active">
                         <div class="row ">
			    <div class="col-md-6 taital">
			       <h1 class="taital">Sweet Home<strong class="banner_taital">Products that we choose for you</strong></h1>
                               <p class="lorem_text"> All cakes are homemade, made with special love...</p>
			    </div>
				<div class="col-md-6">
				   <div class="banner-image"><img src="images/cupcake-img.png" style="max-width: 100%;"></div>
				</div>
				 
			  </div>
                        </div>
                                 <div class="carousel-item">
                                   <div class="row ">
				     <div class="col-md-6 taital">
					<h1>Sweet Home<strong class="banner_taital">Items that we choose for you</strong></h1>
                                        <p class="lorem_text">
                                            We are not bakery, we just collect the best products in the country, and display them in one
                                            place. You can see our catalog on the page. One click or mail and your magic of taste can begin!
                                        </p>
				     </div>
				        <div class="col-md-6">
					   <div class="banner-image"><img src="images/cupcake-img.png" style="max-width: 100%;"></div>
				        </div>
			            </div>
                                   </div>
                                     <div class="carousel-item">
                                          <div class="row ">
                                            <div class="col-md-6 taital">
					      <h1>Quality<strong class="banner_taital">Products</strong></h1>
                                                 <p class="lorem_text"> The best products from all over the country. Chosen just for you, all that is left is to enjoy!</p>
				             </div>
				                <div class="col-md-6">
					          <div class="banner-image"><img src="images/cupcake-img.png" style="max-width: 100%;"></div>
				                </div>
			                   </div>
                                       </div>
                         </div>
                                      <a class="carousel-control-prev" href="#main_slider" role="button" data-slide="prev">
                                      <span class="carousel-control-prev-icon" aria-hidden="true"><i class="fa fa-angle-left"></i></span>
                                      <span class="sr-only">Previous</span>
                                      </a>
                                      <a class="carousel-control-next" href="#main_slider" role="button" data-slide="next">
                                       <span class="carousel-control-next-icon" aria-hidden="true"><i class="fa fa-angle-right"></i></span>
                                       <span class="sr-only">Next</span>
                                       </a>
                        </div>
                    </div>
                </div>
            </div>
	</header>
	<!-- banner end-->

	<!-- Gallery start-->
	<div id="gallery" class="layout_padding2 gallery_section">
            <div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<div class="gallery_main">
					    <h1 class="gallery_taital"><strong><span class="our_text">Our</span> Catalog</strong></h1>
                                            
                                            
					</div>
				</div>
                            <div class="col-sm-12 gallery_maain">
					<div class="row">
						<div class="col-sm-3 padding_0">
							<div class="gallery_blog" >
                                                              <c:if test="${fn:length(lista) > 0}">
                                                                <c:forEach var="item" items="${lista}" varStatus="loopCount">
                                                                    <c:if test="${loopCount.count eq 1}">
                                                                        <c:out value="Cookie id : ${item.id}" /></br>
                                                                        <c:out value="name : ${item.name}" /></br>
                                                                        <c:out value=" price: ${item.price}"/></br>
                                                                        <c:out value=" ${item.description}"/></br>
                                                                    </c:if>
                                                                  </c:forEach>
                                                                   </c:if>
								<img class="img-responive" src="images/Scone.jpg">
								<div class="overlay">
									<h2>Scones</h2>
								</div>
							</div>
						</div>
                                                        <div class="col-sm-3 padding_0">
                                                            <div class="gallery_blog">
                                                                 <c:if test="${fn:length(lista) > 0}">
                                                                    <c:forEach var="item" items="${lista}" varStatus="loopCount">
                                                                         <c:if test="${loopCount.count eq 2}">
                                                                           <c:out value="Cookie id : ${item.id}" /></br>
                                                                           <c:out value="name : ${item.name}" /></br>
                                                                            <c:out value=" price: ${item.price}"/></br>
                                                                            <c:out value=" ${item.description}"/></br>
                                                                            </c:if>
                                                                           </c:forEach> 
                                                                    </c:if>
                                                            <img class="img-responive" src="images/Tiramisu.jpg">
								<div class="overlay">
									<h2>Tiramisu cake</h2>
								</div>
							</div>
                                                        </div>
                                                               <div class="col-sm-3 padding_0">
                                                                    <div class="gallery_blog">
                                                                         <c:if test="${fn:length(lista) > 0}">
                                                                         <c:forEach var="item" items="${lista}" varStatus="loopCount">
                                                                            <c:if test="${loopCount.count eq 3}">
                                                                            <c:out value=" Cookie id : ${item.id}" /></br>
                                                                            <c:out value="name : ${item.name}" /></br>
                                                                            <c:out value=" price: ${item.price}"/></br>
                                                                            <c:out value=" ${item.description}"/></br>
                                                                            </c:if>
                                                                         </c:forEach>
                                                                         </c:if>
                                                                            <img class="img-responive" src="images/Chop2.jpg"/>
                                                                               <div class="overlay">
                                                                                   <h2>Choco Chips</h2>
                                                                                </div>
                                                                     </div>
                                                                  </div>
                                                                    <div class="col-sm-3 padding_0">
                                                                         <div class="gallery_blog">
                                                                             <c:if test="${fn:length(lista) > 0}">
                                                                             <c:forEach var="item" items="${lista}" varStatus="loopCount">
                                                                                <c:if test="${loopCount.count eq 4}">
                                                                                <c:out value="Cookie id : ${item.id}" /></br>
                                                                                <c:out value="name : ${item.name}"/></br>
                                                                                <c:out value=" price: ${item.price}"/></br>
                                                                                <c:out value=" ${item.description}"/></br>
                                                                                </c:if>
                                                                             </c:forEach>
                                                                             </c:if>
                                                                                <img class="img-responive" src="images/Muffin1.jpg">
                                                                                   <div class="overlay">
                                                                                        <h2>Muffins</h2>
                                                                                                </div>
                                                                                        </div>
                                                                   </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end Gallery-->
	
	<!-- Touch end-->
	<!-- contact start-->
    <div id="contact" class="contact_section">
    	<div class="container">	
    	<div class="contact-taital">
    		<div class="row">
    			<div class="col-sm-12">
    				<h1 class="contact_text"><strong>Contact Us</strong></h1>
    			</div>
    		</div>
    	</div>
    		<div class="row">	
    			<div class="col-sm-6 col-md-6 col-lg-3">
    				<h2 class="adderess_text">Adderess</h2>
    				<div class="image-icon"><img src="images/map-icon.png"><span class="email_text">Blok Vasilja Koprivica </span></div>
    				<div class="image-icon"><img src="images/phone-icon_1.png"><span class="email_text">(+090) 12345678</span></div>
    				<div class="image-icon"><img src="images/email-icon.png"><span class="email_text">aaaaaa@gmail.com</span></div>
    			</div>
                    	<div class="col-sm-6 col-md-6 col-lg-3">
    				<h2 class="adderess_text">Useful Links</h2>
    				<div class="image-icon"><img src="images/bulit-icon.png"><a class="email_text" href="https://www.allrecipes.com/recipe/10813/best-chocolate-chip-cookies/">Chocolate Chip Cookies</a></div>
    				<div class="image-icon"><img src="images/bulit-icon.png"><a class="email_text" href="https://sallysbakingaddiction.com/blueberry-oatmeal-muffins/">Blueberry Oatmeal Muffins </a></div>
                                <div class="image-icon"><img src="images/bulit-icon.png"><a class="email_text" href="https://www.delish.com/cooking/nutrition/g3211/healthy-cookies/">27 Healthy Cookies</a></div>
    				
    			</div>
    			<div class="col-sm-6 col-md-6 col-lg-3">
    				<div class="row">
    					<div class="col-md-6">
    						<div class="footer-img"><img src="images/footer-img1.png" style="width: 100%;"></div>
    					</div>
    					<div class="col-md-6">
    						<div class="footer-img"><img src="images/footer-img2.png" style="width: 100%;"></div>
    					</div>
    				</div>
    				<div class="row">
    					<div class="col-md-6">
    						<div class="footer-img"><img src="images/footer-img2.png" style="width: 100%;"></div>
    					</div>
    					<div class="col-md-6">
    						<div class="footer-img"><img src="images/footer4.png" style="width: 100%;"></div>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
	<!-- contact end-->
	<!-- copyright start-->
    <div class="copyright_section">
    	<div class="container">
    		<div class="row">
    			<div class="col-sm-12">
    				<p class="copyright_taital">2021. All Rights Reserved-Sweet Home</p>
    			</div>
    		</div>
    	</div>
    </div>


	<!-- copyright end-->

    <!-- Javascript files-->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <script src="js/plugin.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
      <!-- javascript --> 
      <script src="js/owl.carousel.js"></script>
      <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
      <script>
      $(document).ready(function(){
      $(".fancybox").fancybox({
         openEffect: "none",
         closeEffect: "none"
         });
         
         $(".zoom").hover(function(){
         
         $(this).addClass('transition');
         }, function(){
         
         $(this).removeClass('transition');
         });
         });
         </script> 

         <script>
     
</body>
</html>
