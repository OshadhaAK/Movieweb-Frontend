<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Maven + Spring MVC</title>

<spring:url value="/resources/core/css/hello.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
</head>

<body>

    <div class="container">

        <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Date of Birth</th>
                            <th>Description</th>

                        </tr>
                    </thead>


                        <tr>
                            <td><img src="${message.link}" alt="" style=" width:20rem;height:30rem"></td>
                            <td>${message.name}</td>
                            <td>${message.dateofbirth}</td>
                            <td>${message.description}</td>
                            <td><button class="btn btn-primary" onclick="location.href='/actors/update-actor?id=${message._id}'">Update</button></td>
                            <td><button class="btn btn-danger" onclick="location.href='/actors/delete-actor?id=${message._id}'">Delete</button></td>
                        </tr>

        </table>










    </div>



<spring:url value="/resources/core/css/hello.js" var="coreJs" />
<spring:url value="/resources/core/css/bootstrap.min.js" var="bootstrapJs" />

<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>