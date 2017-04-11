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

<div ng-app="Register" ng-controller="register" ng-init="init()"> 
<h1>
		Register Details
</h1>

<h2>
<form action="show.jsp">
<table >
<tr>
	<td>
		UserName :
	</td>
	<td>
		<input type="text" ng-model="username" name="username" ng-disabled="disableAllusername">  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp  
	Enter UserName You Want To Edit  : <input type="text" ng-model="useredit" name="username" ng-disabled="disabledel"> <br>
	</td>
</tr>

<tr>
	<td>
		Password :
	</td>
	<td>
		<input type="password" ng-model="password" name="password" ng-disabled="disableAllpassword"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
	<input type="button" ng-click="edituser()" value="Edit"  ng-hide="isedituser"><br>
	</td>
</tr>

<tr>
	<td>
		First Name : 
	</td>
	<td>
		<input type="text" ng-model="fname" name="fname" ng-disabled="disableAll"><br>
	</td>
</tr>

<tr>
	<td>
		Last Name : 
	</td>
	<td>
		<input type="text" ng-model="lname" name="lname" ng-disabled="disableAll" value={{detail.lname}}> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp  
	Enter UserName You Want To Delete  : <input type="text" ng-model="userdel" name="username" ng-disabled="disabledel"> <br>
	</td>
</tr>
<tr>
	<td>
		Address : 
	</td>
	<td>
		<input type="text" ng-model="add" name="add" ng-disabled="disableAll"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
	<input type="button" ng-click="del()" value="Delete"  ng-hide="isdel"><br>
	</td>
</tr>
<tr>
	<td>
		Gender :
	</td>
	<td>
	
	 <input type="radio" name="gen" ng-model="gen" value="female" ng-required="!color1"/>Female <input type="radio" name="gen" ng-model="gen" value="male" ng-required="!color1" ng-disabled="disableAll">Male 
	
		
	</td>
</tr>
<tr>
	<td>
		Country : 
	</td>
	<td>
	
	<select name="country" ng-model="country" ng-disabled="disableAll">
      <option value="India">India</option>
      <option value="HongKong">HongKong</option>
      <option value="New York">New York</option>
    </select>
	
	
	</td>
	
	
	
</tr>
	
</table>


	<br><br>



<input type="button" ng-click="showConfirm()" value="Save" ng-hide="isSave">

<input type="button" ng-click="insert()" value="Confirm"   ng-hide="isDisabled">



<input type="button" ng-click="all()" value="Show All Details">

<input type="button" ng-click="clear()" value="Clear">

<input type="button" ng-click="update()" value="Udpdate User"   ng-hide="isupdate"> <br><br>






<table  align="center" border="1" ng-hide="istable">
<tr>
		                     <b>   <td>First Name</td>
		                        <td>Last Name</td>
                                <td>Address</td>
                                <td>Gender</td>  
                                <td>Country</td>
                                  <td>User Name</td>
                          
						                              

</tr>

	<tr ng-repeat="x in detail">
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
		//alert("alay ekde");
	    $http.get("http://localhost:8080/LoginApp/users")
	    .success(function(response) {$scope.employee=response;});
	    $scope.users=null;
	    $scope.flag = true;
	 
	};

	// Insert Function
	
	$scope.insert = function() {		
	
		//alert("In insert...before .get");
		$scope.flag1 = false;
		$scope.flag2 = false;
	    $http.get("http://localhost:8080/LoginApp/insert/"+$scope.username +"/"+$scope.password +"/"+$scope.fname +"/"+ $scope.lname+"/"+$scope.add+"/"+$scope.gen+"/"+$scope.country)
	    .success(function(response) {$scope.message=response;
	    
	    if($scope.message==1)
		{
    	$scope.flag1 = true;
		alert("Record Inserted..!!");
		
		
		}
    else
    	{
		$scope.flag2 = true;
		alert("Error..User Alreday Exist!!");
    	}
	     
	    });
	   
	    
	    $scope.users=null;
	    $scope.flag = true;
	 
	};
	
	
	// Update Function
	
	$scope.update = function() {		
	
		//alert("In insert...before .get");
		$scope.flag1 = false;
		$scope.flag2 = false;
	    $http.get("http://localhost:8080/LoginApp/update/"+$scope.username +"/"+$scope.password +"/"+$scope.fname +"/"+ $scope.lname+"/"+$scope.add+"/"+$scope.gen+"/"+$scope.country)
	    .success(function(response) {$scope.message=response;
	    
	    if($scope.message==1)
		{
    	$scope.flag1 = true;
		alert("Record Updated..!!");
		
		
		}
    else
    	{
		$scope.flag2 = true;
		alert("Error..User Alreday Exist!!");
    	}
	     
	    });
	   
	    
	    $scope.users=null;
	    $scope.flag = true;
	 
	};
	
	
	
	
	
	
	
	$scope.showConfirm = function() {		
		
			
		 $scope.isDisabled = false;  
		 $scope.isSave = true;  
		 $scope.disableAll = true;
		 $scope.disableAllusername=true;	 
		 $scope.disableAllpassword=true;	 
	};
	 
	$scope.init = function() {		
			
		$scope.istable = true; 
		 $scope.isDisabled = true; 
		 $scope.isupdate=true;
	};
	 
	
		
		// Display Function
		$scope.all = function() {
			$scope.istable = false;
			$scope.employee=null;
		    $http.get("http://localhost:8080/LoginApp/details")
		    .success(function(response) {$scope.detail=response;});
		
		 
		    $scope.flag = true;
		 
		}; 
		

		
		//clear
		$scope.clear = function() {
			
			//location.replace();
			location.reload();


		 
		}; 
		
		
		
		// Delete Function
		
		
		$scope.del = function() {
		//alert("In Delete...before service get");
			$scope.flag1 = false;
			$scope.flag2 = false;
		    $http.get("http://localhost:8080/LoginApp/del/" + $scope.userdel )
		    .success(function(response) {$scope.status=response;
		    
		    
		    console.log(response);
		    if($scope.status==1)
			{
	    	$scope.flag1 = true;
			alert("Record Deleted..!!");
			}
	    else
	    	{
			$scope.flag2 = true;
			alert("Error..!!");
	    	}
		    
		    });    	    
		    
			 $scope.users=null;
		    $scope.flag = true;	 
		};
		
		
		
		
		
		
		// Edituser Function
		
		
		$scope.edituser = function() {
		
			$scope.flag1 = false;
			$scope.status=null;
			$scope.flag2 = false;
			$scope.fname1=null;
		    $http.get("http://localhost:8080/LoginApp/edituser/" + $scope.useredit )
		    .success(function(response) {$scope.status=response;
		    
	
		    console.log($scope.status.fname);
		    console.log($scope.status[0].address);
		    console.log(response);
		    
		    $scope.username=$scope.status[0].username;
		    $scope.password=$scope.status[0].password;
		    $scope.fname=$scope.status[0].fname;
		    $scope.lname=$scope.status[0].lname;
		    $scope.add=$scope.status[0].address;
		    $scope.gen=$scope.status[0].gender;
		    $scope.country=$scope.status[0].country;
		    console.log($scope.fname);
		   
		    });    	    
		    
		    $scope.isupdate=false;
		    $scope.isSave=true;
		    $scope.disableAllusername=true;	 
			// $scope.disableAllpassword=true;
		    
		};
		

});
</script>

</body>
</html>




