<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<title>Admin</title>

 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="${pageContext.request.contextPath}/app-resources/js/lib/jquery-2.2.3.min.js"></script>
  <script src="${pageContext.request.contextPath}/app-resources/js/myapp.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-resources/css/style.css"/>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
   
   div.gap
  {
  margin:-25px 0px 0px 0px;
  }
  
  body
	{
	background-color:lavender;
	}
	
  table 
  {
    border-collapse: collapse;
    width: 60%;
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

	tr:hover{background-color:lavender}
 	th {background-color: gainsboro;
    color: black;
    }
    
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
/* div.TableMargin {
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
} */

/* body {
	background-image:
		url("http://img.freecodesource.com/twitter-backgrounds/images/bg/L856370352.jpg");
	opacity: 0.8;
} */
</style>

</head>

<body>
	
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
				url : 'productgson'
			}).success(function(data, status, headers, config) {
				$scope.products = data;// alert(data); 
			}).error(function(data, status, headers, config) {
			});
		};
	};
</script>

  <c:url var="addAction" value="addProduct" ></c:url>

<form:form action="${addAction}" modelAttribute="product" id="btn-add" enctype="multipart/form-data">

<div class="TableMargin">
		  <!--   <h3> -->
		                    <c:if test="${product.id==0}">
				       Add New Item
			            </c:if>
			            <c:if test="${!empty product.id}">
				      Update Item for Id: <c:out value="${product.id}"/>
				      <form:hidden path="id"/>
			            </c:if>
		         <!-- </h3> --> 
	<div class="move">
	<div class="container">
  	<div class="clearfix"></div>
	<div class="Product_Content tab-content">
            <div id="Product" class="tab-pane active">
            <form class="form-horizontal">
  	
	<div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
 	<c:if test="${product.id!=0}">
      <label class="col-md-2 form-group"  for="id">Id:</label>
      <div class="col-md-6">
        <form:input type="text" placeholder="product id" class="form-control name" path="id"/>
      </div>
     </c:if>
         </div>
    
    <div class="col-xs-8 col-sm-8  col-md-6 col-sm-offset-2 col-md-offset-3">
      <label class="col-md-2 form-group"  for="name">Name:</label>
      <div class="col-md-6">
        <form:input type="text" placeholder="Product name" class="form-control name" path="name" required="true"/>
      </div>
    </div>
    
    <div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
      <label class="col-md-2 form-group"  for="description">Description:</label>
      <div class="col-md-6">
        <form:input type="text" placeholder="Description" class="form-control name" path="description" required="true"/>
      </div>
    </div>

	<div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
      <label class="col-md-2 form-group"  for="category_id">Category:</label>
      <div class="col-md-6">
         <form:select  class="form-control product-type" path="category_id" required="true">
         <c:forEach items="${allCategory}" var="category">
         <form:option class="input1" value="${category.id}">${category.name}</form:option>
         </c:forEach>
		</form:select>
       </div>
    </div>
    
<div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3"> 
      <label class="col-md-2 form-group"  for="supplier_id">Supplier:</label>
      <div class="col-md-6">
 <form:select  class="form-control product-type" path="supplier_id" required="true">
         <c:forEach items="${allSupplier}" var="supplier">
         <form:option class="input1" value="${supplier.id}">${supplier.name}</form:option>
         </c:forEach>
		</form:select>
	 </div>
    </div>

	<div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
      	<label class="col-md-2 form-group"  for="price">price:</label>
      		<div class="col-md-6 ">
        	<form:input type="text"  placeholder="Price" class="form-control name" path="price" required="true"/>
      		</div>
    </div>
    
    <div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
    		<label class="col-md-2 form-group" for="image">Image:</label>
			<div class="col-md-6">		
			<form:input type="file" class=" btn btn-default btn-block form-control" path="image" required="true" />
			</div>
	</div>
				
					
					<!-- <br>
					<td><input type="submit" class="btn btn-primary" value="Save" /></td>  -->
    
    
    <br><br>
    <div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
    <div class="col-md-3">
    	        
    	        <div class="right">
    	        <c:if test="${product.id==0}">
			      <input type="submit" value="Add" class="btn btn-info"> 
	         </c:if>
	         </div>
	         
	         <div class="moving">
	         <c:if test="${product.id!=0}">
			      <input type="submit" value="Update" class="btn btn-info"> 
	         </c:if>
	         </div>
	</div>
    </div>
    
    </form>
    </div>
    </div>
    </div>
    </div>	  
	  
	
	<div class="container-fluid" data-ng-app="myApp"
				data-ng-controller="MyController" data-ng-init="getDataFromServer()"
				style="overflow: auto; height: 400px; width: 70%">
				<form>
					<input
						data-ng-model="search" type="text" placeholder=" Search product"
						style="width: 20%">
				</form>
				
	  <div class="container-fluid">
		<table class="table table-striped custab">  
	<tr>		<td> ID </td>
		        <td> Name </td>
				 <td> Description</td>
				 <td> category </td>
				 <td> supplier </td>
				 <td> Price </td>
				 <td> Image </td>
				 <td> Action </td>
				 
				 </tr>
			<tr data-ng-repeat="product in products | orderBy:sortType:sortReverse | filter:search">  
        
                 <%--    <c:forEach  var="obj" items="${allProduct}"> --%>		      
                 
		                 <td> {{product.id}}</td>
		                 <td> {{product.name}}</td>
				 		 <td>{{product.description}} </td>
				 		 <td>{{product.category_id}} </td>
				 		 <td>{{product.supplier_id}} </td>
				 		 <td>{{product.price}} </td>
				<td><div class="thumbnail">
				<img height="50px" width="50px" alt="{{product.id}}"src="<c:url value="/resources/images/Product/{{product.id}}.jpg"></c:url>">
			         </div></td>
			          
				 <td> <a class="btn btn-danger btn-xs" href="deleteproduct/{{product.id}}">Delete </a> |
				     <a class="btn btn-info btn-xs" href="ItemByproduct/{{product.id}}">Edit</a>  
				 </td>
				  </tr>
		         <%-- </c:forEach> --%>
	      </table> 
	      </div>
          </div>
          </div>
          </form:form>
          
          </html>















