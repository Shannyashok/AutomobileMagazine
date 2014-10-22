<%@page import="java.io.File"%>
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
<title>Buy Automobile</title>
<style type="text/css">
.blended_grid{
			 display : block;
			 width : 900px;
			 overflow : auto;
			 margin : 30px auto 0 auto;
		}
.topBanner{
background-color : rgb(255, 255, 255);
float : left;
clear : none;
height : 50px;
width : 900px;
}
.middleBanner{
background-color : rgb(255, 255, 255);
float : left;
clear : none;
height : 100px;
width : 900px;
}
.leftBanner{
background-color : rgb(255, 255, 255);
clear : none;
height : 550px;
width : 900px;
overflow : auto;
}
.bottomBanner{
background-color : rgb(255, 255, 255);
float : left;
clear : none;
height : 25px;
width : 900px;
}
img{
		padding:1px;
		border:1px solid #021a40;
		background-color:#FFF8DC;
		}
</style>
</head>
<body bgcolor="BlanchedAlmond">
<%
List<Advertisement> advList = (List<Advertisement>)request.getAttribute("advList");
%>
<div class="blended_grid">
<div class="topBanner">
<jsp:include page="/header.jsp"></jsp:include>
</div>
<div class="middleBanner">
<jsp:include page="/searchAutomobile.jsp" flush="true"></jsp:include>
</div>
<div class="leftBanner">
<table class="data" align="center" cellpadding="2pt" cellspacing="2pt" border="2px"> 
	<thead>
		<tr>
			<td width="30%">Photo</td>
			<td width="70%">Summary</td>
		</tr>
	</thead>
	<tbody>
	<%
	if(advList != null && advList.size() >0){
	for(Advertisement adv:advList){
	%>
		<tr>
			<td align="center">
			<%
			File imgdir = new File(application.getRealPath("/") + "uploadPhotos" + File.separator + Long.valueOf(adv.getAdvId()).toString());
			String file = "";
			if(imgdir.exists() && imgdir.listFiles().length > 0){
			  for(File fi:imgdir.listFiles()){
				  file = fi.getName();
				  break;
			  }
			  
			if(file.length() > 0){
				String imgUrl = "http://localhost:8080/NTUAutoMag/uploadPhotos/"+Long.valueOf(adv.getAdvId()).toString()+"/"+file;
				%>
				 <a href="./viewAutomobile?advId=<%=adv.getAdvId() %>"><img src="<%=imgUrl %>" width="200px" height="100px"></img></a>
				<%
			}
			}
			%>
			<!-- 
			<br/>
			<a href="./viewAutomobile?advId=<%=adv.getAdvId() %>"><%=adv.getTitle() %></a>
			 -->
			</td>
			<td>
				<table>
					<tr>
						<td>Category:</td>
						<td><font color="FF6633"><%=adv.getCategory() %></font></td>
						<td>Make:</td>
						<td><font color="FF6633"><%=adv.getMake() %></font></td>
						<td>Model:</td>
						<td><font color="FF6633"><%=adv.getModel() %></font></td>
					</tr>
					<tr>
						<td>Engine:</td>
						<td><font color="FF6633"><%=adv.getEngineCapacity() %></font> cc</td>
						<td>Gear:</td>
						<td><font color="FF6633"><%=adv.getGear() %></font></td>
						<td>Year of Manufacture:</td>
						<td><font color="FF6633"><%=adv.getMakeYear() %></font></td>
					</tr>
					<tr>
						<td>Mileage:</td>
						<td><font color="FF6633"><%=adv.getMileage() %></font>  km/lt</td>
						<td>Price:</td>
						<td>S$ <font color="FF6633"><%=adv.getPrice() %></font></td>
						<td>Year of Registered:</td>
						<td><font color="FF6633"><%=adv.getRegisteredYear() %></font></td>
					</tr>
					<tr>
						<td><b>Additional Info:</b></td>
						<td colspan="5">
						<p>
							<%=adv.getAdditionalInfo() %>
						</p>
						</td>
					</tr>
					<tr>
						<td colspan="5"><a href="./viewAutomobile?advId=<%=adv.getAdvId() %>">More...</a></td>
					</tr>
				</table>
			</td>
		</tr>
	<%}}else{ %>
		<tr>
			<td colspan="2">
				No Records found.
			</td>
		</tr>
	<%} %>
	</tbody>
</table>
</div>
<div class="bottomBanner">
<jsp:include page="/footer.jsp"></jsp:include>
</div>
</div>
</body>
</html>