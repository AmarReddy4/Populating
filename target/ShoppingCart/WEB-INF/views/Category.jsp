 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
                    <%-- <c:if test="$(category.id==0}">
		       Add New Item
	            </c:if>
	            <c:if test="${!empty category.id}">
		      Update Item for Id: <c:out value="${category.id}"/>
		      <form:hidden path="id"/>
	            </c:if> --%>
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
          </div>
 </form:form>


<%-- <form:form action="${addAction}" modelAttribute="category" id="btn-add">
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
 </form:form> --%>
</body>
</html> 