<%-- <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head> <title>Product</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="${pageContext.request.contextPath}/app-resources/js/lib/jquery-2.2.3.min.js"></script>
  <script src="${pageContext.request.contextPath}/app-resources/js/myapp.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-resources/css/style.css"/>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  
  <style>
   
   div.gap
  {
  margin:-25px 0px 0px 0px;
  }
  
  body
	{
	background-color:lavender;
	}
	
  table 
  {
    border-collapse: collapse;
    width: 60%;
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

	tr:hover{background-color:lavender}
 	th {background-color: gainsboro;
    color: black;
    }
 </style>

<body>

 <c:url var="addAction" value="addProduct" ></c:url>
<form:form action="${addAction}" modelAttribute="product" id="btn-add" enctype="multipart/form-data">
   <h3 align="center">
                    <c:if test="$(product.id==0}"> 
		       Add New Item
	            </c:if>
	            <c:if test="${!empty product.id}">
		       Update Item for Id: <c:out value="${product.id}"/>
		      <form:hidden path="id"/>
	            </c:if>
   </h3>
   
	<div class="move">
	<div class="container">
  	<div class="clearfix"></div>
	<div class="Product_Content tab-content">
            <div id="Product" class="tab-pane active">
            <form class="form-horizontal">
  	
	<div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
 	<c:if test="${product.id!=0}">
      <label class="col-md-2 form-group"  for="id">Id:</label>
      <div class="col-md-6">
        <form:input type="text" placeholder="product id" class="form-control name" path="id"/>
      </div>
     </c:if>
         </div>
    
    <div class="col-xs-8 col-sm-8  col-md-6 col-sm-offset-2 col-md-offset-3">
      <label class="col-md-2 form-group"  for="name">Name:</label>
      <div class="col-md-6">
        <form:input type="text" placeholder="Product name" class="form-control name" path="name" required="true"/>
      </div>
    </div>
    
    <div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
      <label class="col-md-2 form-group"  for="description">Description:</label>
      <div class="col-md-6">
        <form:input type="text" placeholder="Description" class="form-control name" path="description" required="true"/>
      </div>
    </div>

	<div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
      <label class="col-md-2 form-group"  for="category_id">Category:</label>
      <div class="col-md-6">
         <form:select  class="form-control product-type" path="category_id" required="true">
         <c:forEach items="${allCategory}" var="category">
         <form:option class="input1" value="${category.id}">${category.name}</form:option>
         </c:forEach>
		</form:select>
       </div>
    </div>
    
<div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3"> 
      <label class="col-md-2 form-group"  for="supplier_id">Supplier:</label>
      <div class="col-md-6">
 <form:select  class="form-control product-type" path="supplier_id" required="true">
         <c:forEach items="${allSupplier}" var="supplier">
         <form:option class="input1" value="${supplier.id}">${supplier.name}</form:option>
         </c:forEach>
		</form:select>
	 </div>
    </div>

	<div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
      	<label class="col-md-2 form-group"  for="price">price:</label>
      		<div class="col-md-6 ">
        	<form:input type="text"  placeholder="Price" class="form-control name" path="price" required="true"/>
      		</div>
    </div>
    
    <div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
    		<label class="col-md-2 form-group" for="image">Image:</label>
			<div class="col-md-6">		
			<form:input type="file" class=" btn btn-default btn-block form-control" path="image" required="true" />
			</div>
	</div>
				
					
					<!-- <br>
					<td><input type="submit" class="btn btn-primary" value="Save" /></td>  -->
    
    
    <br><br>
    <div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
    <div class="col-md-3">
    	        
    	        <div class="right">
    	        <c:if test="${product.id==0}">
			      <input type="submit" value="ADD" class="btn btn-info"> 
	         </c:if>
	         </div>
	         
	         <div class="moving">
	         <c:if test="${product.id!=0}">
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
				 <th> CategoryID</th>
				 <th> SupplierID</th>
				 <th> Price </th>
				 <th> Image </th>
				 <th> Action </th>
	      	</tr>
    	      <c:forEach var="obj" items="${allProduct}">
		      <tr>
		                 <td> <c:out value="${obj.id}"/> </td>
		                 <td> <c:out value="${obj.name}"/> </td>
				 		 <td> <c:out value="${obj.description}"/> </td>
				 		 <td> <c:out value="${obj.category_id}"/> </td>
				 		 <td> <c:out value="${obj.supplier_id}"/> </td>
				 		 <td> <c:out value="${obj.price}"/> </td>
				 
				 <td><div class="thumbnail">
				<img height="50px" width="50px" alt="${obj.id }"src="<c:url value="/resources/images/Product/${obj.id}.jpg"></c:url>">
			         </div> 
				 
				 <td class="text-center">
				 <a class='btn btn-info btn-xs' href="ItemByproduct/${obj.id}">
				 <span class="glyphicon glyphicon-edit"></span> Edit</a>
				 <a href="deleteproduct/${obj.id}" class="btn btn-danger btn-xs">
				 <span class="glyphicon glyphicon-remove"></span>Delete</a></td>
				 
		      </tr>
	      </c:forEach>
          </table>
          </div> 
          
 </form:form>
</body>
</html>  

















 --%>






<%-- <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/app-resources/js/lib/jquery-2.2.3.min.js"></script>
  <script src="${pageContext.request.contextPath}/app-resources/js/myapp.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-resources/css/style.css"/>
</head>

<style>
div.margin
{
margin-left:500px;
}
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #4CAF50;
    color: white;
}
</style>
</head>

