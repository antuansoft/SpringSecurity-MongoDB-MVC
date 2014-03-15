<?xml version="1.0" encoding="UTF-8" ?>
<jsp:directive.page contentType="text/html" pageEncoding="UTF-8" />
 
              
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<% session.invalidate(); %>
You are now logged out!!

<a href="/login">go back</a>