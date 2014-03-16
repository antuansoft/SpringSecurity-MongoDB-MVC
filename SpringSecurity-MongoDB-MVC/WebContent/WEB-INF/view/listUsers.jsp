<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>User List</title>
</head>
<body>

<h2>Your user info</h2>
 <h6><a href="j_spring_security_logout">Click here to logout</a></h6>
 <sec:authorize access="isAuthenticated()">
 Username: <sec:authentication property="principal.username" />
 Role: <sec:authentication property="principal.authorities"/>
 </sec:authorize>

<h6><a href="/menu">Back to Menu</a></h6>

<h3>USERS</h3>
<c:if  test="${!empty users}">
<table class="data">
<tr>
    <th>Name</th>
    <th>Surname</th>
    <th>Age</th>
    <th>Username</th>
    <th>Password</th>
    <th>Role</th>
    
    <th>&nbsp;</th>
</tr>
<c:forEach items="${users}" var="user">
    <tr>
        <td>${user.name} </td>
        <td>${user.surname} </td>
        <td>${user.age} </td>
        <td>${user.username} </td>
        <td>${user.password} </td>
        <td>${user.role} </td>
        
        <!-- <td><a href="delete/${user.id}">delete</a></td>  -->
    </tr>
</c:forEach>
</table>
</c:if>

</body>
</html>