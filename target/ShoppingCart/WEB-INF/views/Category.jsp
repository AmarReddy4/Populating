<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en-US">

<head>
<title>Admin</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/app-resources/js/lib/jquery-2.2.3.min.js"></script>
  <script src="${pageContext.request.contextPath}/app-resources/js/myapp.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-resources/css/style.css"/>  
</head>

<!-- <style>
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
</style> -->

<style>
   div.gap
  {
  margin:-25px 0px 0px 0px;
  }
  
  table 
  {
    border-collapse: collapse;
    width: 70%;
	}

	th, td 
	{
 border: 1px solid grey;
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
	}

tr:hover{background-color:#f5f5f5}
 th {background-color: black;
    color: white;
    }
  </style>


<body>
<c:url var="addAction" value="addCategory" ></c:url>
<form:form action="${addAction}" modelAttribute="category" name="btn-add">
   <%-- <h3>
                    <c:if test="$(category.id==0}">
		       Add New Item
	            </c:if>
	            <c:if test="${!empty category.id}">
		      Update Item for Id: <c:out value="${category.id}"/>
		      <form:hidden path="id"/>
	            </c:if>
         </h3>--%>  
      <tr>	

<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.17/angular.min.js"></script>
<script>
	var app = angular.module('myApp', []);
	function MyController($scope, $http) {
		$scope.sortType = 'name'; // set the default sort type
		$scope.sortReverse = false; // set the default sort order
		$scope.search = '';
		$scope.getDataFromServer = function() {
			$http({
				method : 'GET',
				url : 'categorygson'
			}).success(function(data, status, headers, config) {
				$scope.categories = data;// alert(data); 
			}).error(function(data, status, headers, config) {
			});
		};
	};
</script>      				

<div class="container">
<div class="clearfix"></div>
	<div class="Product_Content tab-content">
            <div id="Category" class="tab-pane active">
            <form class="form-horizontal">
  <br>
 <div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
 	<c:if test="${category.id!=0}">
      <label class="col-md-4 form-group"  for="id">Id:</label>
      <div class="col-md-6">
        <form:input type="text" placeholder="category id" class="form-control name" path="id"/>
      </div>
     </c:if>
 </div>
    
 <div class="col-xs-8 col-sm-8  col-md-6 col-sm-offset-2 col-md-offset-3">
      <label class="col-md-4 form-group"  for="name">Name:</label>
      <div class="col-md-6">
        <form:input type="text" placeholder="category name" class="form-control name" path="name"/>
      </div>
 </div>
    
 <div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
      <label class="col-md-4 form-group"  for="description">Description:</label>
      <div class="col-md-6 ">
        <form:input type="text" placeholder="description" class="form-control name" path="description"/>
      </div>
 </div>

 <div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
    <div class="col-md-6 ">
    	        <c:if test="${category.id==0}">
			      <input type="submit" value="Add" class="btn btn-primary"> 
	         </c:if>
	         <c:if test="${category.id!=0}">
			      <input type="submit" value="Update" class="btn btn-primary"> 
	         </c:if>
	</div>
 </div>
</form>
    </div>
    </div>
    </div>
    
    <div class="container" data-ng-app="myApp" 
    	data-ng-controller="MyController" data-ng-init="getDataFromServer()"
				style="overflow: auto; height: 400px; width: 70%">
				<form>
					<input
						class="w3-input w3-animate-input w3-border w3-round w3-small"
						data-ng-model="search" type="text" placeholder=" Search Category"
						style="width: 20%">

				</form>
				<br>
    
  <div align="center">
	  <table>   
	  
			<tr>
				 <th> ID </th>
		         <th> Name </th>
				 <th> Description</th>			  
				 <th colspan="2"> Action </th>
	      	</tr>
	      	
    	     <%--  <c:forEach var="obj" items="${allCategory}"> --%>
		      <tr
		      data-ng-repeat="category in categories | orderBy:sortType:sortReverse | filter:search">
		                 <td> {{category.id}} </td>
		                 <td> {{category.name}} </td>
				 		 <td> {{category.description}} </td>
				 
				<td> <a href="deletecategory/{{category.id}}">Delete </a> |
				     <a href="ItemBycategory/{{category.id}}">Edit</a> 
				 </td>
				 </tr>
		     
		      
	     <%--  </c:forEach> --%>
	     
          </table> 
          </div>
          </div>
 </form:form>
 
  	<%-- <c:url var="addAction" value="addCategory" ></c:url>

	<form:form action="${addAction}" modelAttribute="category" id="btn-add">
		<div class="TableMargin">
   		<h3>
                    <c:if test="${supplier.id==0}">
		       Add New Item
	            </c:if>
	            <c:if test="${!empty supplier.id}">
		      Update Item for Id: <c:out value="${supplier.id}"/>
		      <form:hidden path="id"/>
	            </c:if>        
	     </h3>
	     
	  <table>
	  		<tr>  <c:if test="${category.id!=0}">
	  		<td> Id:</td> <td><form:input  path="id"/></td> 
	   		</c:if>
	    	
	    	<tr> <td> Name:</td> <td><form:input  path="name"/></td> 
	    	
	    	<tr> <td>Description:</td> <td><form:input path="description"/> </td> 
		
 
	    	<tr> <td><c:if test="${category.id==0}">
			      <input type="submit" value="Add" id="btn-add"> 
	         </c:if>
	         
	         <c:if test="${category.id!=0}">
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
						data-ng-model="search" type="text" placeholder=" Search Category"
						style="width: 20%">
				</form>
				
	  		<div class="container-fluid">
				<table class="table table-striped custab">  
				<tr>		 
				 	<td> ID </td>
		         	<td> Name </td>
				 	<td> Description</td>
				 	<td> Action </td>
				 </tr>
				 
				<tr data-ng-repeat="category in categories | orderBy:sortType:sortReverse | filter:search">  
       
                    <%-- <c:forEach  var="obj" items="${allCategory}">		      
                 
		                 <td> {{category.id}}</td>
		                 <td> {{category.name}}</td>
				 		 <td>{{category.description}} </td>
				
				 	<td> <a class="btn btn-danger btn-xs" href="deletecategory/{{category.id}}">Delete </a> |
				     <a class="btn btn-info btn-xs" href="ItemBycategory/{{category.id}}">Edit</a>  
				 	</td>
				  </tr>
		         </c:forEach>
	      		</table> 
        	</div>
		</div>
     </form:form> --%>
</html>












<%--  <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head><title>Category</title>
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
div.moving
{
margin-left:250px;
}

body
{
background-color:lavender;
}

div.move
{
margin-left:90px;
}

div.right
{
margin-left:275px;
}

th, td {
    padding:9px;
    text-align: center;
    border-bottom: 2px solid #ddd;
}

tr:hover{background-color:#e6e6fa}
 th {background-color: Gainsboro;
    color: black;
    }
  </style>

<body>
  <c:url var="addAction" value="addCategory" ></c:url>

<form:form action="${addAction}" modelAttribute="category" name="btn-add">
   <h3>
                    <c:if test="$(category.id==0}">
		       Add New Item
	            </c:if>
	            <c:if test="${!empty category.id}">
		      Update Item for Id: <c:out value="${category.id}"/>
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
 		<c:if test="${category.id!=0}">
      <label class="col-md-2 form-group" for="id">Id:</label>
      <div class="col-md-6">
        <form:input type="text" placeholder="product id" class="form-control name" path="id"/>
      </div>
     </c:if>
         </div>
    
    <div class="col-xs-8 col-sm-8  col-md-6 col-sm-offset-2 col-md-offset-3">
      <label class="col-md-2 form-group"  for="name">Name:</label>
      <div class="col-md-6">
        <form:input type="text" placeholder="Category Name" class="form-control name" path="name" required="true"/>
      </div>
    </div>
<div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
      <label class="col-md-2 form-group"  for="description">Description:</label>
      <div class="col-md-6 ">
        <form:input type="text" placeholder="Description" class="form-control name" path="description" required="true"/>
      </div>
    </div>


    <div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
    <div class="col-md-6 ">
    	        
    	        <div class="right">
    	        <c:if test="${category.id==0}">
			      <input type="submit" value="ADD" class="btn btn-info"> 
	         </c:if>
	         </div>
	         
	         <div class="moving">
	         <c:if test="${category.id!=0}">
			      <input type="submit" value="UPDATE" class="btn btn-info"> 
	         </c:if>
	         </div>
	         </div>
	</div>
   
    </form>
    </div>
    </div>
    </div>
    </div>
    
    <div align="center">
	  <table>   
			<tr>
			 		<th> ID </th>
		        	<th> Name </th>
				 	<th> Description</th>
				 
				 <th colspan="2"> Action </th>
	      	</tr>
    	      <c:forEach var="obj" items="${allCategory}">
		      <tr>
		                 <td> <c:out value="${obj.id}"/> </td>
		                 <td> <c:out value="${obj.name}"/> </td>
				 		 <td> <c:out value="${obj.description}"/> </td>				
				
				<td class="text-center">
				 <a class='btn btn-info btn-xs' href="ItemBycategory/${obj.id}">
				 <span class="glyphicon glyphicon-edit"></span> Edit</a>
				 <a href="deletecategory/${obj.id}" class="btn btn-danger btn-xs">
				 <span class="glyphicon glyphicon-remove"></span>Delete</a></td>
		
		      </tr>
	      </c:forEach>
          </table> 
          </div>
 </form:form>


<form:form action="${addAction}" modelAttribute="category" id="btn-add">
   			<h3>
                    <c:if test="${category.id==0}">Add New Category</c:if>
	            	<c:if test="${!empty category.id}">
		      		Update Category for Id: <c:out value="${category.id}"/>
		      		<form:hidden path="id"/>
		      		</c:if>
         </h3>
	  <table>
	  
	  <tr>  <c:if test="${category.id!=0}">
	  		 <td> Id:</td> <td><form:input  path="id"/></td> </c:if>
	    <tr> <td> Name:</td> <td><form:input  path="name"/></td> 
	    <tr> <td>Description:</td> <td><form:input path="description"/> </td> 
	    <tr> <td>Price: </td> <td><form:input path="price"/></td> 
		
  
	    <tr> <td>
    	  	      <c:if test="${category.id==0}">
			      <input type="submit" class="btn btn-success" value="ADD"> 
	         </c:if>
	         <c:if test="${category.id!=0}">
			      <input type="submit" class="btn btn-success" value="UPDATE"> 
	         </c:if>
		</td> 
		<tr> <td colspan="2" class="success-msg">
		   <c:out value="${msg}"/>
		</td></tr> 
	  </table>
	  
	  <div class="container">
    <div class="row col-md-6 col-md-offset-2 custyle">
    <table class="table table-striped custab">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th class="text-center">Action</th>
        </tr>
        <c:forEach var="category" items="${allCategory}">
    		<tr>
		                 <td> <c:out value="${category.id}"/> </td>
		                 <td> <c:out value="${category.name}"/> </td>
				 		 <td> <c:out value="${category.description}"/> </td>
		
				 <td class="text-center">
				 <a class='btn btn-info btn-xs' href="ItemBycategory/${category.id}">
				 <span class="glyphicon glyphicon-edit"></span> Edit</a>
				 <a href="deletecategory/${category.id}" class="btn btn-danger btn-xs">
				 <span class="glyphicon glyphicon-remove"></span>Delete</a></td>
		      </tr>
	      </c:forEach>
    
    </thead>
    </table>
    </div>
    </div>
 </form:form>
</body>
</html>  --%>