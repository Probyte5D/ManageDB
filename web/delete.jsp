<%-- 
    Document   : delete.jsp
    Created on : 16 dic 2024, 17:14:47
    Author     : primu
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>cancella allievo</title>
    </head>
    <body>
        <h1>cancella allievi</h1>
         <!-- Connessione al Database -->
    <sql:setDataSource 
        var="dbSource"
        driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost/scuola2?useTimezone=true&serverTimezone=UTC"
        user="root"
        password="admin"/>
    
    
    <%-- Cancella il record con l'ID specificato --%>
<sql:update dataSource="${dbSource}" var="deleteResult">
    DELETE FROM allievi WHERE idallievi = ${param.id}
</sql:update>
    <%-- Controlla il risultato e reindirizza --%>
<c:if test="${deleteResult >= 1}">
    <c:redirect url="index.jsp">
        <c:param name="msg" value="Record cancellato con successo" />
    </c:redirect>
</c:if>

<c:if test="${deleteResult == 0}">
    <p>Errore: il record non è stato cancellato.</p>
</c:if>
    </body>
</html>
