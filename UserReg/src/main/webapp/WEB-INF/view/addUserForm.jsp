<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script await src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

<script type="text/javascript">
$(document).ready(function(event){
  $("#userEmail").blur(function(){
	  var email = $("#userEmail").val();
	  debugger;
    $.ajax({
			url:"/getAllEmaildetails",
			data:"email="+email,
			success: function (data) {
				if(data=="DUPLICATE") {
					}
					$("#emailMsg").append(data.firstName + ' ' + data.middleName + ' ' + data.lastName);
				}
			});
  });
});
</script>
	<h1>Registration Page</h1>

	<form:form action="/activepage" method="post" modelAttribute="loadForm">
		<table>
			<tr>
				<th>User-Name:</th>
				<td><form:input path="userName" /></td>
			</tr>
			<tr>
				<th>User-LastName:</th>
				<td><form:input path="userLastName" /></td>
			</tr>
			<tr>
				<th>Email:</th>
				<td><form:input path="userEmail" /></td>
				<span id="emailMsg" style="color:red;"> </span>
			</tr>
			<tr>
				<th>Mobile:</th>
				<td><form:input path="userPhonenumber" /></td>
			</tr>
			<tr>
				<th>Date-Of-Birth:</th>
				<td><input type="text" id="datepicker"></td>
			</tr>
			<tr>
				<th>Gender:</th>
				<td>Male:<form:radiobutton path="Gender" value="Male"
						id="gender" /> Female:<form:radiobutton path="Gender"
						value="female" id="gender" />
				</td>
			</tr>
			<tr>
				<th>Country:</th>
				<td><form:select path="countryId">
						<form:option value="">Select country</form:option>
						<form:options items="${allCountrys}" />
					</form:select></td>
			</tr>
			<tr>
				<th>State:</th>
				<td><select name="states" id="states">
						<option value="">Select State</option>
						<p id="demo"></p>
				</select></td>
			</tr>
			<tr>
				<th>City:</th>
				<td><select name="citys" id="citys"
					onchange="showCitys(this.value)">
						<option value="">Select a City</option>
				</select></td>
			</tr>

			<tr>
				<th></th>
				<td><input type="submit" value="Reset">&nbsp;<input
					type="submit" value="save"></td>
			</tr>
		</table>
	</form:form>
</body>
</html>