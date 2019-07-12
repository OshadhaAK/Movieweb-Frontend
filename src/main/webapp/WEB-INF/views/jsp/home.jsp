<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Maven + Spring MVC</title>

<spring:url value="/resources/core/css/home.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
</head>

<body>

<div class="container"></div>
    <div id="exTab3" class="container">
        <ul  class="nav nav-pills">
                <li class="active">
                    <a  href="#1b" data-toggle="tab">Movies</a>
                </li>
                <li><a href="#2b" data-toggle="tab">Actors</a>
                </li>

         </ul>

    <div class="tab-content clearfix">
      <div class="tab-pane active" id="1b">
        <h3>Movies</h3>

        <c:forEach var="movie" items="${movies}" varStatus="loop">
                <div class="col-md-4" >
                    <div class="card" style="width: 18rem;">
                         <img class="card-img-top" src="https://ryanjayreviews.com/wp-content/uploads/2013/10/RJMC-4-Web-2.png" alt="" style=" width: 60%;height:50%">
                                <div class="card-body">
                                    <h5 class="card-title">${movie.name}</h5>

                                    <div class = "row">${movie.year}</div>
                                    <div class = "row">${movie.genre}</div>
                                    <div class = "row"><button class="btn btn-success" onclick="location.href='/movies/movie-details?id=${movie._id}'">view</button></div>
                                    </br>

                                 </div>
                          </div>
                     </div>
        </c:forEach>
      </div>
      <div class="tab-pane" id="2b">
            <h3>Actors</h3>
            <c:forEach var="actor" items="${actors}" varStatus="loop">
                   <div class="col-md-4" >
                       <div class="card" style="width: 18rem;">
                            <img class="card-img-top" src="https://amp.businessinsider.com/images/5b7d8ded64dce8bc068b4c03-750-563.jpg" alt="" style=" width: 80%;height:50%">
                                   <div class="card-body">
                                       <h5 class="card-title">${actor.name}</h5>

                                       <div class = "row"><button class="btn btn-success" onclick="location.href='/actors/actor-details?id=${actor._id}'">view</button></div>

                                       </br>

                                    </div>
                             </div>
                        </div>
             </c:forEach>
      </div>

</div>
<div class="btn-group btn-group-justified">
  <a href="/movies/add-movie" class="btn btn-success">Add Movie</a>
  <a href="/actors/add-actor" class="btn btn-success">Add Actor</a>

</div>

<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>



<spring:url value="/resources/core/css/home.js" var="coreJs" />
<spring:url value="/resources/core/css/bootstrap.min.js" var="bootstrapJs" />

<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>