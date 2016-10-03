 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head><title>Supplier</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
  <c:url var="addAction" value="addSupplier" ></c:url>

<form:form action="${addAction}" modelAttribute="supplier" id="btn-add">
   <h3>
                    <c:if test="${supplier.id==0}">Add New supplier</c:if>
	            	<c:if test="${!empty supplier.id}">
		      Update supplier for Id: <c:out value="${supplier.id}"/>
		      <form:hidden path="id"/>
	            </c:if>
         </h3>
	  <table>
	  
	  <tr>  <c:if test="${supplier.id!=0}">
	  <td> Id:</td> <td><form:input  path="id"/></td> 
	   </c:if>
	    <tr> <td> Name:</td> <td><form:input  path="name"/></td> 
	    <tr> <td>Address:</td> <td><form:input path="address"/> </td> 
	    <%-- <tr> <td>Price: </td> <td><form:input path="price"/></td>  --%>
		
  
	    <tr> <td colspan="2">
    	        <c:if test="${supplier.id==0}">
			      <input type="submit" class="btn btn-success" value="ADD"> 
	         </c:if>
	         <c:if test="${supplier.id!=0}">
			      <input type="submit" class="btn btn-success" value="UPDATE"> 
	         </c:if>
		</td> 
		<%-- <tr> <td colspan="2" class="success-msg">
		   <c:out value="${msg}"/>
		</td></tr> --%> 
	  </table>
	  <div class="container">
    <div class="row col-md-6 col-md-offset-2 custyle">
    <table class="table table-striped custab">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Address</th>
            <th class="text-center">Action</th>
        </tr>
        <c:forEach var="supplier" items="${allSupplier}">
    		<tr>
		                 <td> <c:out value="${supplier.id}"/> </td>
		                 <td> <c:out value="${supplier.name}"/> </td>
				 		 <td> <c:out value="${supplier.address}"/> </td>
		
				 <td class="text-center">
				 <a class="btn btn-info btn-xs" href="ItemBysupplier/${supplier.id}">
				 <span class="glyphicon glyphicon-edit"></span> Edit</a>
				 <a href="deletesupplier/${supplier.id}" class="btn btn-danger btn-xs">
				 <span class="glyphicon glyphicon-remove"></span>Delete</a></td>
		      </tr>
	      </c:forEach>
    
    </thead>
    </table>
    </div>
    </div>
	  
	  <%-- <table>   
			<tr>
			 		<td> ID </td>
		        	<td> Name </td>
				 	<td> Address</td>
				 	<!-- <td> Price </td> -->
				 	<td colspan="2"> Action </td>
	      	</tr>
                    <c:forEach  var="obj" items="${allData}">		      
                    <tr>
		                 <td> <c:out value="${obj.id}"/> </td>
		                 <td> <c:out value="${obj.name}"/> </td>
				 		<td> <c:out value="${obj.address}"/> </td>
				 <td> <c:out value="${obj.price}"/> </td>
				
				 <td> <a href="deletesupplier/${obj.id}">Delete </a> |
				     <a href="ItemBysupplier/${obj.id}">Edit</a> 
				 </td>
		      </tr>
	    </c:forEach>
          </table>  --%>
 </form:form>
  
</body>
</html> 