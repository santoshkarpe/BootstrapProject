

<!DOCTYPE html>
<html lang="en-US">
   	<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>

<style>
/*CSS for input textbox and password*/


input[type='text']
{
width: 200px;
height: 35px;
border-radius: 3px;
border: 1px solid #CCC;
padding: 8px;
font-weight: 200;
font-size: 15px;
font-family: Verdana;
box-shadow: 1px 1px 5px #CCC;
}

input[type='text']:hover
{
width: 200px;
height: 35px;
border-radius: 3px;
border: 1px solid #aaa;
padding: 8px;
font-weight: 200;
font-size: 15px;
font-family: Verdana;
box-shadow: 1px 1px 5px #CCC;
}

/*input type for submit button*/

input[type='button']
{
width: 150px;
height: 40px;
border: 2px solid white;
font-weight: 200;
font-size: 15px;
font-family: Verdana;
background-color:#CCC;
}
input[type='button']:hover
{
width: 150px;
height: 40px;
border: 2px solid #aaa;
font-weight: 200;
font-size: 15px;
font-family: Verdana;
background-color:#000000;
color:#fff;
}

/*Table*/
.outer {
    width: 960px;
    color: navy;
    background-color: #CCC;
    border: 2px solid #aaa;
    padding: 5px;
 }

</style>

<body>

<div ng-app="Register" ng-controller="register"> 
<h1>
		Register Details
</h1>

<% 
String username=request.getParameter("username");
String password=request.getParameter("password");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String address=request.getParameter("add");
String gender=request.getParameter("gen");
String country=request.getParameter("country");







//pageContext.setAttribute("UName", username, PageContext.SESSION_SCOPE);
//pageContext.setAttribute("UPassword", password, PageContext.SESSION_SCOPE);




%>

 
<div ng-app="Register" ng-controller="register"> 

	UserName   : <input type="label" ng-model="username"  value="<%=username%>"name="username" disabled><br>
	Password   : <input type="label" ng-model="password" value="<%=password%>"name="password" disabled><br>

	First Name : <input type="label" ng-model="fname" value="<%=fname%>"name="fname" disabled><br>
<p>	Last Name  : <input type="text" ng-model="lname"value="<%=lname%>" name="lname" disabled><br>
<p>	Address    : <input type="text" ng-model="add" value="<%=address%>"name="add" disabled><br>
<p>	Gender     : <input type="text" ng-model="gen" value="<%=gender%>"name="gen" disabled><br>
<p>	Country    : <input type="text" ng-model="country" value="<%=country%>"name="country" disabled><br>



<input type="button" ng-click="insert()" value="save">

<input type="button" ng-click="display()" value="Show Details">

<input type="button" ng-click="all()" value="Show All">

</form>
<table  align="center" border="1">
<tr>
		                     <b>   <td>First Name</td>
		                        <td>Last Name</td>
                                <td>Address</td>
                                <td>Gender</td>  
                                <td>Country</td>
                                  <td>User Name</td>
                          
						                              

</tr>

	<tr ng-repeat="x in employee">
						<td>{{x.fname}}</td>
						
						<td>{{x.lname}}</td>
						<td>{{x.address}}</td>
						<td>{{x.gender}}</td>
						
						<td>{{x.country}}</td>
						
						<td>{{x.username}}</td>
						
		
				</b>  			
   </tr>
</table>




<script>
var app = angular.module('Register', []);
app.controller('register', function($scope, $http) {
	$scope.flag = false;
	

	
	$scope.getuser = function() {
		alert("alay ekde");
	    $http.get("http://localhost:8080/LoginApp/users")
	    .success(function(response) {$scope.employee=response;});
	    $scope.users=null;
	    $scope.flag = true;
	 
	};

	$scope.insert = function() {
		
		
		
		alert("In insert...before .get");
	    $http.get("http://localhost:8080/LoginApp/login/"+$scope.username +"/"+$scope.password +"/"+$scope.fname +"/"+ $scope.lname+"/"+$scope.add+"/"+$scope.gen+"/"+$scope.country)
	    .success(function(response) {$scope.message=response;});
	    
	    alert("Message : "+ message);
	    
		alert("In insert...after .get");
	    $scope.users=null;
	    $scope.flag = true;
	 
	};
	
	
	
		$scope.display = function() {
			alert("In display");
		    $http.get("http://localhost:8080/LoginApp/details")
		    .success(function(response) {$scope.employee=response;});
		
		    $scope.users=null;
		    $scope.flag = true;
		 
		};
		
		
		$scope.all = function() {
			alert("alay ekde");
			
			$scope.employee=null;
		    $http.get("http://localhost:8080/LoginApp/details")
		    .success(function(response) {$scope.employee=response;});
		
		 
		    $scope.flag = true;
		 
		}; 
		

	
   
});
</script>

</body>
</html>


