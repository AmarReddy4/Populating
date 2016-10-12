 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<title>Admin</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/app-resources/js/lib/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/app-resources/js/myapp.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-resources/css/style.css" />

<style>
.custab{
    border: 1px solid #ccc;
    padding: 5px;
    margin: 5% 0;
    box-shadow: 3px 3px 2px #ccc;
    transition: 0.5s;
    }
.custab:hover{
    box-shadow: 3px 3px 0px transparent;
    transition: 1s;
    }
div.TableMargin {
	margin-left: 465px;
	border-color: white;
	border-width: 2px;
	border-left-style: solid;
	margin-right: 500px;
	border-collapse: separate;
	padding-left: 15px;
}

div.FontManip {
	font-weight: bold;
	color: red;
}

div.Table {
	margin-left: 55px;
	margin-top: 40px;
	fonr-family: arial;
	font-size: 80%;
	table-layout:fixed;
}

div.BoxSize {
	width: 200px;
	margin-left: 60px;
	margin-top: -6px;
}

/* body {
	background-image:
		url("http://img.freecodesource.com/twitter-backgrounds/images/bg/L856370352.jpg");
	opacity: 0.8;
} */
</style>

</head>

<body>
<!-- <nav class="navbar navbar-light" style="background-color: steelblue;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="http://localhost:8080/ShoppingCart"><span style="color:white;">ShoppingCart</span></a>
    </div>
    <ul class="nav navbar-nav nav-tabs" style="margin-left:355px">
      <li><a href="http://localhost:8080/ShoppingCart/" class="glyphicon glyphicon-home"><span style="color:lightsteelblue;"></span></a></li>
      <li><a href="Category"><span style="color:lightsteelblue;">Category</span></a></li>
      <li><a href="Product"><span style="color:lightsteelblue;">Product</span></a></li> 
      <li class="active"><a href="Supplier"><span style="color:lightsteelblue;">Supplier</span></a></li>
    </ul>
     
     <a class="navbar-brand" >Welcome ADMIN</a>
     
  </div>
</nav> -->
	<%-- <nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="Admin">MUSIC HUB</a>
			</div>
			<ul class="nav navbar-nav nv-tabs" style="margin-left: 350px;">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="Supplier">Supplier</a></li>
				<li><a href="Product">Product</a></li>
				<li><a href="Category">Category</a></li>
			</ul>
		</div>
	</nav> --%>
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.17/angular.min.js"></script>

<script>
	var app = angular.module('myApp', []);
	function MyController($scope, $http) {
		$scope.sortType = 'name'; // set the default sort type
		$scope.sortReverse = false; // set the default sort order
		$scope.search = '';
		$scope.getDataFromServer = function() {
			$http({
				method : 'GET',
				url : 'suppliergson'
			}).success(function(data, status, headers, config) {
				$scope.suppliers = data;// alert(data); 
			}).error(function(data, status, headers, config) {
			});
		};
	};
</script>
  <c:url var="addAction" value="addSupplier" ></c:url>

<form:form action="${addAction}" modelAttribute="supplier" id="btn-add">
<div class="TableMargin">
   <h3>
                   <%--  <c:if test="${supplier.id==0}">
		       Add New Item
	            </c:if>
	            <c:if test="${!empty supplier.id}">
		      Update Item for Id: <c:out value="${supplier.id}"/>
		      <form:hidden path="id"/>
	            </c:if> --%>
	          </h3>
	  <table>
	  
	  <tr>  <c:if test="${supplier.id!=0}">
	  <td> Id:</td> <td><form:input  path="id"/></td> 
	   </c:if>
	    <tr> <td> Name:</td> <td><form:input  path="name"/></td> 
	    <tr> <td>Address:</td> <td><form:input path="address"/> </td> 
		
 
	    <tr> <td colspan="2">
    	        <c:if test="${supplier.id==0}">
			      <input type="submit" value="Add" id="btn-add"> 
	         </c:if>
	         <c:if test="${supplier.id!=0}">
			      <input type="submit" value="Update" id="btn-update"> 
	         </c:if>
		</td> 
		<tr> <td colspan="2" class="success-msg">
		   <c:out value="${msg}"/>
		</td> 
	  </table>
	</div>
	
	<div class="container" data-ng-app="myApp"
				data-ng-controller="MyController" data-ng-init="getDataFromServer()"
				style="overflow: auto; height: 400px; width: 70%">
				<form>
					<input
						data-ng-model="search" type="text" placeholder=" Search Supplier"
						style="width: 20%">
				</form>
				
	  <div class="container">
		<table class="table table-striped custab">  
	<tr>		<td> ID </td>
		        <td> Name </td>
				 <td> Address</td>
				 <td> Action </td>
				 </tr>
			<tr data-ng-repeat="supplier in suppliers | orderBy:sortType:sortReverse | filter:search">  
        
                    <%-- <c:forEach  var="obj" items="${allSupplier}"> --%>		      
                 
		                 <td> {{supplier.id}}</td>
		                 <td> {{supplier.name}}</td>
				 		 <td>{{supplier.address}} </td>
				
				 <td> <a class="btn btn-danger btn-xs" href="deletesupplier/{{supplier.id}}">Delete </a> |
				     <a class="btn btn-info btn-xs" href="ItemBysupplier/{{supplier.id}}">Edit</a>  
				 </td>
				  </tr>
		         <%-- </c:forEach> --%>
	      </table> 
          </div>
          </div>
          </form:form>
          
          </html>









