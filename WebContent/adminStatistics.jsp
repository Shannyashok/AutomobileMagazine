<%@page import="com.ntu.auto.magazine.model.AdvStatisticsHolder"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	 <link type="text/css" rel="stylesheet" href="styles/style.css" media="screen">
	 <link type="text/css" rel="stylesheet" href="styles/styleprint.css" media="print">
	 <title>Admin Statistics</title>
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
		.pageContent{
			 float : left;
			 clear : none;
			 height : 650px;
			 width : 900px;
			 background-color : BlanchedAlmond;
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
<body bgcolor="LightBlue">
<%AdvStatisticsHolder holder = (AdvStatisticsHolder)request.getAttribute("holder"); %>
<div class="blended_grid">
	  <div class="pageHeader">
	   <jsp:include page="/header.jsp"></jsp:include>
	  </div>
	  <div class="pageContent">
	  <div class="sectiontitle">
	  	<marquee behavior="alternate">Admin Statistics</marquee>
	  </div>
	  <table class="inputform" width="100%" border="2px" cellpadding="2px" cellspacing="2px">
	  	<tr>
	  		<td>
	  			<table class="data">
	  				<thead>
	  				<tr>
	  					<th colspan="2">Ads Status</th>
	  				</tr>
	  				</thead>
	  				<tbody>
	  				<tr>
	  					<td>Published Ads</td>
	  					<td><%=holder.getPublish().get("1")!=null ?holder.getPublish().get("1"):"0" %></td>
	  				</tr>
	  				<tr>
	  					<td>Non Published Ads</td>
	  					<td><%=holder.getPublish().get("0")!=null ?holder.getPublish().get("0"):"0" %></td>
	  				</tr>
	  				</tbody>
	  			</table>
	  		</td>
	  		<td>
	  			<table class="data">
	  			    <thead>
	  				<tr>
	  					<th colspan="2">Automobile Status</th>
	  				</tr>
	  				</thead>
	  				<tbody>
	  				<tr>
	  					<td>Available Cars</td>
	  					<td><%=holder.getStatus().get("1")!=null ?holder.getStatus().get("1"): "0" %></td>
	  				</tr>
	  				<tr>
	  					<td>Sold Cars</td>
	  					<td><%=holder.getStatus().get("0")!=null ?holder.getStatus().get("0"): "0" %></td>
	  				</tr>
	  				</tbody>
	  			</table>
	  		</td>
	  	</tr>
	  </table>
	  <div class="pagetitle">
	  &nbsp;
	  </div>
	  <table class="inputform" width="100%" border="2px" cellpadding="2px" cellspacing="2px">
	  <tr>
	  		<td>
	  			<table class="data" border="1px">
	  				<thead>
	  				<tr>
	  					<th colspan="2">Category</th>
	  				</tr>
	  				</thead>
	  				<tbody>
	  				<%
	  				for (Map.Entry<String, Integer> entry : holder.getCategory().entrySet())
	  				{
	  				%>
	  				<tr>
	  					<td><%=entry.getKey() %></td>
	  					<td><%=entry.getValue() %></td>
	  				</tr>
	  				<%
	  				} 
	  				%>
	  				</tbody>
	  			</table>
	  		</td>
	  		<td>
	  			<table class="data"  border="1px">
	  			    <thead>
	  				<tr>
	  					<th colspan="2">Make</th>
	  				</tr>
	  				</thead>
	  				<tbody>
	  				<%
	  				for (Map.Entry<String, Integer> entry : holder.getMake().entrySet())
	  				{
	  				%>
	  				<tr>
	  					<td><%=entry.getKey() %></td>
	  					<td><%=entry.getValue() %></td>
	  				</tr>
	  				<%
	  				} 
	  				%>
	  				</tbody>
	  			</table>
	  		</td>
	  	</tr>
	  </table>
	  <div class="pagetitle">
	  &nbsp;
	  </div>
	  <table class="inputform" width="100%" border="2px" cellpadding="2px" cellspacing="2px">
	  <thead>
	  	<tr>
	  		<th colspan="2">General Statistics</th>
	  	</tr>
	  </thead>
	    <tr>
	  		<td>Total Revenue</td>
	  		<td>S$ <%=holder.getTotalRevenue() %></td>	
	  	</tr>
	  	<tr>
	  		<td>Total Ads Count</td>
	  		<td><%=holder.getTotalAdsCount() %></td>	
	  	</tr>
	  	<tr>
	  		<td>Total Enquiries</td>
	  		<td><%=holder.getEnquiryCount() %></td>	
	  	</tr>
	  </table>
	</div>
	<div class="pageFooter">
	   <jsp:include page="/footer.jsp"></jsp:include>
	  </div>
	</div>
</body>
</html>