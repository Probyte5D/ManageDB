<%-- 
    Document   : insert.jsp
    Created on : 15 dic 2024, 03:56:21
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
        <title>inserimento allievo</title>
    </head>
    <body>
        <h1>inserimento nuovo allievo</h1>

        <!-- Configurazione DataSource -->
        <sql:setDataSource 
            var="dbSource" 
            driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost/scuola2?useTimezone=true&serverTimezone=UTC"
            user="root" 
            password="admin" />

        <!-- Esecuzione dell'INSERT -->
        <sql:update dataSource="${dbSource}" var="dbResult">
            INSERT INTO allievi (nome, citta, spese) 
            VALUES (?, ?, ?);
           
            <sql:param value="${param.nome}" />
            <sql:param value="${param.citta}" />
            <sql:param value="${param.spese}" />
        </sql:update>

        <!-- Verifica del risultato -->
        <!-- Redirezione o messaggio -->
       <c:if test="${dbResult >= 1}">
             <c:redirect url="index.jsp">
                 <c:param name="msg" value="1 record inserito" />
        </c:redirect> 
        </c:if>
        <c:if test="${dbResult == 0}">
            <p>Errore nell'inserimento dell'allievo.</p>
        </c:if>


    </body>
</html>