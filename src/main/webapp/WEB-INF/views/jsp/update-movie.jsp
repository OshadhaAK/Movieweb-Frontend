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
        <form:form method="post" modelAttribute="message" action="/movies/update?id=${movie._id}">
                      <div class="form-group">
                        <label for="name">Name of the Movie</label>
                        <form:input type="text" class="form-control" path="name" id="name"  value="${movie.name}" />

                      </div>
                    <div class="form-group">
                        <label for="year">Released Year</label>
                        <form:input type="integer" class="form-control" path="year" id="year"  value="${movie.year}" />

                    </div>
                    <div class="form-group">
                        <label for="genre">Genre</label>
                        <form:input type="text" class="form-control" path="genre" id="genre"  value="${movie.genre}"/>

                     </div>
                    <div class="form-group">

                        <label for="actor">Actors</label>

                        <form:select path="actors" id="lstActors"  multiple="multiple">
                            <div>
                                <c:forEach items="${movie.actors}" var="actor">
                                    <option value="${actor._id}" selected>
                                        ${actor.name}
                                    </option>
                                </c:forEach>
                            </div>
                               <option disabled><hr></option>
                             <div>
                                <c:forEach items="${actors}" var="actor">
                                    <option value="${actor._id}" >
                                        ${actor.name}
                                    </option>
                                </c:forEach>
                             </div>
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
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
  <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
      rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
  <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
      rel="stylesheet" type="text/css" />
  <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
      type="text/javascript"></script>

  <script type="text/javascript">
  $(function () {
      $('#lstActors').multiselect({
          includeSelectAllOption: true

      });

  });
  </script>

</body>
</html>