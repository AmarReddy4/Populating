# Shopping Cart - Admin Panel

A Spring MVC web application for managing an e-commerce shopping cart's back-office. Provides an admin dashboard to perform CRUD operations on Products, Categories, and Suppliers. Uses Hibernate 5 with an H2 database for persistence, Spring ORM for transaction management, and supports product image uploads via Commons FileUpload.

## Tech Stack

- **Java 8**
- **Spring MVC 4.3.3** / Spring ORM
- **Hibernate 5.2.2** (JPA annotations)
- **H2 Database** (TCP mode)
- **JSP** with JSTL and Bootstrap 3 (CDN)
- **Gson** for JSON API endpoints
- **Commons FileUpload** for image uploads
- **Maven** (WAR packaging)

## Project Structure

```
├── pom.xml
├── src/main/java/com/niit/shoppingcart/
│   ├── config/
│   │   └── ApplicationContextConfig.java   # DataSource, SessionFactory, TX manager
│   ├── controller/
│   │   ├── AdminController.java            # Root "/" landing page
│   │   ├── CategoryController.java         # Category CRUD + JSON endpoint
│   │   ├── ProductController.java          # Product CRUD + image upload
│   │   ├── SupplierController.java         # Supplier CRUD + JSON endpoint
│   │   └── MultiPartController.java        # File upload support
│   ├── dao/
│   │   ├── CategoryDAO.java / CategoryDAOImpl.java
│   │   ├── ProductDAO.java  / ProductDAOImpl.java
│   │   └── SupplierDAO.java / SupplierDAOImpl.java
│   └── model/
│       ├── Category.java                   # JPA entity (id, name, description)
│       ├── Product.java                    # JPA entity (id, name, price, image)
│       └── Supplier.java                   # JPA entity (id, name, address)
└── src/main/webapp/WEB-INF/
    ├── web.xml                             # Deployment descriptor
    ├── dispatcher-servlet.xml              # Spring config, view resolver
    └── views/
        ├── Admin.jsp                       # Dashboard with tab navigation
        ├── Category.jsp                    # Category management form/table
        ├── Product.jsp                     # Product management form/table
        └── Supplier.jsp                    # Supplier management form/table
```

## Build & Deploy

```bash
mvn clean package
```

Deploy `target/ShoppingCart.war` to Apache Tomcat 8+. The app expects an H2 database server running at `jdbc:h2:tcp://localhost/~/test` (default user `sa`, no password).
