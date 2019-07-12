<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Maven + Spring MVC</title>
 
<spring:url value="/resources/core/css/addactor.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
</head>

<body>
 
    <div class="container">
    <h2>Add Actor</h2>
        <form:form method="post" modelAttribute="message" action="/home/actor-added">
              <div class="form-group">
                <label for="name">Name</label>
                <form:input type="text" class="form-control" path="name" id="name"  placeholder="Enter Name" />

              </div>
            <div class="form-group">
                <label for="dateOfBirth">Date of Birth</label>
                <form:input type="date" class="form-control" path="dateofbirth" id="dateOfBirth"  placeholder="Enter Date Of Birth" />

            </div>
            <div class="form-group">
              <label for="description">Name</label>
              <form:input type="text" class="form-control" path="description" id="description" placeholder="Description" rows="3" />


            </div>
              <button type="submit" class="btn btn-primary">add</button>
        </form:form>
    </div>
 

 
<spring:url value="/resources/core/css/addactor.js" var="coreJs" />
<spring:url value="/resources/core/css/bootstrap.min.js" var="bootstrapJs" />
 
<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 
</body>
</html>