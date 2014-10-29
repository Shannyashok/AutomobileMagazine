<%@page import="java.io.File"%>
<%@page import="com.ntu.auto.magazine.model.Advertisement"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
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
height : 110px;
width : 900px;
background-color : NavajoWhite;
}
.leftBanner{
background-color : rgb(255, 255, 255);
clear : none;
height : 550px;
width : 900px;
overflow : auto;
background-color : BlanchedAlmond;
}
.pagination{
background-color : rgb(255, 255, 255);
float : left;
clear : none;
height : 20px;
width : 900px;
}
.bottomBanner{
background-color : rgb(255, 255, 255);
float : left;
clear : none;
height : 25px;
width : 900px;
}

.pg-normal {
color: black;
font-weight: normal;
text-decoration: none;    
cursor: pointer;    
}
.pg-selected {
color: black;
font-weight: bold;        
text-decoration: underline;
cursor: pointer;
}
.ui-widget { font-family: Verdana; font-size: 11px; }
.overflow{
 height: 200px;
 }
</style>
<script type="text/javascript">
$(function() {
    $( "#category" ).selectmenu({ width: 110 })
    .selectmenu( "menuWidget" )
    .addClass( "overflow" );
    $( "#gear" ).selectmenu({ width: 110 });
    $( "#status" ).selectmenu({ width: 110 });
    $( "#make" ).selectmenu({ width: 110 })
    .selectmenu( "menuWidget" )
    .addClass( "overflow" );
  });
</script>
<script type="text/javascript" src="js/paging.js"></script>
</head>
<body bgcolor="LightBlue">
<%
List<Advertisement> advList = (List<Advertisement>)request.getAttribute("advList");
%>
<div class="blended_grid">
<div class="topBanner">
<jsp:include page="/header.jsp"></jsp:include>
</div>
<div class="middleBanner">
<br/>
<jsp:include page="/searchAutomobile.jsp" flush="true"></jsp:include>
</div>
<div class="leftBanner">
<table id="results" class="data" align="center" border="1px"> 
	<thead>
		<tr>
			<td width="30%" align="center"><b>Photo</b></td>
			<td width="70%" align="center"><b>Summary</b></td>
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
				if(adv.getAvailable() == 0){
				%>
				<div style="width:200px;display:block;position:relative">
				 <a href="./viewAutomobile?advId=<%=adv.getAdvId() %>"><img src="<%=imgUrl %>" width="200px" height="100px"></img>
				 	<img src="images/sold_tag.gif" width="80" height="30" style="position:absolute; top:0px; right:0px" />
				</a>
				</div>
				 <%}else{ %>
				 <a href="./viewAutomobile?advId=<%=adv.getAdvId() %>"><img src="<%=imgUrl %>" width="200px" height="100px"></img></a>
				<%
				 }
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
<div id="pageNavPosition" class="pagination"></div>
<div class="bottomBanner">
<jsp:include page="/footer.jsp"></jsp:include>
</div>
</div>
<script type="text/javascript"><!--
        var pager = new Pager('results', 4); 
        pager.init(); 
        pager.showPageNav('pager', 'pageNavPosition'); 
        pager.showPage(1);
    //--></script>
</body>
</html>