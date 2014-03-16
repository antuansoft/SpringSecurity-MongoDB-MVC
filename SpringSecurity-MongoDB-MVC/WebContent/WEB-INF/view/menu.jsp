<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
	<body>
		<h1 id="banner">Welcome to Spring Security MongoDB Demo</h1>
		
		<h2>Your user info</h2>
		 <h6><a href="j_spring_security_logout">Click here to logout</a></h6>
		 <sec:authorize access="isAuthenticated()">
		 Username: <sec:authentication property="principal.username" />
		 Role: <sec:authentication property="principal.authorities"/>
		 </sec:authorize>
		
		<h1 id="banner">MENU</h1>  
		<p class="message"></p>
		<a href="/listUsers">Users</a> 

		<p class="message"></p>
		<a href="/listCampaigns">Campaigns</a> 
	
		
		<p class="message"></p>
		<a href="/logout">Log-out</a> 
	</body>
</html>