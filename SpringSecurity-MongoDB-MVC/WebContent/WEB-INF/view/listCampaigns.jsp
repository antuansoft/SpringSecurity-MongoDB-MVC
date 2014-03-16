<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Campaigns List</title>
</head>
<body>

<h2>Your user info</h2>
 <h6><a href="j_spring_security_logout">Click here to logout</a></h6>
 <sec:authorize access="isAuthenticated()">
 Username: <sec:authentication property="principal.username" />
 Role: <sec:authentication property="principal.authorities"/>
 </sec:authorize>
 
 <h6><a href="/menu">Back to Menu</a></h6>

<form:form method="post" action="addCampaing" commandName="new_campaign">
 
    <table>
    <tr>
        <td>Campaign Name:</td>
        <td><form:input path="name" /></td>
    </tr>
    <tr>
        <td>Cost</td>
        <td><form:input path="cost" /></td>
    </tr>
	<tr>
        <td>Customer</td>
        <td><form:input path="client" /></td>
    </tr>
   
    <tr>
        <td colspan="2">
            <input type="submit" value="add"/>
        </td>
    </tr>
</table> 
</form:form>


<h3>Campaigns</h3>
<c:if  test="${!empty campaigns}">
<table class="data">
<tr>
	
    <th>Name</th>
    <th>Cost</th>
    <th>Customer</th>
    <th>Action</th>
   
    
    <th>&nbsp;</th>
</tr>
<c:forEach items="${campaigns}" var="campaign">
    <tr>
   		
        <td>${campaign.name} </td>
        <td>${campaign.cost} </td>
        <td>${campaign.client} </td>
        
        <td><a href="deleteCampaing/${campaign.id}">delete</a></td>
    </tr>
</c:forEach>
</table>
</c:if>

</body>
</html>