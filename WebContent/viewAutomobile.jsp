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
<title>Automobile Details</title>
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
		.imageContent{
			 background-color : rgb(255, 255, 255);
			 float : left;
			 clear : none;
			 height : 450px;
			 width : 450px;
		}
		.pageContent{
			 background-color : BlanchedAlmond;
			 float : left;
			 clear : none;
			 height : 450px;
			 width : 450px;
		}
		.imageList{
			 background-color : rgb(255, 255, 255);
			 float : left;
			 clear : none;
			 height : 225px;
			 width : 900px;
		}
		.pageFooter{
			 background-color : rgb(255, 255, 255);
			 float : left;
			 clear : none;
			 height : 25px;
			 width : 900px;
		}
		.label{
			font-family: Verdana;
			font-style: bold;
			font-size: 11px;
		}
		.photo img {
		padding:1px;
		border:1px solid #021a40;
		background-color:#ff0;
		width :216px;
		height :225px;
		}
		.fixeddiv {
	    border: 1px solid #021a40;
	    display: none;
	    position: absolute;
	    position:absolute;
	    width:400px; /*image width */
	    height:400px; /*image height */
	    left:50%; 
	    top:50%;
	    margin-left:-250px; /*image width/2 */
	    margin-top:-250px; /*image height/2 */
		}
		.photo:hover  .fixeddiv {
		    display: block;
		    }
		.photo:hover  .fixeddiv img {
		    display: block;
		    width: 400px;
		    height: 400px;
		}
</style>
</head>
<%
Advertisement adv = (Advertisement)request.getAttribute("adv");
if(adv == null){
	adv = new Advertisement();
}
%>
<body bgcolor="LightBlue">
<div class="blended_grid">
	  <div class="pageHeader">
	   <jsp:include page="/header.jsp"></jsp:include>
	  </div>
	  <div class="imageContent">
	  			
	  			<%
			File imgdir = new File(application.getRealPath("/") + "uploadPhotos" + File.separator + Long.valueOf(adv.getAdvId()).toString());
			String file = "";
			String imglocation = "http://localhost:8080/NTUAutoMag/uploadPhotos/"+Long.valueOf(adv.getAdvId()).toString()+"/";
			if(imgdir.exists() && imgdir.listFiles().length > 0){
			  for(File fi:imgdir.listFiles()){
				  file = fi.getName();
				  break;
			  }
			  
			if(file.length() > 0){
				String imgUrl = imglocation +file;
				%>
				
				<img src="<%=imgUrl %>" width="450px" height="450px"></img>
				
				<%
			}
			}else{
			%>
					No images uploaded.
				
	  			<%} %>
	  </div>
	  <div class="pageContent">
	  <div align="center" class="pagetitle">
	   <br/>
	   <%=adv.getTitle() %>
	  </div>
	  <%if(session.getAttribute("adminLogin") != null){ %>
	  <table align="right" class="inputform" cellpadding="2px" cellspacing="2px">
					<tr>
						<td><a href="./adminView?action=edit&advId=<%=adv.getAdvId() %>"><img src="images/pencil.png" height="16" width="16" title="Edit Post"/></a></td>
						<td><a href="./adminView?action=delete&advId=<%=adv.getAdvId() %>"><img src="images/delete.png" height="16" width="16" title="Delete Post"/></a></td>
						<%if(adv.getApproved() != 1){ %>
						<td><a href="./adminView?action=publish&advId=<%=adv.getAdvId() %>"><img src="images/pub.gif" height="16" width="16" title="Publish Post"/></a></td>
						<%}else{ %>
						<td><a href="./adminView?action=unpublish&advId=<%=adv.getAdvId() %>"><img src="images/unpub.gif" height="16" width="16" title="Un-Publish Post"/></a></td>
						<%} %>
					</tr>
				</table>
	  <%} %>
	  	<table>
	  				<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td><b>Category:</b></td>
						<td><%=adv.getCategory() %></td>
					</tr>
					<tr>
						<td><b>Make:</b></td>
						<td><%=adv.getMake() %></td>
					</tr>
					<tr>
						<td><b>Model:</b></td>
						<td><%=adv.getModel() %></td>
					</tr>
					<tr>
						<td><b>Engine:</b></td>
						<td><%=adv.getEngineCapacity() %> cc</td>
					</tr>
					<tr>
						<td><b>Gear:</b></td>
						<td><%=adv.getGear() %></td>
					</tr>
					<tr>
						<td><b>Year of Manufacture:</b></td>
						<td><%=adv.getMakeYear() %></td>
					</tr>
					<tr>
						<td><b>Mileage:</b></td>
						<td><%=adv.getMileage() %> km/lt</td>
					</tr>
					<tr>
						<td><b>Price:</b></td>
						<td>S$ <%=adv.getPrice() %></td>
					</tr>
					<tr>
						<td><b>Year of Registered:</b></td>
						<td><%=adv.getRegisteredYear() %></td>
					</tr>
					</table>
					<p>
						&nbsp;
					</p>
					<table>
					<tr>
						<td><b>Name:</b></td>
						<td><%=adv.getName() %></td>
					</tr>
					<tr>
						<td><b>Email:</b></td>
						<td><%=adv.getEmail() %></td>
					</tr>
					<tr>
						<td><b>Contact:</b></td>
						<td><%=adv.getContact() %></td>
					</tr>
					<tr>
						<td><b>Address:</b></td>
						<td><%=adv.getAddress() %></td>
					</tr>
					<tr>
						<td><b>Location:</b></td>
						<td><%=adv.getLocation() %></td>
					</tr>
					</table>
					<p>
						&nbsp;
					</p>
					<table>
					<tr>
						<td><b>Additional Info:</b></td>
						<td colspan="5">
						<p>
							<%=adv.getAdditionalInfo() %>
						</p>
						</td>
					</tr>
				</table>
	  </div>
	  <div class="imageList">
	  <table>
	  <tr>
	  <%
	  if(imgdir.exists() && imgdir.listFiles().length >0){
	  for(File fi:imgdir.listFiles()){
	  %>
	  	<td>
	  	<div class="photo">
	  	<img src="<%=imglocation + fi.getName() %>"  />
	  	<div class="fixeddiv">
	  		<img src="<%=imglocation + fi.getName() %>" />
	  	</div>
	  	</div>
	  	</td>
	  
	  <%}}else{ %>
	  	<td colspan="4">
	  		No images uploaded.
	  	</td>
	  <%} %>
	  </tr>
	  </table>
	  </div>
	  <div class="pageFooter">
	   <jsp:include page="/footer.jsp"></jsp:include>
	  </div>
</div>
</body>
</html>