<body>

 <c:url var="addAction" value="addProduct" ></c:url>

<form:form action="${addAction}" modelAttribute="product" id="btn-add" enctype="multipart/form-data">
   			<div class="margin">
   			<h3>
                    <c:if test="${product.id==0}"> Add New Product</c:if>
	            
	            <c:if test="${!empty product.id}">
		      Update Product for Id: <c:out value="${product.id}"/>
		      <form:hidden path="id"/>
	            </c:if>
         </h3>
	  
	  <c:if test="${product.id!=0}">
	    	 <td> Id:</td> <td><form:input  path="id" /></td> </c:if>
	    
	    <c:if test="${product.id!=0}">
	    <div class="form-group">
      	<label for="id">Id:</label><br>
      	<input type="text" style="width:30%" class="form-control">
    	</div>
    	</c:if>
 
	    
	    
	    <div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
 		<c:if test="${product.id!=0}">
      	<label class="col-md-4 form-group" for="id">Id</label>
      	<div class="col-md-6">
        <form:input type="text" placeholder="product id" class="form-control name" path="id"/>
      	</div>
     	</c:if>
        </div>
	    
	    <tr> <td> Name:</td> <td><form:input  path="name"/></td>
	   	<br> 
	    <tr> <td>Description:</td> <td><form:input path="description"/> </td> <tr>
	    <br>
				<td>Category:</td>
				<td><form:select path="category_id" required="true">
				<c:forEach items="${allCategory}" var="category">
				<form:option class="input" value="${category.id}">${category.name}</form:option></c:forEach>
								</form:select></td>
								<tr>
								<br>
					<td>Supplier:</td>
				<td><form:select path="supplier_id" required="true">
				<c:forEach items="${allSupplier}" var="supplier">
								<form:option class="input" value="${supplier.id}">${supplier.name}</form:option>
							</c:forEach>
								</form:select></td></tr>
								<br>
								
	    		<tr> <td>Price: </td> <td><form:input path="price"/></td> 
	    		<br>
	   
	 					<tr>
							
							<td>Image:</td>
							<td><form:input type="file" path="image" required="true" /></td>
						</tr>
						<br>
	   
	   
	    <tr> <td>
    	        <c:if test="${product.id==0}">
			      <input type="submit" class="btn btn-success" value="ADD"> 
	         </c:if>
	         <c:if test="${product.id!=0}">
			      <input type="submit" class="btn btn-success" value="UPDATE"> 
	         </c:if>
		</td> </tr>
		</div>
		<tr> <td colspan="2" class="success-msg">
		   <c:out value="${msg}"/>
		</td></tr> 
	  <table>   
			<tr>
			 	 <td> ID </td>
		         <td> Name </td>
				 <td> Description</td>
				 <td> CategoryID</td>
				 <td> SupplierID</td>
				 <td>Image</td>
				 <td> Price </td>
				 <td class="text-center"> Action </td>
	      	</tr>
	      	
	      	<c:forEach var="obj" items="${allProduct}">
    		<tr>
		                 <td> <c:out value="${obj.id}"/> </td>
		                 <td> <c:out value="${obj.name}"/> </td>
				 		 <td> <c:out value="${obj.description}"/> </td>
				 		 <td> <c:out value="${obj.category_id}"/> </td>
				 		 <td> <c:out value="${obj.supplier_id}"/> </td>
				 		 
				 		 <td><div class="thumbnail">
								<img height="50px" width="50px" alt="${obj.id }"
									src="<c:url value="/resources/images/Product/${obj.id }.jpg"></c:url>">
									</div></td> 
									<td> <c:out value="${obj.price}"/> </td>
		
				  <td class="text-center">
				 <a class="btn btn-info btn-xs" href="ItemByproduct/${obj.id}">
				 <span class="glyphicon glyphicon-edit"></span> Edit</a>
				 <a href="deleteproduct/${obj.id}" class="btn btn-danger btn-xs">
				 <span class="glyphicon glyphicon-remove"></span>Delete</a></td>
		      </tr>
	      </c:forEach>
          </table> 
 </form:form>  
