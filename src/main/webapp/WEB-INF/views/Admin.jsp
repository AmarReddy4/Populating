<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>ADMIN</title>
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
body
{
background-color:lavender;

</style>

<body>
<nav class="navbar navbar-light" style="background-color: steelblue;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="http://localhost:8080/ShoppingCart"><span style="color:white;">ShoppingCart</span></a>
    </div>
    <ul class="nav navbar-nav nav-tabs" style="margin-left:355px">
    <li><a href="Home"><span style="color:lightsteelblue;">Home</span></a></li>
      <li><a href="Category"><span style="color:lightsteelblue;">Category</span></a></li>
      <li><a href="Product"><span style="color:lightsteelblue;">Product</span></a></li> 
      <li><a href="Supplier"><span style="color:lightsteelblue;">Supplier</span></a></li>
    </ul>
     
     <a class="navbar-brand" >Welcome ADMIN</a>
     
  </div>
</nav>

<!-- <h3 text="align:center">Hello ADMIN</h3> -->
<c:choose>
<c:when test="${userclickedcategory }">
<c:import url="/WEB-INF/views/Category.jsp"/>
</c:when>
</c:choose>
<c:choose>
<c:when test="${userclickedproduct }">
<c:import url="/WEB-INF/views/Product.jsp"/>
</c:when>
</c:choose>
<c:choose>
<c:when test="${userclickedsupplier }">
<c:import url="/WEB-INF/views/Supplier.jsp"/>
</c:when>
</c:choose>
<c:choose>
<c:when test="${userclickedhome }">
<c:import url="/WEB-INF/views/Home.jsp"/>
</c:when>
</c:choose>
</body>
</html>