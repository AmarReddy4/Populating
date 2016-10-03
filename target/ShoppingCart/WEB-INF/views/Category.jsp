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
  <c:url var="addAction" value="addCategory" ></c:url>

<form:form action="${addAction}" modelAttribute="category" id="btn-add">
   			<h3>
                    <c:if test="${category.id==0}">Add New Category</c:if>
	            	<c:if test="${!empty category.id}">
		      		Update Category for Id: <c:out value="${category.id}"/>
		      		<%--<form:hidden path="id"/> --%>
		      		</c:if>
         </h3>
	  <table>
	  
	  <tr>  <c:if test="${category.id!=0}">
	  		 <td> Id:</td> <td><form:input  path="id"/></td> </c:if>
	    <tr> <td> Name:</td> <td><form:input  path="name"/></td> 
	    <tr> <td>Description:</td> <td><form:input path="description"/> </td> 
	   <%--  <tr> <td>Price: </td> <td><form:input path="price"/></td>  --%>
		
  
	    <tr> <td>
    	  	      <c:if test="${category.id==0}">
			      <input type="submit" class="btn btn-success" value="ADD"> 
	         </c:if>
	         <c:if test="${category.id!=0}">
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
</html> 