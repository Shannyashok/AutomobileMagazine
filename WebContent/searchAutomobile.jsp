<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Automobile</title>
</head>
<script type="text/javascript">
function submitForm(action){
	document.getElementById("action").value =action;
	if(action == "Delete"){
		if(confirm("Are you sure to delete record ?"))
			document.forms(0).submit();
	}else
		document.forms(0).submit();
}
</script>
<jsp:useBean id="adv" class="com.ntu.auto.magazine.filter.SearchFilter" scope="request"></jsp:useBean>
<body>
<form action="searchAutomobile" method="post">
<input type="hidden" name="action" id="action">
<table id="inputform" align="center">
<tr>
 	<th align="left">Category</th>
 	<td>
 		<select id="category" name="category">
 			<option value="">---SELECT---</option>
 			<option value="Sports Car" <%="Sports Car".equals(adv.getCategory())?"selected":"" %>>Sports Car</option>
 			<option value="Passenger Car" <%="Passenger Car".equals(adv.getCategory())?"selected":"" %>>Passenger Car</option>
 			<option value="Hybrid Car" <%="Hybrid Car".equals(adv.getCategory())?"selected":"" %>>Hybrid Car</option>
 			<option value="SUV" <%="SUV".equals(adv.getCategory())?"selected":"" %>>SUV</option>
 			<option value="MPV" <%="MPV".equals(adv.getCategory())?"selected":"" %>>MPV</option>
 			<option value="Hatchback" <%="Hatchback".equals(adv.getCategory())?"selected":"" %>>Hatchback</option>
 			<option value="Others" <%="Others".equals(adv.getCategory())?"selected":"" %>>Others</option>
 		</select>
 	</td>
 
 	<th align="left">Make</th>
 	<td>
 	<select id="make" name="make">
 	    <option value="">---SELECT---</option>
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

 	<th align="left">Model</th>
 	<td><input type="text" id="model" name="model" value="<%=adv.getModel() %>" /></td>
 </tr>
 <tr>
 	<th align="left">Year of Manufacture</th>
 	<td><input type="text" id="makeYear" name="makeYear" value="<%=adv.getMakeYear() %>"/></td>

 	<th align="left">Year Registered</th>
 	<td><input type="text" id="registeredYear" name="registeredYear" value="<%=adv.getRegisteredYear() %>" /></td>

 	<th align="left">Engine Capacity</th>
 	<td><input type="text" id="engineCapacity" name="engineCapacity" value="<%=adv.getEngineCapacity()  %>" /> cc</td>
 </tr>
 <tr>
 	<th align="left">Gear</th>
 	<td>
 	<select id="gear" name="gear">
 		<option value="">---SELECT---</option>
 		<option value="Auto" <%="Auto".equals(adv.getGear())?"selected":"" %>>Auto</option>
 		<option value="Manual" <%="Manual".equals(adv.getGear())?"selected":"" %>>Manual</option>
 		
 	</select>
 	</td>

 	<th align="left">Mileage</th>
 	<td><input type="text" id="mileage" name="mileage" value="<%=adv.getMileage() %>"/> km/lt</td>

 	<th align="left">Price</th>
 	<td>S$ <input type="text" id="price" name="price" value="<%=adv.getPrice() %>"/></td>
 </tr>
 <tr>
 	<td colspan="6" align="center">
 	<input type="button" value="Search" onclick="javascript:submitForm('search');">
 	</td>
 </tr>
</table>
</form>
</body>
</html>