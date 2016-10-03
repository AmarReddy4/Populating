 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
<script src="${pageContext.request.contextPath}/app-resources/js/lib/jquery-2.2.3.min.js"></script>
  <script src="${pageContext.request.contextPath}/app-resources/js/myapp.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-resources/css/style.css"/>
</head>

<style>
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
   <h3>
                    <c:if test="${product.id==0}"> Add New Product</c:if>
	            <c:if test="${!empty product.id}">
		      Update Product for Id: <c:out value="${product.id}"/>
		      <%-- <form:hidden path="id"/> --%>
	            </c:if>
         </h3>
	  <table>
	  
	  <tr>  <c:if test="${product.id!=0}">
	    	 <td> Id:</td> <td><form:input  path="id" disabled="true"/></td> </c:if>
	    <tr> <td> Name:</td> <td><form:input  path="name"/></td> 
	    <tr> <td>Description:</td> <td><form:input path="description"/> </td> <tr>
				<td>Category:</td>
				<td><form:select path="category_id" required="true">
				<c:forEach items="${allCategory}" var="category">
				<form:option class="input" value="${category.id}">${category.name}</form:option></c:forEach>
								</form:select></td>
								<tr>
					<td>Supplier:</td>
				<td><form:select path="supplier_id" required="true">
				<c:forEach items="${allSupplier}" var="supplier">
								<form:option class="input" value="${supplier.id}">${supplier.name}</form:option>
							</c:forEach>
								</form:select></td></tr>
								
	    <tr> <td>Price: </td> <td><form:input path="price"/></td> 
	   
	 					<tr>
							
							<td>Image:</td>
							<td><form:input type="file" path="image" required="true" /></td>
						</tr>
						
   <%--  <label class="col-md-4 form-group" for="image">Image:</label>
			<div class="col-md-6">		
			<form:input type="file" class=" btn btn-default btn-block form-control" path="image" required="true" />
				</div> --%>
	   
	   
	    <tr> <td>
    	        <c:if test="${product.id==0}">
			      <input type="submit" class="btn btn-success" value="ADD"> 
	         </c:if>
	         <c:if test="${product.id!=0}">
			      <input type="submit" class="btn btn-success" value="UPDATE"> 
	         </c:if>
		</td> </tr>
		<%-- <tr> <td colspan="2" class="success-msg">
		   <c:out value="${msg}"/>
		</td></tr> --%> 
	  </table>
	  <table>   
			<tr>
			 	<td> ID </td>
		        <td> Name </td>
				 <td> Description</td>
				 <td> Categoryid</td>
				 <td> Supplierid</td>
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
	      	      	
    	      <%-- <c:forEach var="obj" items="${allData}">
		      <tr>
		                 <td> <c:out value="${obj.id}"/> </td>
		                 <td> <c:out value="${obj.name}"/> </td>
				 <td> <c:out value="${obj.description}"/> </td>
				 <td> <c:out value="${obj.categoryid}"/> </td>
				 <td> <c:out value="${obj.supplierid}"/> </td>
				 <td> <c:out value="${obj.price}"/> </td>
				 
				
				 <td> <a href="deleteproduct/${obj.id}">Delete </a> |
				     <a href="ItemByproduct/${obj.id}">Edit</a> 
				 </td>
		      </tr>
	      </c:forEach> --%>
          </table> 
 </form:form>  
</body>
</html>  








<%-- <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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