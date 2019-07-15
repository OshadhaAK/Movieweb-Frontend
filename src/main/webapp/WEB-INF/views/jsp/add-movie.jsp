<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Maven + Spring MVC</title>

<spring:url value="/resources/core/css/addmovie.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
</head>

<body>

    <div class="container">
    <h2>Add Movie</h2>
        <form:form method="post" modelAttribute="message" action="/movies/submit-movie">
              <div class="form-group">
                <label for="name">Name of the Movie</label>
                <form:input type="text" class="form-control" path="name" id="name"  placeholder="Enter Name" />

              </div>
            <div class="form-group">
                <label for="year">Released Year</label>
                <form:input type="integer" class="form-control" path="year" id="year"  placeholder="Released Year" />

            </div>
            <div class="form-group">
                <label for="genre">Genre</label>
                <form:input type="text" class="form-control" path="genre" id="genre"  placeholder="Genre" />

             </div>
            <div class="form-group">

                <label for="actor">Actors</label>

                <form:select path="actors" id="lstActors"  multiple="multiple">

                        <c:forEach items="${actors}" var="actor">
                            <option value="${actor._id}">
                                ${actor.name}
                            </option>
                        </c:forEach>
                </form:select>

            </div>



            <div class="form-group">
              <label for="description">Description</label>
              <form:input type="text" class="form-control" path="description" id="description" placeholder="Description" />
            </div>

            <div class="form-group">
              <label for="link">Description</label>
              <form:input type="text" class="form-control" path="link" id="link" placeholder="Image link" />
            </div>

              <form:button type="submit" class="btn btn-primary">add</form:button>
        </form:form>
    </div>



<spring:url value="/resources/core/css/addmovie.js" var="coreJs" />
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