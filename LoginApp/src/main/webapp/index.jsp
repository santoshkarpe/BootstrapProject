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




input[type='password']
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


input[type='password']:hover
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
<div ng-app="LoginApp" ng-controller="login"> 
<h1>
		Login Application
</h1>


<table >
<tr>
	<td>
	<h2>
		UserName :
	</h2>
	</td>
	<td>
		<input type="text" ng-model="id" >  
	
	</td>
</tr>

<tr>
	<td>
	<h2>
		Password :
	</h2>
	</td>
	<td>
		<input type="password" ng-model="pass" > 
	
	</td>
</tr>

</table>

<br><br>

<input type ="button" ng-click="login()" value="Login"><br>
<P>
<h1>
<a ng-href="register.jsp">Register New User..</a>
</h1>

<!-- 
  <p ng-show="flag1">
		Login Successful...!
	</p>
	<p ng-show="flag2">
		Unsuccessful...!
	</p>-->
 </div>   

<script>
var app = angular.module('LoginApp', []);
app.controller('login', function($scope, $http) {
	$scope.flag = false;
	
	
	$scope.getuser = function() {
		
	    $http.get("http://localhost:8080/LoginApp/users")
	    .success(function(response) {$scope.employee=response;});
	    $scope.users=null;
	    $scope.flag = true;
	 
	};

	
	
	$scope.login = function() {
		//alert("In display");
	    
		$scope.flag1 = false;
		$scope.flag2 = false;
		
		$http.get("http://localhost:8080/LoginApp/login/"+ $scope.id + "/" + $scope.pass)
	    .success(function(response) {$scope.msg=response;
	    
	    
	    if($scope.msg==1)
			{
	    	$scope.flag1 = true;
			alert("Login Succesful..!!");
			}
	    else
	    	{
			$scope.flag2 = true;
			alert("Login unsuceesful..!!");
	    	}
	    
	    });
	    
	    
	    
	   
	};
	
	
	
	
	
	
	
	
	
/*
	$scope.all = function() {
		alert("login...");		
		$scope.employee=null;
	    $http.get("http://localhost:8080/LoginApp/login/" + $scope.id + "/" + $scope.pass)
	    .success(function(response) {$scope.status=response;});
	    alert($scope.status);	 
	    $scope.flag = true;
	 
	}; */
	/*
	$scope.login = function() {
		alert("In login...before .get");
	    $http.get("http://localhost:8080/LoginApp/login/" + $scope.id + "/" + $scope.pass)
	    .success(function(response) {$scope.msg=response;});    	    
	  */
	    /*
	    if($scope.msg == false)
		{
			alert("Trade is Successful..!");
		}
	else
		{
		
			alert("Trade is unsuccessful..!");
		}
	    
	    
	    
	    */
	    
	    //alert("Message is "+$scope.msg);
	    //$scope.users=null;
	    //$scope.flag = true;	 
	
});


</script>
</body></html>


