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
    <h2>Update Movie</h2>
        <form:form method="post" modelAttribute="message" action="">
                      <div class="form-group">
                        <label for="name">Name of the Movie</label>
                        <form:input type="text" class="form-control" path="name" id="name"  value="${movie.name}" />

                      </div>
                    <div class="form-group">
                        <label for="year">Released Year</label>
                        <form:input type="text" class="form-control" path="year" id="year"  value="${movie.year}" />

                    </div>
                    <div class="form-group">
                        <label for="genre">Genre</label>
                        <form:input type="text" class="form-control" path="genre" id="genre"  value="${movie.genre}"/>

                     </div>
                    <div class="form-group">
                        <label for="actor">Actors</label>

                        <form:select path="actors" id="lstActors" multiple="multiple">

                                <c:forEach items="${actors}" var="actor">
                                    <option value="${actor.name}">
                                        ${actor.name}
                                    </option>
                                </c:forEach>
                        </form:select>

                    </div>



                    <div class="form-group">
                      <label for="description">Description</label>
                      <form:input type="text" class="form-control" path="description" id="description" value="${movie.description}" />


                    </div>
                    <div class="form-group">
                      <label for="link">Description</label>
                      <form:input type="text" class="form-control" path="link" id="link" value="${movie.link}" />


                    </div>
                      <form:button type="submit" class="btn btn-primary">Update</form:button>
                </form:form>
    </div>



<spring:url value="/resources/core/css/addactor.js" var="coreJs" />
<spring:url value="/resources/core/css/bootstrap.min.js" var="bootstrapJs" />

<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>