<%-- <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head><title>Supplier</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/app-resources/js/lib/jquery-2.2.3.min.js"></script>
  <script src="${pageContext.request.contextPath}/app-resources/js/myapp.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-resources/css/style.css"/>
</head>


<style>
   div.gap
  {
  margin:-25px 0px 0px 0px;
  }
  table {
    border-collapse: collapse;
    width: 60%;
}

body
{
background-color:lavender;
}

div.move
{
margin-left:90px;
}
div.moving
{
margin-left:250px;
}

div.right
{
margin-left:275px;
}

th, td {
    padding: 9px;
    text-align: center;
    border-bottom: 2px solid #ddd;
}

tr:hover{background-color:#e6e6fa}
 th {background-color: Gainsboro;
    color: black;
    }
  </style>

<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.17/angular.min.js"></script>

<script>
	var app = angular.module('myApp', []);
	function MyController($scope, $http) {
		$scope.sortType = 'name'; // set the default sort type
		$scope.sortReverse = false; // set the default sort order
		$scope.search = '';
		$scope.getDataFromServer = function() {
			$http({
				method : 'GET',
				url : 'suppliergson'
			}).success(function(data, status, headers, config) {
				$scope.suppliers = data;// alert(data); 
			}).error(function(data, status, headers, config) {
			});
		};
	};
</script>

<body>
  <c:url var="addAction" value="addSupplier" ></c:url>

<form:form action="${addAction}" modelAttribute="supplier" name="btn-add">
   <h3>
                    <c:if test="$(supplier.id==0}">
		       Add New Item
	            </c:if>
	            <c:if test="${!empty supplier.id}">
		      Update Item for Id: <c:out value="${supplier.id}"/>
		      <form:hidden path="id"/>
	            </c:if>
         </h3>
    <div class="move">     
	<div class="container">
	<div class="clearfix"></div>
	<div class="Product_Content tab-content">
            <div id="Category" class="tab-pane active">
            <form class="form-horizontal">
 
<div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
 <c:if test="${supplier.id!=0}">
      <label class="col-md-2 form-group"  for="id">Id:</label>
      <div class="col-md-6">
        <form:input type="text" placeholder="supplier id" class="form-control name" path="id"/>
      </div>
     </c:if>
         </div>
    
    <div class="col-xs-8 col-sm-8  col-md-6 col-sm-offset-2 col-md-offset-3">
      <label class="col-md-2 form-group"  for="name">Name:</label>
      <div class="col-md-6">
        <form:input type="text" placeholder="Supplier Name" class="form-control name" path="name" required="true"/>
      </div>
    </div>
<div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
      <label class="col-md-2 form-group"  for="address">Address:</label>
      <div class="col-md-6 ">
        <form:input type="text" placeholder="Address" class="form-control name" path="address" required="true"/>
      </div>
    </div>

    <div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
    <div class="col-md-6 ">
    	        
    	        <div class="right">
    	        <c:if test="${supplier.id==0}">
			      <input type="submit" value="ADD" class="btn btn-info"> 
	         </c:if>
	         </div>
	         <div class="moving">
	         <c:if test="${supplier.id!=0}">
			      <input type="submit" value="UPDATE" class="btn btn-info"> 
	         </c:if>
	         </div>
	         
	</div>
    </div>
    <div class="container" data-ng-app="myApp"
				data-ng-controller="MyController" data-ng-init="getDataFromServer()"
				style="overflow: auto; height: 400px; width: 70%">
				<form>
					<input
						data-ng-model="search" type="text" placeholder=" Search Supplier"
						style="width: 20%">
				</form>
				</div>
    </form>
    </div>
    </div>
    </div>
    </div>
    
    <div align="center">
	  <table>   
			<tr>
			 		<td> ID </td>
		        	<td> Name </td>
				 	<td> Address</td>
				 	<td> Action </td>
	      	</tr>
	      	<tr data-ng-repeat="supplier in suppliers | orderBy:sortType:sortReverse | filter:search">  
      
    	      <c:forEach var="obj" items="${allSupplier}">
		      
		                 <td>{{ supplier.id}} </td>
		                 <td> {{ supplier.name}} </td>
				 		 <td> {{ supplier.address}} </td>
				 
						
				<td class="text-center">
				 <a class='btn btn-info btn-xs' href="ItemBysupplier/{{supplier.id}}">
				 <span class="glyphicon glyphicon-edit"></span> Edit</a>
				 <a href="deletesupplier/{{supplier.id}}" class="btn btn-danger btn-xs">
				 <span class="glyphicon glyphicon-remove"></span>Delete</a></td>
		
		      </tr>
	      </c:forEach>
          </table> 
          </div>
         
 </form:form>
</body>
</html> --%>