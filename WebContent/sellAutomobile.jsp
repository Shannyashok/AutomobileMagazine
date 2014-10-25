<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="styles/style.css" media="screen">
<link type="text/css" rel="stylesheet" href="styles/styleprint.css" media="print">
<title>Sell Automobile</title>
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
float : left;
clear : none;
height : 650px;
width : 900px;
background-color : BlanchedAlmond;
}
.bottomBanner{
background-color : rgb(255, 255, 255);
float : left;
clear : none;
height : 25px;
width : 900px;
}
</style>
</head>
<script type="text/javascript">
function submitForm(action){
	alert(action)
	document.getElementById("action").value=action;
	alert(document.getElementById("action").value);
	if(action == "Delete"){
		if(confirm("Are you sure to delete record ?"))
			document.forms(0).submit();
	}else
		document.forms(0).submit();
}
function openFileUpload() {
	var left = (screen.width/2)-(400/2);
	var top = (screen.height/2)-(200/2);
	var strWindowFeatures = "toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width= 400px, height=200px, top ="+top+", left="+left;
	var win = window.open("http://localhost:8080/NTUAutoMag/photoUploadServlet","fileUploadUtility", strWindowFeatures);
}
</script>
<jsp:useBean id="adv" class="com.ntu.auto.magazine.model.Advertisement" scope="request"></jsp:useBean>
<body bgcolor="LightBlue">
<div class="blended_grid">
<div class="topBanner">
<jsp:include page="/header.jsp"></jsp:include>
</div>
<div class="middleBanner">
<div class="pagetitle" align="center">
<br/>
Post your Advertisement
</div>
<form action="sellAutomobile" method="post" enctype="multipart/form-data">
<input type="hidden" name="action" id="action">
<table id="inputform" align="center">
<%
	String msg = (String)request.getAttribute("msg");
	if(msg!=null){
	%>
	<tr>
	<td colspan="2" align="center" style="font-size: 15px;font-family: calibri;font-style: bold;color: green">
		<strong><%=msg %></strong>
	</td>
	</tr>
	<%} %>
 <tr>
 	<td colspan="2">&nbsp;</td>
 </tr>
 <tr>
 	<td>Name*</td>
 	<td><input type="text" id="name" name="name" value=<%=adv.getName() %>></td>
 </tr>
 <tr>
 	<td>Email*</td>
 	<td><input type="text" id="email" name="email" value=<%=adv.getEmail() %>></td>
 </tr>
 <tr>
 	<td>Telephone*</td>
 	<td><input type="text" id="contact" name="contact" value=<%=adv.getContact() %>></td>
 </tr>
 <tr>
 	<td>Address</td>
 	<td><textarea rows="4" cols="20" id="address" name="address"><%=adv.getAddress() %></textarea></td>
 </tr>
 <tr>
 	<td>Location</td>
 	<td><input type="text" id="location" name="location" value=<%=adv.getLocation() %>></td>
 </tr>
 <tr>
 	<td>Title</td>
 	<td><input type="text" id="title" name="title" value=<%=adv.getLocation() %>></td>
 </tr>
 <tr>
 	<td>Category</td>
 	<td>
 		<select id="category" name="category">
 			<option value="-1">---SELECT---</option>
 			<option value="Sports Car" <%="Sports Car".equals(adv.getCategory())?"selected":"" %>>Sports Car</option>
 			<option value="Passenger Car" <%="Passenger Car".equals(adv.getCategory())?"selected":"" %>>Passenger Car</option>
 			<option value="Hybrid Car" <%="Hybrid Car".equals(adv.getCategory())?"selected":"" %>>Hybrid Car</option>
 			<option value="SUV" <%="SUV".equals(adv.getCategory())?"selected":"" %>>SUV</option>
 			<option value="MPV" <%="MPV".equals(adv.getCategory())?"selected":"" %>>MPV</option>
 			<option value="Hatchback" <%="Hatchback".equals(adv.getCategory())?"selected":"" %>>Hatchback</option>
 			<option value="Others" <%="Others".equals(adv.getCategory())?"selected":"" %>>Others</option>
 		</select>
 	</td>
 </tr>
 <tr>
 	<td>Make</td>
 	<td>
 	<select id="make" name="make">
 	    <option value="-1">---SELECT---</option>
 		<option value="Alpha Romeo" <%="Alpha Romeo".equals(adv.getMake())?"selected":"" %>>Alfa Romeo</option>
 		<option value="Aston Martin" <%="Aston Martin".equals(adv.getMake())?"selected":"" %>>Aston Martin</option>
 		<option value="Audi" <%="Audi".equals(adv.getMake())?"selected":"" %>>Audi</option>
 		<option value="Bently" <%="Bently".equals(adv.getMake())?"selected":"" %>>Bently</option>
 		<option value="BMW" <%="BMW".equals(adv.getMake())?"selected":"" %>>BMW</option>
 		<option value="Chery" <%="Chery".equals(adv.getMake())?"selected":"" %>>Chery</option>
 		<option value="Chevrolet" <%="Chevrolet".equals(adv.getMake())?"selected":"" %>>Chevrolet</option>
 		<option value="Daimler" <%="Daimler".equals(adv.getMake())?"selected":"" %>>Daimler</option>
 		<option value="Dodge" <%="Dodge".equals(adv.getMake())?"selected":"" %>>Dodge</option>
 		<option value="Ferrari" <%="Ferrari".equals(adv.getMake())?"selected":"" %>>Ferrari</option>
 		<option value="Fiat" <%="Fiat".equals(adv.getMake())?"selected":"" %>>Fiat</option>
 		<option value="Ford" <%="Ford".equals(adv.getMake())?"selected":"" %>>Ford</option>
 		<option value="Geely" <%="Geely".equals(adv.getMake())?"selected":"" %>>Geely</option>
 		<option value="Honda" <%="Honda".equals(adv.getMake())?"selected":"" %>>Honda</option>
 		<option value="Hyundai" <%="Hyundai".equals(adv.getMake())?"selected":"" %>>Hyundai</option>
 		<option value="Infiniti" <%="Infiniti".equals(adv.getMake())?"selected":"" %>>Infiniti</option>
 	</select>
 	</td>
 </tr>
 <tr>
 	<td>Model</td>
 	<td><input type="text" id="model" name="model" value="<%=adv.getModel() %>" /></td>
 </tr>
 <tr>
 	<td>Model Number</td>
 	<td><input type="text" id="modelNumber" name="modelNumber" value="<%=adv.getModelNumber() %>" /></td>
 </tr>
 <tr>
 	<td>Year of Manufacture</td>
 	<td><input type="text" id="makeYear" name="makeYear" value="<%=adv.getMakeYear() %>"/></td>
 </tr>
 <tr>
 	<td>Year Registered</td>
 	<td><input type="text" id="registeredYear" name="registeredYear" value="<%=adv.getRegisteredYear() %>" /></td>
 </tr>
 <tr>
 	<td>Engine Capacity</td>
 	<td><input type="text" id="engineCapacity" name="engineCapacity" value="<%=adv.getEngineCapacity()  %>" /> cc</td>
 </tr>
 <tr>
 	<td>Gear</td>
 	<td>
 	<select id="gear" name="gear">
 		<option value="-1">---SELECT---</option>
 		<option value="Auto" <%="Auto".equals(adv.getGear())?"selected":"" %>>Auto</option>
 		<option value="Manual" <%="Manual".equals(adv.getGear())?"selected":"" %>>Manual</option>
 		
 	</select>
 	</td>
 </tr>
 <tr>
 	<td>Mileage</td>
 	<td><input type="text" id="mileage" name="mileage" value="<%=adv.getMileage() %>"/> km/lt</td>
 </tr>
 <tr>
 	<td>Price</td>
 	<td>S$ <input type="text" id="price" name="price" value="<%=adv.getPrice() %>"/></td>
 </tr>
 <tr>
 	<td>Photos</td>
 	<td><a href="#" onclick="javascript:openFileUpload();"><b>Please upload photos</b></a></td>
 </tr>
 <tr>
 	<td>Additional Info</td>
 	<td><textarea rows="5" cols="50" id="additionalInfo" name="additionalInfo"><%=adv.getAdditionalInfo() %></textarea> </td>
 </tr>
 <tr>
 	<td colspan="2" align="center">
 	<input type="button" value="Submit" onclick="javascript:submitForm('add');">
 	</td>
 </tr>
 <tr>
 	<td colspan="2">&nbsp;</td>
 </tr>
 <tr>
 	<td colspan="2" bgcolor="yellow">
 	<b>Please note that advertisement will be listed upon the approval by site admin.</b>
 	</td>
 </tr>
</table>
</form>
</div>
<div class="bottomBanner">
<jsp:include page="/footer.jsp"></jsp:include>
</div>
</div>
</body>
</html>