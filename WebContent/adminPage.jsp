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
<title>Administration</title>
<script type="text/javascript">
$(function() {
    $( "#post" ).datepicker();
    $( "#approved" ).selectmenu({ width: 110 });
    $( "#category" ).selectmenu({ width: 110 })
    .selectmenu( "menuWidget" )
    .addClass( "overflow" );
    $( "#gear" ).selectmenu({ width: 110 });
    $( "#status" ).selectmenu({ width: 110 });
    $( "#make" ).selectmenu({ width: 110 })
    .selectmenu( "menuWidget" )
    .addClass( "overflow" );
  });
$(".reset").click(function() {
    $(this).closest('form').find("input[type=text], textarea, select").val("");
});
</script>
<style type="text/css">
.ui-widget { font-family: Verdana; font-size: 11px; }
.blended_grid{
			 display : block;
			 width : 1300px;
			 overflow : auto;
			 margin : 30px auto 0 auto;
		}
		.pageHeader{
			 background-color : rgb(255, 255, 255);
			 float : left;
			 clear : none;
			 height : 50px;
			 width : 1300px;
		}
		.pageContent{
			 float : left;
			 clear : none;
			 height : 700px;
			 width : 1300px;
			 background-color : BlanchedAlmond;
		}
		.pageFooter{
			 background-color : rgb(255, 255, 255);
			 float : left;
			 clear : none;
			 height : 25px;
			 width : 1300px;
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
.overflow{
 height: 200px;
 }
</style>
<script type="text/javascript" src="js/paging.js"></script>
</head>
<body bgcolor="LightBlue">
<div class="blended_grid">
<%
if(session.getAttribute("adminLogin") == null){
	response.sendRedirect("./adminLogin");
}
%>
<jsp:useBean id="search" class="com.ntu.auto.magazine.filter.SearchFilter" scope="request"></jsp:useBean>
<div class="pageHeader">
<jsp:include page="/header.jsp"></jsp:include>
</div>
<div class="pageContent">
<div class="sectiontitle" align="center">
Admin Search
</div>
<form action="adminSearch" method="post">
<table id="inputform" align="center">
<tr>
 	<th align="left">Category</th>
 	<td>
 		<select id="category" name="category" class=".ui-widget">
 			<option value="">---SELECT---</option>
 			<option value="Sports Car" <%="Sports Car".equals(search.getCategory())?"selected":"" %>>Sports Car</option>
 			<option value="Passenger Car" <%="Passenger Car".equals(search.getCategory())?"selected":"" %>>Passenger Car</option>
 			<option value="Hybrid Car" <%="Hybrid Car".equals(search.getCategory())?"selected":"" %>>Hybrid Car</option>
 			<option value="SUV" <%="SUV".equals(search.getCategory())?"selected":"" %>>SUV</option>
 			<option value="MPV" <%="MPV".equals(search.getCategory())?"selected":"" %>>MPV</option>
 			<option value="Hatchback" <%="Hatchback".equals(search.getCategory())?"selected":"" %>>Hatchback</option>
 			<option value="Mid-Sized Sedan" <%="Mid-Sized Sedan".equals(search.getCategory())?"selected":"" %>>Mid-Sized Sedan</option>
 			<option value="Luxury Sedan" <%="Luxury Sedan".equals(search.getCategory())?"selected":"" %>>Luxury Sedan</option>
 			<option value="Stationwagon" <%="Stationwagon".equals(search.getCategory())?"selected":"" %>>Stationwagon</option>
 			<option value="Truck" <%="Truck".equals(search.getCategory())?"selected":"" %>>Truck</option>
 			<option value="Van" <%="Van".equals(search.getCategory())?"selected":"" %>>Van</option>
 			<option value="Bus/Mini Bus" <%="Bus/Mini Bus".equals(search.getCategory())?"selected":"" %>>Bus/Mini Bus</option>
 			<option value="Others" <%="Others".equals(search.getCategory())?"selected":"" %>>Others</option>
 		</select>
 	</td>
 
 	<th align="left">Make</th>
 	<td>
 	<select id="make" name="make" class=".ui-widget">
 	    <option value="">---SELECT---</option>
 		<option value="Alpha Romeo" <%="Alpha Romeo".equals(search.getMake())?"selected":"" %>>Alfa Romeo</option>
 		<option value="Aston Martin" <%="Aston Martin".equals(search.getMake())?"selected":"" %>>Aston Martin</option>
 		<option value="Audi" <%="Audi".equals(search.getMake())?"selected":"" %>>Audi</option>
 		<option value="Bently" <%="Bently".equals(search.getMake())?"selected":"" %>>Bently</option>
 		<option value="BMW" <%="BMW".equals(search.getMake())?"selected":"" %>>BMW</option>
 		<option value="Chery" <%="Chery".equals(search.getMake())?"selected":"" %>>Chery</option>
 		<option value="Chevrolet" <%="Chevrolet".equals(search.getMake())?"selected":"" %>>Chevrolet</option>
 		<option value="Chrysler" <%="Chrysler".equals(search.getMake())?"selected":"" %>>Chrysler</option>
 		<option value="Citroen" <%="Citroen".equals(search.getMake())?"selected":"" %>>Citroen</option>
 		<option value="Daihatsu" <%="Daihatsu".equals(search.getMake())?"selected":"" %>>Daihatsu</option>
 		<option value="Dongfeng" <%="Dongfeng".equals(search.getMake())?"selected":"" %>>Dongfeng</option>
 		<option value="Daimler" <%="Daimler".equals(search.getMake())?"selected":"" %>>Daimler</option>
 		<option value="Dodge" <%="Dodge".equals(search.getMake())?"selected":"" %>>Dodge</option>
 		<option value="Ferrari" <%="Ferrari".equals(search.getMake())?"selected":"" %>>Ferrari</option>
 		<option value="Fiat" <%="Fiat".equals(search.getMake())?"selected":"" %>>Fiat</option>
 		<option value="Ford" <%="Ford".equals(search.getMake())?"selected":"" %>>Ford</option>
 		<option value="Geely" <%="Geely".equals(search.getMake())?"selected":"" %>>Geely</option>
 		<option value="Golden Dragon" <%="Golden Dragon".equals(search.getMake())?"selected":"" %>>Golden Dragon</option>
 		<option value="Hafei" <%="Hafei".equals(search.getMake())?"selected":"" %>>Hafei</option>
 		<option value="Hino" <%="Hino".equals(search.getMake())?"selected":"" %>>Hino</option>
 		<option value="Hummer" <%="Hummer".equals(search.getMake())?"selected":"" %>>Hummer</option>
 		<option value="Honda" <%="Honda".equals(search.getMake())?"selected":"" %>>Honda</option>
 		<option value="Hyundai" <%="Hyundai".equals(search.getMake())?"selected":"" %>>Hyundai</option>
 		<option value="Infiniti" <%="Infiniti".equals(search.getMake())?"selected":"" %>>Infiniti</option>
 		<option value="Isuzu" <%="Isuzu".equals(search.getMake())?"selected":"" %>>Isuzu</option>
 		<option value="JAC" <%="JAC".equals(search.getMake())?"selected":"" %>>JAC</option>
 		<option value="Jaguar" <%="Jaguar".equals(search.getMake())?"selected":"" %>>Jaguar</option>
 		<option value="Jeep" <%="Jeep".equals(search.getMake())?"selected":"" %>>Jeep</option>
 		<option value="Jinbei" <%="Jinbei".equals(search.getMake())?"selected":"" %>>Jinbei</option>
 		<option value="Joylong" <%="Joylong".equals(search.getMake())?"selected":"" %>>Joylong</option>
 		<option value="Kia" <%="Kia".equals(search.getMake())?"selected":"" %>>Kia</option>
 		<option value="King Long" <%="King Long".equals(search.getMake())?"selected":"" %>>King Long</option>
 		<option value="Lamborghini" <%="Lamborghini".equals(search.getMake())?"selected":"" %>>Lamborghini</option>
 		<option value="Land Rover" <%="Land Rover".equals(search.getMake())?"selected":"" %>>Land Rover</option>
 		<option value="Lexus" <%="Lexus".equals(search.getMake())?"selected":"" %>>Lexus</option>
 		<option value="Lotus" <%="Lotus".equals(search.getMake())?"selected":"" %>>Lotus</option>
 		<option value="Man" <%="Man".equals(search.getMake())?"selected":"" %>>Man</option>
 		<option value="Maserati" <%="Maserati".equals(search.getMake())?"selected":"" %>>Maserati</option>
 		<option value="Mazda" <%="Mazda".equals(search.getMake())?"selected":"" %>>Mazda</option>
 		<option value="McLaren" <%="McLaren".equals(search.getMake())?"selected":"" %>>McLaren</option>
 		<option value="Mercedes-Benz" <%="Mercedes-Benz".equals(search.getMake())?"selected":"" %>>Mercedes-Benz</option>
 		<option value="MG" <%="MG".equals(search.getMake())?"selected":"" %>>MG</option>
 		<option value="Mini" <%="Mini".equals(search.getMake())?"selected":"" %>>Mini</option>
 		<option value="Mitsubishi" <%="Mitsubishi".equals(search.getMake())?"selected":"" %>>Mitsubishi</option>
 		<option value="Mitsuoko" <%="Mitsuoko".equals(search.getMake())?"selected":"" %>>Mitsuoko</option>
 		<option value="Morris" <%="Morris".equals(search.getMake())?"selected":"" %>>Morris</option>
 		<option value="Morgan" <%="Morgan".equals(search.getMake())?"selected":"" %>>Morgan</option>
 		<option value="Naza" <%="Naza".equals(search.getMake())?"selected":"" %>>Naza</option>
 		<option value="Nissan" <%="Nissan".equals(search.getMake())?"selected":"" %>>Nissan</option>
 		<option value="Opel" <%="Opel".equals(search.getMake())?"selected":"" %>>Opel</option>
 		<option value="Perodua" <%="Perodua".equals(search.getMake())?"selected":"" %>>Perodua</option>
 		<option value="Peugeot" <%="Peugeot".equals(search.getMake())?"selected":"" %>>Peugeot</option>
 		<option value="Piaggio" <%="Piaggio".equals(search.getMake())?"selected":"" %>>Piaggio</option>
 		<option value="Porshe" <%="Porshe".equals(search.getMake())?"selected":"" %>>Porshe</option>
 		<option value="Porton" <%="Porton".equals(search.getMake())?"selected":"" %>>Porton</option>
 		<option value="Renault" <%="Renault".equals(search.getMake())?"selected":"" %>>Renault</option>
 		<option value="Rolls-Royce" <%="Rolls-Royce".equals(search.getMake())?"selected":"" %>>Rolls-Royce</option>
 		<option value="Rover" <%="Rover".equals(search.getMake())?"selected":"" %>>Rover</option>
 		<option value="Saab" <%="Saab".equals(search.getMake())?"selected":"" %>>Saab</option>
 		<option value="Skoda" <%="Skoda".equals(search.getMake())?"selected":"" %>>Skoda</option>
 		<option value="Skania" <%="Skania".equals(search.getMake())?"selected":"" %>>Skania</option>
 		<option value="Smart" <%="Smart".equals(search.getMake())?"selected":"" %>>Smart</option>
 		<option value="Suzuki" <%="Suzuki".equals(search.getMake())?"selected":"" %>>Suzuki</option>
 		<option value="Toyota" <%="Toyota".equals(search.getMake())?"selected":"" %>>Toyota</option>
 		<option value="Volkswagen" <%="Volkswagen".equals(search.getMake())?"selected":"" %>>Volkswagen</option>
 		<option value="Volvo" <%="Volvo".equals(search.getMake())?"selected":"" %>>Volvo</option>
 		<option value="Wuling" <%="Wuling".equals(search.getMake())?"selected":"" %>>Wuling</option>
 		<option value="Youngman" <%="Youngman".equals(search.getMake())?"selected":"" %>>Youngman</option>
 		<option value="Youtong" <%="Youtong".equals(search.getMake())?"selected":"" %>>Youtong</option>
 		<option value="Zotye" <%="Zotye".equals(search.getMake())?"selected":"" %>>Zotye</option>
 	</select>
 	</td>
 	
 	<th align="left">Gear</th>
 	<td>
 	<select id="gear" name="gear" class=".ui-widget">
 		<option value="">---SELECT---</option>
 		<option value="Auto" <%="Auto".equals(search.getGear())?"selected":"" %>>Auto</option>
 		<option value="Manual" <%="Manual".equals(search.getGear())?"selected":"" %>>Manual</option>
 		
 	</select>
 	</td>

 	<th align="left">Approved</th>
 	<td>
 	<select id="approved" name="approved" class=".ui-widget">
 		<option value="">---SELECT---</option>
 		<option value="1" <%="1".equals(search.getApproved())?"selected":"" %>>Yes</option>
 		<option value="0" <%="0".equals(search.getApproved())?"selected":"" %>>No</option>
 	</select>
 	</td>
 	
 	<th align="left">Status</th>
 	<td>
 	<select id="status" name="status" class=".ui-widget">
 		<option value="">---SELECT---</option>
 		<option value="1" <%="1".equals(search.getStatus())?"selected":"" %>>Available</option>
 		<option value="0" <%="0".equals(search.getStatus())?"selected":"" %>>Sold</option>
 	</select>
 	</td>
 	
 	<th align="left">Post Date</th>
 	<td><input type="text" id="post" name="post" value="<%=search.getPostDate() %>"/></td>
 </tr>
 <tr>
	<th align="left">Model</th>
 	<td><input type="text" id="model" name="model" value="<%=search.getModel() %>" /></td>
 	
 	<th align="left">Year of Manufacture</th>
 	<td><input type="text" id="makeYear" name="makeYear" value="<%=search.getMakeYear() %>"/></td>

 	<th align="left">Year Registered</th>
 	<td><input type="text" id="registeredYear" name="registeredYear" value="<%=search.getRegisteredYear() %>" /></td>
 	
 	<th align="left">Engine Capacity</th>
 	<td><input type="text" id="engineCapacity" name="engineCapacity" value="<%=search.getEngineCapacity()  %>" /> cc</td>
 	
 	<th align="left">Mileage</th>
 	<td><input type="text" id="mileage" name="mileage" value="<%=search.getMileage() %>"/> km/lt</td>

 	<th align="left">Price</th>
 	<td>S$ <input type="text" id="price" name="price" value="<%=search.getPrice() %>" /></td>
 	
 </tr>
 <tr>
 	<td colspan="15" align="center">
 	<input type="submit" value="Search" />
 	<input type="reset" value="Clear" />
 	</td>
 </tr>
</table>
</form>
<div class="sectiontitle">
Advertisement List
</div>
<%
List<Advertisement> advList = (List<Advertisement>)request.getAttribute("advList");
%>
<table id="results" class="data" align="center" border="1px"> 
	<thead>
		<tr>
			<td width="20%" align="center"><b>Photo</b></td>
			<td width="70%" align="center"><b>Summary</b></td>
			<td width="10%" align="center"><b>Actions</b></td>
		</tr>
	</thead>
	<tbody>
	<%
	if(advList != null && advList.size() >0){
	for(Advertisement post:advList){
	%>
		<tr>
			<td align="center">
			<%
			File imgdir = new File(application.getRealPath("/") + "uploadPhotos" + File.separator + Long.valueOf(post.getAdvId()).toString());
			String file = "";
			if(imgdir.exists() && imgdir.listFiles().length > 0){
			  for(File fi:imgdir.listFiles()){
				  file = fi.getName();
				  break;
			  }
			  
			if(file.length() > 0){
				String imgUrl = "http://localhost:8080/NTUAutoMag/uploadPhotos/"+Long.valueOf(post.getAdvId()).toString()+"/"+file;
				if(post.getAvailable() == 0){
					%>
				<div style="width:200px;display:block;position:relative">
				 <a href="./viewAutomobile?advId=<%=post.getAdvId() %>"><img src="<%=imgUrl %>" width="200px" height="100px"></img>
				 	<img src="images/sold_tag.gif" width="80" height="30" style="position:absolute; top:0px; right:0px" />
				</a>
				</div>
				 <%}else{ %>
				 <a href="./viewAutomobile?advId=<%=post.getAdvId() %>"><img src="<%=imgUrl %>" width="200px" height="100px"></img></a>
				<%
				 }
			}
			}
			%>
			<!-- 
			<br/>
			<a href="./viewAutomobile?advId=<%=post.getAdvId() %>"><%=post.getTitle() %></a>
			 -->
			</td>
			<td>
				<table align="center" class="data">
					<tr>
						<td>Category:</td>
						<td><font color="FF6633"><%=post.getCategory() %></font></td>
						<td>Make:</td>
						<td><font color="FF6633"><%=post.getMake() %></font></td>
						<td>Model:</td>
						<td><font color="FF6633"><%=post.getModel() %></font></td>
					
						<td>Engine:</td>
						<td><font color="FF6633"><%=post.getEngineCapacity() %></font> cc</td>
						<td>Gear:</td>
						<td><font color="FF6633"><%=post.getGear() %></font></td>
						<td>Year of Manufacture:</td>
						<td><font color="FF6633"><%=post.getMakeYear() %></font></td>
					</tr>
					<tr>
						<td>Mileage:</td>
						<td><font color="FF6633"><%=post.getMileage() %></font>  km/lt</td>
						<td>Price:</td>
						<td>S$ <font color="FF6633"><%=post.getPrice() %></font></td>
						<td>Year of Registered:</td>
						<td><font color="FF6633"><%=post.getRegisteredYear() %></font></td>
					
						<td>Approved:</td>
						<td><font color="FF6633"><%=post.getApproved() == 1 ? "Yes" : "No"  %></font></td>
						<td>Post Date:</td>
						<td><font color="FF6633"><%=post.getPostedDate() %></font></td>
						<td>Status:</td>
						<td><font color="FF6633"><%=post.getAvailable() == 1 ? "Available" : "Sold" %></font></td>
					</tr>
					<!-- 
					<tr>
						<td colspan="15"><a href="./viewAutomobile?advId=<%=post.getAdvId() %>">More...</a></td>
					</tr>
					 -->
				</table>
			</td>
			<td>
				<table align="center" class="inputform" cellpadding="2px" cellspacing="2px">
					<tr>
						<td><a href="./adminView?action=view&advId=<%=post.getAdvId() %>"><img src="images/read.png" height="16" width="16" title="View Post"/></a></td>
						<td><a href="./adminView?action=edit&advId=<%=post.getAdvId() %>"><img src="images/pencil.png" height="16" width="16" title="Edit Post"/></a></td>
						<td><a href="./adminView?action=delete&advId=<%=post.getAdvId() %>"><img src="images/delete.png" height="16" width="16" title="Delete Post"/></a></td>
						<%if(post.getApproved() != 1){ %>
						<td><a href="./adminView?action=publish&advId=<%=post.getAdvId() %>"><img src="images/pub.gif" height="16" width="16" title="Publish Post"/></a></td>
						<%}else{ %>
						<td><a href="./adminView?action=unpublish&advId=<%=post.getAdvId() %>"><img src="images/unpub.gif" height="16" width="16" title="Un-Publish Post"/></a></td>
						<%} %>
					</tr>
				</table>
			</td>
		</tr>
	<%}}else{ %>
		<tr>
			<td colspan="3">
				No Records found.
			</td>
		</tr>
	<%} %>
	</tbody>
</table>
<div id="pageNavPosition" class="pagination"></div>
</div>
<div class="pageFooter">
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