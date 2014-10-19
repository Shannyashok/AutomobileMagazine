<%@page import="com.ntu.auto.magazine.model.Advertisement"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	 <link type="text/css" rel="stylesheet" href="styles/style.css" media="screen">
	 <link type="text/css" rel="stylesheet" href="styles/styleprint.css" media="print">
	 <title>NTU Automobile Magazine</title>
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
			 height : 600px;
			 width : 300px;
		}
		.pageContent{
			 background-color : rgb(255, 255, 255);
			 float : left;
			 clear : none;
			 height : 600px;
			 width : 600px;
		}
		.pageFooter{
			 background-color : rgb(255, 255, 255);
			 float : left;
			 clear : none;
			 height : 100px;
			 width : 900px;
		}
	 </style>
	 </head>
<body>
<%
List<Advertisement> advList = (List<Advertisement>)request.getAttribute("advList");
%>
<div class="blended_grid">
	  <div class="pageHeader">
	   <jsp:include page="/header.jsp"></jsp:include>
	  </div>
	  <div class="pageContent">
	  <p>
	  Welcome to "NTU Automobile Magazine".Best choice for buying, selling and renting cars, vans, any vehicle accessories and to be updated with the latest news.
	  The number one car classifieds for buying vehicles like sports car, hybrid car, COE cars, OPC Car, hatchback, stationwagon, MPV, SUV, van, truck &amp; parallel 
	  imported cars. Buy from new car dealer, parallel importer, car auction, etc.
	  </p>
	  </div>
	  <div class="pageLeftMenu">
	  <p>
	   <b>Latest</b>
	  </p>
	  <%if(advList != null && advList.size() >0 ){ %>
	   <ul>
	   <%for(Advertisement adv:advList) {%>
	    <li>
	     <b><%=adv.getTitle() %> :</b>
	     <p>
	      <%=adv.getAdditionalInfo() %>
	     </p>
	    </li>
	    <%} %>
	   </ul>
	   <p>
	   Click here for more >>
	   </p>
	  <%} %>
	  </div>
	  <div class="pageFooter">
	   <jsp:include page="/footer.jsp"></jsp:include>
	  </div>
</div>
</body>
</html>