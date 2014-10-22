<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	 <link type="text/css" rel="stylesheet" href="styles/style.css" media="screen">
	 <link type="text/css" rel="stylesheet" href="styles/styleprint.css" media="print">
	 <title>About Us</title>
	 <style type="text/css">
		.blended_grid{
			 display : block;
			 width : 900px;
			 overflow : auto;
			 margin : 30px auto 0 auto;
		}
		.pageHeader{
			 background-color : rgb(255, 255, 255);
			 float : left;
			 clear : none;
			 height : 50px;
			 width : 900px;
		}
		.pageLeftMenu{
			 background-color : rgb(255, 255, 255);
			 float : left;
			 clear : none;
			 height : 650px;
			 width : 300px;
		}
		.pageContent{
			 background-color : rgb(255, 255, 255);
			 float : left;
			 clear : none;
			 height : 650px;
			 width : 600px;
		}
		.pageFooter{
			 background-color : rgb(255, 255, 255);
			 float : left;
			 clear : none;
			 height : 25px;
			 width : 900px;
		}
		p{
		margin-left: 5px;
		}
	 </style>
	 </head>
<body bgcolor="AntiqueWhite">
<div class="blended_grid">
	  <div class="pageHeader">
	   <jsp:include page="/header.jsp"></jsp:include>
	  </div>
	  <div class="pageContent">
	  <div class="pagetitle" align="center">
	  ABOUT US
	  </div>
	  <p>
	  	NTU Automobile Mart is NTU's Number 1 Car site. It offers the largest database of new and used cars for sale in Singapore. This site is designed to attract more visitors willing to shop for the
	  	best available cars as per their choice.
	  </p>
	  <p>
	  	It is filled with the essential information for both car buyers and owners. With diverse sections, we cater to different people with different aspects of monitoring needs. We focus on our users needs
	  	and support them in every possible way.
	  </p>
	  <p>
	  	Visitors can browse through our vast listings of new and used cars, each attached with updated information and specifications.
	  </p>
	  <p>
	  	NTU Automobile Mart aims to be the most comprehensive and leading car portal offering choice options for all car buyers and motorists.
	  </p>
	  </div>
	  <div class="pageLeftMenu">
	  <div class="pagetitle">
	  &nbsp;
	  </div>
	  <ul style="margin-left:15px" type="square">
	  	<li><a href="#" style="text-decoration: none">Our History</a></li>
	  	<li><a href="#" style="text-decoration: none">Top Management</a></li>
	  	<li><a href="#" style="text-decoration: none">Advertise With Us</a></li>
	  	<li><a href="#" style="text-decoration: none">Terms and Conditions</a></li>
	  	<li><a href="#" style="text-decoration: none">Privacy Policy</a></li>
	  	<li><a href="#" style="text-decoration: none">Personal Data Protection Statement</a></li>
	  </ul>
	  </div>
	  <div class="pageFooter">
	   <jsp:include page="/footer.jsp"></jsp:include>
	  </div>
</div>
</body>
</html>