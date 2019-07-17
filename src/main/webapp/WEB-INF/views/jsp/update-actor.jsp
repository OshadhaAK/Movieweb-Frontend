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
    <h2>Update Actor</h2>
        <form:form method="post" modelAttribute="message" action="/update?id=${actor._id}">
                      <div class="form-group">
                        <label for="name">Name</label>
                        <form:input type="text" class="form-control" path="name" id="name" value="${actor.name}"/>

                      </div>
                    <div class="form-group">
                        <label for="dateOfBirth">Date of Birth</label>
                        <form:input type="text" class="form-control" path="dateofbirth" id="dateOfBirth"  value="${actor.dateofbirth}" />

                    </div>
                    <div class="form-group">
                      <label for="description">Name</label>
                      <form:input type="text" class="form-control" path="description" id="description" value="${actor.description}"  />


                    </div>
                    <div class="form-group">
                                  <label for="link">Image Link</label>
                                  <form:input type="text" class="form-control" path="link" id="link" placeholder="Image link" value="${actor.link}" />
                                </div>
                      <button type="submit" class="btn btn-primary"  >update</button>
                </form:form>
    </div>



<spring:url value="/resources/core/css/addactor.js" var="coreJs" />
<spring:url value="/resources/core/css/bootstrap.min.js" var="bootstrapJs" />

<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>