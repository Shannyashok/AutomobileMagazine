<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	 <link type="text/css" rel="stylesheet" href="styles/style.css" media="screen">
	 <link type="text/css" rel="stylesheet" href="styles/styleprint.css" media="print">
	 <title>Contact Us</title>
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
			 float : left;
			 clear : none;
			 height : 650px;
			 width : 300px;
			 background-color : NavajoWhite;
		}
		.pageContent{
			 float : left;
			 clear : none;
			 height : 650px;
			 width : 600px;
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
		dl{
		margin-left: 5px;
		}
	 </style>
	 </head>
	 <script type="text/javascript">
	 function sayThanks(){
		 alert('Thank you ! Your enquiry is submitted');
		 return true;
	 }
	 </script>
<body bgcolor="LightBlue">
<div class="blended_grid">
	  <div class="pageHeader">
	   <jsp:include page="/header.jsp"></jsp:include>
	  </div>
	  <div class="pageContent">
	  <div class="pagetitle" align="center">
	  <br/>
	  CONTACT
	  </div>
	  <p>
	  	Contact our Sales Team to get details on how you can advertise with us:
	  </p>
	  <p>
	  &nbsp;
	  </p>
	  <p>
	  	<dl> 
		   <dt>Address</dt> 
		   <dd>NTU Automobile Mart</dd> 
		   <dd>#11-1113, XYZ BLK</dd> 
		   <dd>Dummy Avenue</dd> 
		   <dd>Singapore</dd> 
		   <dt>Tel:</dt> 
		   <dd>+65 1234 5678</dd> 
		   <dt>Fax:</dt> 
		   <dd>+65 1234 5679</dd> 
		   <dt>Email:</dt>
		   <dd>customercare@mart.com.sg</dd>
		   <dt>Website</dt>
		   <dd>www.ntuautomart.com</dd>
		</dl>
	  </p>
	  <p>
	  	&nbsp;
	  </p>
	  <div class="pagetitle">
	  	Online Equiry
	  </div>
	  <hr/>
	  <form action="enquiry" method="post" onsubmit="return sayThanks()">
	  <table>
	  	<tr>
	  		<td width="300px">
	  		  <table id="inputform" >
	  	<tr>
	  		<td>Nature of Enquiry:
	  		<br>
	  		<select id="nature" name="nature">
	  			<option selected>--Select One--</option>
	  			<option value="Sales Related">Sales Related</option>
	  			<option value="Technical Issues">Technical Issues</option>
	  			<option value="General Feedback">General Feedback</option>
	  			<option value="Report Abuse">Report Abuse</option>
	  			<option value="Suggestion">Suggestion</option>
	  		</select>
	  		</br>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td>&nbsp;</td>
	  	</tr>
	  	<tr>
		 	<td>Name:
		 	<br><input type="text" id="name" name="name"/></td>
		</tr>
		<tr>
		    <td>&nbsp;</td>
		</tr>
		<tr>
		 	<td>Email:
		 	<br><input type="text" id="email" name="email" /></td>
		</tr>
		<tr>
		    <td>&nbsp;</td>
		</tr>
		 <tr>
		 	<td>Contact
		 	<br><input type="text" id="contact" name="contact" /></td>
 </tr>
	  </table>
	  		</td>
	  		<td width="300px">
	  			<table id="inputform">
	  				<tr>
	  					<td>Comments:
	  					<br>
	  					<textarea rows="11" cols="40" id="comments" name="comments"></textarea>
	  					</td>
	  				</tr>
	  				<tr>
	  					<td colspan="2" align="right">
	  					<input type="reset" value="RESET"/>
	  					<input type="submit" value="SUBMIT"/>
	  					</td>
	  				</tr>
	  			</table>
	  		</td>
	  	</tr>
	  </table>
	  </form>
	  </div>
	  <div class="pageLeftMenu">
	  <div class="pagetitle">
	  &nbsp;
	  </div>
	  <ul style="margin-left:15px" type="square">
	  	<li><a href="#" style="text-decoration: none">Our History</a></li>
	  	<li><a href="#" style="text-decoration: none">Top Management</a></li>
	  	<li><a href="#" style="text-decoration: none">Advertise With Us</a></li>
	  	<li><a href="#" style="text-decoration: none">Terms and Conditions</a></li>
	  	<li><a href="#" style="text-decoration: none">Privacy Policy</a></li>
	  	<li><a href="#" style="text-decoration: none">Personal Data Protection Statement</a></li>
	  </ul>
	  </div>
	  <div class="pageFooter">
	   <jsp:include page="/footer.jsp"></jsp:include>
	  </div>
</div>
</body>
</html>