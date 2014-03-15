<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Horror Movie List</title>
</head>
<body>
 
<h2>Horror Movie Management</h2>
 <h6><a href="j_spring_security_logout">Click here to logout</a></h6>
 <sec:authorize access="isAuthenticated()">
 Username: <sec:authentication property="principal.username" />
 Role: <sec:authentication property="principal.authorities"/>
 </sec:authorize>
<form:form method="post" action="add" commandName="horrorMovie">
 
    <table>
    <tr>
        <td>Name:</td>
        <td><form:input path="horrormovie_name" /></td>
    </tr>
    <tr>
        <td>Director</td>
        <td><form:input path="horrormovie_director" /></td>
    </tr>

   
    <tr>
        <td colspan="2">
            <input type="submit" value="add"/>
        </td>
    </tr>
</table> 
</form:form>
 
     
<h3>HorrorMovies</h3>
<c:if  test="${!empty HorrorMovieList}">
<table class="data">
<tr>
    <th>Name</th>
    <th>Director</th>
    
    <th>&nbsp;</th>
</tr>
<c:forEach items="${HorrorMovieList}" var="hmlist">
    <tr>
        <td>${hmlist.horrormovie_name} </td>
        <td>${hmlist.horrormovie_director}</td>
        
        <td><a href="delete/${hmlist.horrormovie_id}">delete</a></td>
    </tr>
</c:forEach>
</table>
</c:if>
 
</body>
</html>