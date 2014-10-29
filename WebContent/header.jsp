<style type="text/css">
.menu{
	height:40px;
	margin:0 auto;
	font-size: 12px;
	text-transform:none;
	width:1000px;
	box-shadow: 0 3px 3px 3px #000;
	background-color:#eee;
	background-image: url(../images/bg.gif)!important;
	background-repeat: repeat-x;
	background-position: left top;
	border-radius:3px;
}
.menu a:hover{
border-bottom:none;
text-decoration:none;
background-color:#92CE6F;
font-size: 14px;
}
a{
text-decoration:none;
}
.logo{
background-image: url(../images/bg.gif)!important;
}
</style>
<%if(session.getAttribute("adminLogin") != null){ %>
<table width="100%">
<tr>
<td width="50%"><img src="images/logo_ntu_car.png" alt="NTU car mart" width="446px" height="50px"/></td>
<td width="10%" align="center" class="menu"><a href="./homePage">Web Home</a></td>
<td width="10%" align="center" class="menu"><a href="./adminSearch">Search</a></td>
<td width="10%" align="center" class="menu"><a href="./sellAutomobile">Post Adv.</a></td>
<td width="10%" align="center" class="menu"><a href="./aboutUs.jsp">About</a></td>
<td width="10%" align="center" class="menu"><a href="./contactUs.jsp">Contact</a></td>
</tr>
</table>
<%}else{ %>
<table width="100%">
<tr>
<td width="50%"><img src="images/logo_ntu_car.png" alt="NTU car mart" width="446px" height="50px"/></td>
<td width="8%" align="center"  class="menu"><a href="./homePage">Home</a></td>
<td width="8%" align="center"  class="menu"><a href="./buyAutomobile">Buy</a></td>
<td width="8%" align="center"  class="menu"><a href="./sellAutomobile?action=view">Sell</a></td>
<td width="8%" align="center"  class="menu"><a href="./aboutUs.jsp">About</a></td>
<td width="8%" align="center"  class="menu"><a href="./contactUs.jsp">Contact</a></td>
<td width="9%" align="center"  class="menu"><a href="./adminLogin">Admin Site</a></td>
</tr>
</table>
<%} %>