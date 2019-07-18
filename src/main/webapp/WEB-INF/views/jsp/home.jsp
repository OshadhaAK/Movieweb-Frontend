<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <title>Movie WebApp</title>
    <style>
    body {
      font-family: "Lato", sans-serif;
    }

    .sidenav {
      height: 100%;
      width: 160px;
      position: fixed;
      z-index: 1;
      top: 0;
      left: 0;
      background-color: #111;
      overflow-x: hidden;
      padding-top: 20px;
    }

    .sidenav a {
      padding: 6px 8px 6px 16px;
      text-decoration: none;
      font-size: 25px;
      color: #818181;
      display: block;
    }

    .sidenav a:hover {
      color: #f1f1f1;
    }

    .main {
      margin-left: 160px; /* Same as the width of the sidenav */
      font-size: 28px; /* Increased text to enable scrolling */
      padding: 0px 10px;
    }

    @media screen and (max-height: 450px) {
      .sidenav {padding-top: 15px;}
      .sidenav a {font-size: 18px;}
    }
    .zoom {
      padding: 20px;
      background-color: #d9b3ff;
      transition: transform .2s; /* Animation */


    }

    .zoom:hover {
      transform: scale(1.1); /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
    }
    </style>
  </head>
  <body>
        <div class="sidenav">
            <img class="d-block w-100" src="https://png.pngtree.com/element_pic/16/11/25/338b05c261d71d7d21fad2d393bebeca.jpg">
          <a href="/movies/add-movie">Add Movie</a>
          <a href="/actors/add-actor">Add Actor</a>
        </div>

        <div class="main" style="background-color:#111;">
            <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel" >
              <div class="carousel-inner">
                <div class="carousel-item active" style="height:30rem">
                  <img class="d-block w-100" src="https://images4.alphacoders.com/653/653613.jpg" alt="First slide">
                </div>
                <div class="carousel-item" style="height:30rem">
                  <img class="d-block w-100" src="http://www.sclance.com/wallpapers/movie-hd-wallpapers/movie-hd-wallpapers_1358164.jpg" alt="Second slide">
                </div>
                <div class="carousel-item" style="height:30rem">
                  <img class="d-block w-100" src="https://www.stereo.net.au/images/articles/Images/Aquaman_4K-Bluray-Review.jpg" alt="Third slide">
                </div>
              </div>
              <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
          <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Movies</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Actors</a>
            </li>

          </ul>

          <div class="tab-content" id="myTabContent" style="background-color:#111;">
            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

                    <div class="row">
                        <c:forEach var="movie" items="${movies}" varStatus="loop">
                                <div class="col-md-4" >
                                    <div class="card zoom" style="width: 20rem;height: 27rem; margin:20px" alt="Card image cap" onclick="location.href='/movies/movie-details?id=${movie._id}'">
                                    <input type="image" src="${movie.link}" style="height: 50%;" name="saveForm" class="btTxt submit card-img-top" id="saveForm"  />

                                                <div class="card-body">
                                                    <h5 class="card-title" style="font-weight: bold;color:black;text-color:black;font-size:120%;">${movie.name}</h5>

                                                    <div class = "row">Year: ${movie.year}</div>
                                                    <div class = "row">Genre: ${movie.genre}</div>


                                                    </br>

                                                 </div>
                                          </div>
                                     </div>
                        </c:forEach>

                    </div>

            </div>
            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">

                <div class="row">

                    <c:forEach var="actor" items="${actors}" varStatus="loop">
                           <div class="col-md-4" >
                               <div class="card zoom" style="width: 18rem;height: 25rem;margin:20px">
                                    <input type="image" src="${actor.link}" style="height: 80%;" name="saveForm" class="btTxt submit card-img-top" id="saveForm" style=" width: 60%;height:50%;" onclick="location.href='/actors/actor-details?id=${actor._id}'"/>
                                           <div class="card-body">
                                               <h5 class="card-title" style="font-weight: bold;color:black;text-color:black;font-size:160%;">${actor.name}</h5>



                                               </br>

                                            </div>
                                     </div>
                                </div>
                     </c:forEach>

                </div>
            </div>


          </div>

        </div>






    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>