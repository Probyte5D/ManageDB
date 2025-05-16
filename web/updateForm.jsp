<%-- 
    Document   : updateForm.jsp
    Created on : 16 dic 2024, 17:14:01
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
        <title>aggiorna allievo</title>
    </head>
    <body>
        <h1>Aggiornamento allievi</h1>
        
         <!-- Connessione al Database -->
    <sql:setDataSource 
        var="dbSource"
        driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost/scuola2?useTimezone=true&serverTimezone=UTC"
        user="root"
        password="admin"/>

    <!-- Connessione al database -->
    <sql:setDataSource var="dbSource"
                       driver="com.mysql.cj.jdbc.Driver"
                       url="jdbc:mysql://localhost/scuola2?useTimezone=true&serverTimezone=UTC"
                       user="root"
                       password="admin"/>

    <!-- Recupero dei dati dell'allievo da aggiornare -->
    <sql:query dataSource="${dbSource}" var="dbResult">
        SELECT * FROM allievi WHERE idallievi = ${param.id}
    </sql:query>

    <c:if test="${not empty dbResult.rows}">
        <!-- Modulo di aggiornamento -->
        <form action="updateForm.jsp" method="post">
            <input type="hidden" name="id" value="${param.id}"/> <!-- Passa l'ID nel form -->

            <!-- Pre-compilazione dei dati -->
            <label>Nome: <input type="text" name="nome" value="${dbResult.rows[0].nome}" required /></label><br>
            <label>Città: <input type="text" name="citta" value="${dbResult.rows[0].citta}" required /></label><br>
            <label>Spese: <input type="text" name="spese" value="${dbResult.rows[0].spese}" required /></label><br>
            <input type="submit" value="Aggiorna Allievo">
        </form>
    </c:if>

    <c:if test="${not empty param.nome}">
        <!-- Aggiornamento dei dati nel database -->
        <sql:update dataSource="${dbSource}">
            UPDATE allievi 
            SET nome = '${param.nome}', citta = '${param.citta}', spese = '${param.spese}'
            WHERE idallievi = ${param.id}
        </sql:update>

        <c:redirect url="index.jsp">
            <c:param name="msg" value="Allievo aggiornato con successo!" />
        </c:redirect>
    </c:if>
</body>
</html>