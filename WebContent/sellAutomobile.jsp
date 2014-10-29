<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="adv" class="com.ntu.auto.magazine.model.Advertisement" scope="request"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
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
height : 700px;
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
.ui-widget { font-family: Verdana; font-size: 11px}
.scrollable{
   overflow: auto;
   width: 110px; /* adjust this width depending to amount of text to display */
   height: 80px; /* adjust height depending on number of options to display */
   border: 1px silver solid;
 }
 .scrollable select{
   border: none;
 }
 .overflow{
 height: 200px;
 }
</style>
</head>
<script type="text/javascript">
window.onload = function(){
	document.getElementById("advId").value=<%=adv.getAdvId() %>;
}
function submitForm(action){
	document.getElementById("action").value=action;
	document.getElementById("advId").value=<%=adv.getAdvId() %>;
	alert(document.getElementById("advId").value);
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
function validateForm(){
	var name = document.getElementById("name").value;
	name = name.replace(/\s/g, '');
	if(name == ''){
		alert('Please enter Name');
		return false;
	}
	var email = document.getElementById("email").value;
	email = email.replace(/\s/g, '');
	if(email == ''){
		alert('Please enter Email');
		return false;
	}
	var contact = document.getElementById("contact").value;
	contact = contact.replace(/\s/g, '');
	if(contact == ''){
		alert('Please enter Contact');
		return false;
	}
	var title = document.getElementById("title").value;
	title = title.replace(/\s/g, '');
	if(title == ''){
		alert('Please enter Title');
		return false;
	}
	var category = document.getElementById("category").options[document.getElementById("category").selectedIndex].value;
	if(category == '-1'){
		alert('Please select Category');
		return false;
	}
	var make = document.getElementById("make").options[document.getElementById("make").selectedIndex].value;
	if(make == '-1'){
		alert('Please select Make');
		return false;
	}
	var price = document.getElementById("price").value;
	price = price.replace(/\s/g, '');
	if(price == '' || price == '0.0'){
		alert('Please enter Price');
		return false;
	}
	return true;
}
</script>
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
<form action="sellAutomobile" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
<input type="hidden" name="action" id="action">
<input type="hidden" name="advId" id="advId">
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
 	<td>Title*</td>
 	<td><input type="text" id="title" name="title" value=<%=adv.getLocation() %>></td>
 </tr>
 <tr>
 	<td>Category*</td>
 	<td>
 		<select id="category" name="category" class=".ui-widget">
 			<option value="">---SELECT---</option>
 			<option value="Sports Car" <%="Sports Car".equals(adv.getCategory())?"selected":"" %>>Sports Car</option>
 			<option value="Passenger Car" <%="Passenger Car".equals(adv.getCategory())?"selected":"" %>>Passenger Car</option>
 			<option value="Hybrid Car" <%="Hybrid Car".equals(adv.getCategory())?"selected":"" %>>Hybrid Car</option>
 			<option value="SUV" <%="SUV".equals(adv.getCategory())?"selected":"" %>>SUV</option>
 			<option value="MPV" <%="MPV".equals(adv.getCategory())?"selected":"" %>>MPV</option>
 			<option value="Hatchback" <%="Hatchback".equals(adv.getCategory())?"selected":"" %>>Hatchback</option>
 			<option value="Mid-Sized Sedan" <%="Mid-Sized Sedan".equals(adv.getCategory())?"selected":"" %>>Mid-Sized Sedan</option>
 			<option value="Luxury Sedan" <%="Luxury Sedan".equals(adv.getCategory())?"selected":"" %>>Luxury Sedan</option>
 			<option value="Stationwagon" <%="Stationwagon".equals(adv.getCategory())?"selected":"" %>>Stationwagon</option>
 			<option value="Truck" <%="Truck".equals(adv.getCategory())?"selected":"" %>>Truck</option>
 			<option value="Van" <%="Van".equals(adv.getCategory())?"selected":"" %>>Van</option>
 			<option value="Bus/Mini Bus" <%="Bus/Mini Bus".equals(adv.getCategory())?"selected":"" %>>Bus/Mini Bus</option>
 			<option value="Others" <%="Others".equals(adv.getCategory())?"selected":"" %>>Others</option>
 		</select>
 	</td>
 </tr>
 <tr>
 	<td>Make*</td>
 	<td>
 	<select id="make" name="make"  class=".ui-widget">
 	    <option value="">---SELECT---</option>
 		<option value="Alpha Romeo" <%="Alpha Romeo".equals(adv.getMake())?"selected":"" %>>Alfa Romeo</option>
 		<option value="Aston Martin" <%="Aston Martin".equals(adv.getMake())?"selected":"" %>>Aston Martin</option>
 		<option value="Audi" <%="Audi".equals(adv.getMake())?"selected":"" %>>Audi</option>
 		<option value="Bently" <%="Bently".equals(adv.getMake())?"selected":"" %>>Bently</option>
 		<option value="BMW" <%="BMW".equals(adv.getMake())?"selected":"" %>>BMW</option>
 		<option value="Chery" <%="Chery".equals(adv.getMake())?"selected":"" %>>Chery</option>
 		<option value="Chevrolet" <%="Chevrolet".equals(adv.getMake())?"selected":"" %>>Chevrolet</option>
 		<option value="Chrysler" <%="Chrysler".equals(adv.getMake())?"selected":"" %>>Chrysler</option>
 		<option value="Citroen" <%="Citroen".equals(adv.getMake())?"selected":"" %>>Citroen</option>
 		<option value="Daihatsu" <%="Daihatsu".equals(adv.getMake())?"selected":"" %>>Daihatsu</option>
 		<option value="Dongfeng" <%="Dongfeng".equals(adv.getMake())?"selected":"" %>>Dongfeng</option>
 		<option value="Daimler" <%="Daimler".equals(adv.getMake())?"selected":"" %>>Daimler</option>
 		<option value="Dodge" <%="Dodge".equals(adv.getMake())?"selected":"" %>>Dodge</option>
 		<option value="Ferrari" <%="Ferrari".equals(adv.getMake())?"selected":"" %>>Ferrari</option>
 		<option value="Fiat" <%="Fiat".equals(adv.getMake())?"selected":"" %>>Fiat</option>
 		<option value="Ford" <%="Ford".equals(adv.getMake())?"selected":"" %>>Ford</option>
 		<option value="Geely" <%="Geely".equals(adv.getMake())?"selected":"" %>>Geely</option>
 		<option value="Golden Dragon" <%="Golden Dragon".equals(adv.getMake())?"selected":"" %>>Golden Dragon</option>
 		<option value="Hafei" <%="Hafei".equals(adv.getMake())?"selected":"" %>>Hafei</option>
 		<option value="Hino" <%="Hino".equals(adv.getMake())?"selected":"" %>>Hino</option>
 		<option value="Hummer" <%="Hummer".equals(adv.getMake())?"selected":"" %>>Hummer</option>
 		<option value="Honda" <%="Honda".equals(adv.getMake())?"selected":"" %>>Honda</option>
 		<option value="Hyundai" <%="Hyundai".equals(adv.getMake())?"selected":"" %>>Hyundai</option>
 		<option value="Infiniti" <%="Infiniti".equals(adv.getMake())?"selected":"" %>>Infiniti</option>
 		<option value="Isuzu" <%="Isuzu".equals(adv.getMake())?"selected":"" %>>Isuzu</option>
 		<option value="JAC" <%="JAC".equals(adv.getMake())?"selected":"" %>>JAC</option>
 		<option value="Jaguar" <%="Jaguar".equals(adv.getMake())?"selected":"" %>>Jaguar</option>
 		<option value="Jeep" <%="Jeep".equals(adv.getMake())?"selected":"" %>>Jeep</option>
 		<option value="Jinbei" <%="Jinbei".equals(adv.getMake())?"selected":"" %>>Jinbei</option>
 		<option value="Joylong" <%="Joylong".equals(adv.getMake())?"selected":"" %>>Joylong</option>
 		<option value="Kia" <%="Kia".equals(adv.getMake())?"selected":"" %>>Kia</option>
 		<option value="King Long" <%="King Long".equals(adv.getMake())?"selected":"" %>>King Long</option>
 		<option value="Lamborghini" <%="Lamborghini".equals(adv.getMake())?"selected":"" %>>Lamborghini</option>
 		<option value="Land Rover" <%="Land Rover".equals(adv.getMake())?"selected":"" %>>Land Rover</option>
 		<option value="Lexus" <%="Lexus".equals(adv.getMake())?"selected":"" %>>Lexus</option>
 		<option value="Lotus" <%="Lotus".equals(adv.getMake())?"selected":"" %>>Lotus</option>
 		<option value="Man" <%="Man".equals(adv.getMake())?"selected":"" %>>Man</option>
 		<option value="Maserati" <%="Maserati".equals(adv.getMake())?"selected":"" %>>Maserati</option>
 		<option value="Mazda" <%="Mazda".equals(adv.getMake())?"selected":"" %>>Mazda</option>
 		<option value="McLaren" <%="McLaren".equals(adv.getMake())?"selected":"" %>>McLaren</option>
 		<option value="Mercedes-Benz" <%="Mercedes-Benz".equals(adv.getMake())?"selected":"" %>>Mercedes-Benz</option>
 		<option value="MG" <%="MG".equals(adv.getMake())?"selected":"" %>>MG</option>
 		<option value="Mini" <%="Mini".equals(adv.getMake())?"selected":"" %>>Mini</option>
 		<option value="Mitsubishi" <%="Mitsubishi".equals(adv.getMake())?"selected":"" %>>Mitsubishi</option>
 		<option value="Mitsuoko" <%="Mitsuoko".equals(adv.getMake())?"selected":"" %>>Mitsuoko</option>
 		<option value="Morris" <%="Morris".equals(adv.getMake())?"selected":"" %>>Morris</option>
 		<option value="Morgan" <%="Morgan".equals(adv.getMake())?"selected":"" %>>Morgan</option>
 		<option value="Naza" <%="Naza".equals(adv.getMake())?"selected":"" %>>Naza</option>
 		<option value="Nissan" <%="Nissan".equals(adv.getMake())?"selected":"" %>>Nissan</option>
 		<option value="Opel" <%="Opel".equals(adv.getMake())?"selected":"" %>>Opel</option>
 		<option value="Perodua" <%="Perodua".equals(adv.getMake())?"selected":"" %>>Perodua</option>
 		<option value="Peugeot" <%="Peugeot".equals(adv.getMake())?"selected":"" %>>Peugeot</option>
 		<option value="Piaggio" <%="Piaggio".equals(adv.getMake())?"selected":"" %>>Piaggio</option>
 		<option value="Porshe" <%="Porshe".equals(adv.getMake())?"selected":"" %>>Porshe</option>
 		<option value="Porton" <%="Porton".equals(adv.getMake())?"selected":"" %>>Porton</option>
 		<option value="Renault" <%="Renault".equals(adv.getMake())?"selected":"" %>>Renault</option>
 		<option value="Rolls-Royce" <%="Rolls-Royce".equals(adv.getMake())?"selected":"" %>>Rolls-Royce</option>
 		<option value="Rover" <%="Rover".equals(adv.getMake())?"selected":"" %>>Rover</option>
 		<option value="Saab" <%="Saab".equals(adv.getMake())?"selected":"" %>>Saab</option>
 		<option value="Skoda" <%="Skoda".equals(adv.getMake())?"selected":"" %>>Skoda</option>
 		<option value="Skania" <%="Skania".equals(adv.getMake())?"selected":"" %>>Skania</option>
 		<option value="Smart" <%="Smart".equals(adv.getMake())?"selected":"" %>>Smart</option>
 		<option value="Suzuki" <%="Suzuki".equals(adv.getMake())?"selected":"" %>>Suzuki</option>
 		<option value="Toyota" <%="Toyota".equals(adv.getMake())?"selected":"" %>>Toyota</option>
 		<option value="Volkswagen" <%="Volkswagen".equals(adv.getMake())?"selected":"" %>>Volkswagen</option>
 		<option value="Volvo" <%="Volvo".equals(adv.getMake())?"selected":"" %>>Volvo</option>
 		<option value="Wuling" <%="Wuling".equals(adv.getMake())?"selected":"" %>>Wuling</option>
 		<option value="Youngman" <%="Youngman".equals(adv.getMake())?"selected":"" %>>Youngman</option>
 		<option value="Youtong" <%="Youtong".equals(adv.getMake())?"selected":"" %>>Youtong</option>
 		<option value="Zotye" <%="Zotye".equals(adv.getMake())?"selected":"" %>>Zotye</option>
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
 	<select id="gear" name="gear"  class="ui-widget">
 		<option value="Manual" selected>Manual</option>
 		<option value="Auto" <%="Auto".equals(adv.getGear())?"selected":"" %>>Auto</option>
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
 <%if(adv.getAdvId() == 0){ %>
 <tr>
 	<td>Photos</td>
 	<td><a href="#" onclick="javascript:openFileUpload();"><b>Please upload photos</b></a></td>
 </tr>
 <%} %>
 <%if(session.getAttribute("adminLogin")!=null){ %>
 <tr>	
 	<td>Status</td>
 	<td>
 	<select id="status" name="status" class="ui-widget">
 		<option value="1" selected>Available</option>
 		<option value="0" <%=(0 == adv.getAvailable())?"selected":"" %>>Sold</option>
 	</select>
 	</td>
 </tr>
 <%} %>
 <tr>
 	<td>Additional Info</td>
 	<td><textarea rows="5" cols="50" id="additionalInfo" name="additionalInfo"><%=adv.getAdditionalInfo() %></textarea> </td>
 </tr>
 <tr>
 	<td colspan="2" align="center">
 	<input type="submit" value="Submit">
 	<input type="reset" value="Clear">
 	</td>
 </tr>
 <tr>
 	<td colspan="2">&nbsp;</td>
 </tr>
  <%if(session.getAttribute("adminLogin") == null){ %>
 <tr>
 	<td colspan="2" bgcolor="yellow">
 	<b>Please note that advertisement will be listed upon the approval by site admin.</b>
 	</td>
 </tr>
  <%} %>
</table>
</form>
</div>
<div class="bottomBanner">
<jsp:include page="/footer.jsp"></jsp:include>
</div>
</div>
</body>
</html>