</body>
</html>  








<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head><title>Product</title>
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
.custab{
    border: 1px solid #ccc;
    padding: 5px;
    margin: 5% 0;
    box-shadow: 3px 3px 2px #ccc;
    transition: 0.5s;
    }
.custab:hover{
    box-shadow: 3px 3px 0px transparent;
    transition: 0.5s;
    }
</style>

<body>
  <c:url var="addAction" value="addproduct" ></c:url>

<form:form action="${addAction}" modelAttribute="product" id="btn-add">
   <h3>
                    <c:if test="${product.id==0}">Add New Item</c:if>
	            	<c:if test="${!empty product.id}">
		      Update Item for Id: <c:out value="${product.id}"/>
		      <form:hidden path="id"/>
	            </c:if>
         </h3>
  
        
    <table>
    
    	<tr><c:if test="${product.id!=0}">
    	<label for="id">Id:</label>
      	<form:input path="id" style="width:30%"/></c:if>
      
	  <tr>  <c:if test="${product.id!=0}">
	  		 <td>Id:</td> 
	  		 <td><form:input path="id"/></td></c:if><tr> 
	  		 <td>Name:</td> 
	  		 <td><form:input path="name"/></td> <tr>
	  		 <td>Description:</td> 
	  		 <td><form:input path="description"/> </td> <tr>
	  		 <td>Category_Id</td>
	  		 <td><form:input path="category_id"/> </td> <tr>
	  		 <td>Price:</td> 
	  		 <td><form:input path="price"/></td> <tr> 
	  		 <td colspan="2">
    	        <c:if test="${product.id==0}">
			      <input type="submit" class="btn btn-success" value="ADD" id="btn-add"> 
	         </c:if>
	         <c:if test="${product.id!=0}">
			      <input type="submit" class="btn btn-success" value="UPDATE" id="btn-update"> 
	         </c:if>
		</td> 
		<tr> <td colspan="2" class="success-msg">
		   <c:out value="${msg}"/>
		</td> 
	  </table>
    
     <!--  <label for="user">user:</label>
      <input style="width:30%">
    <div class="form-group">
      <label for="pwd">password:</label>
      <input style="width:30%"> -->
      
	  <div class="container">
    <div class="row col-md-6 col-md-offset-2 custyle">
    <table class="table table-striped custab">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th class="text-center">Action</th>
        </tr>
        <c:forEach var="obj" items="${allData}">
    		<tr>
		                 <td> <c:out value="${obj.id}"/> </td>
		                 <td> <c:out value="${obj.name}"/> </td>
				 		 <td> <c:out value="${obj.description}"/> </td>
				 		 <td> <c:out value="${obj.price}"/> </td>
		
				 <td class="text-center">
				 <a class='btn btn-info btn-xs' href="ItemByproduct/${obj.id}">
				 <span class="glyphicon glyphicon-edit"></span> Edit</a>
				 <a href="deleteproduct/${obj.id}" class="btn btn-danger btn-xs">
				 <span class="glyphicon glyphicon-remove"></span>Delete</a></td>
		      </tr>
	      </c:forEach>
    
    </thead>
    </table>
    </div>
</div> 
 </form:form>
  </body>
</html>   --%>