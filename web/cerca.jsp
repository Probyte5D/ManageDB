<%-- 
    Document   : cerca.jsp
    Created on : 16 dic 2024, 16:27:41
    Author     : primu
--%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> CERCA ALLIEVO </title>
    </head>
    <body>
        <h1>CERCA ALLIEVO</h1>
               <!-- Connessione al Database -->
    <sql:setDataSource 
        var="dbSource"
        driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost/scuola2?useTimezone=true&serverTimezone=UTC"
        user="root"
        password="admin"/>
   
    
    <!-- Recupera i dati in base al nome -->
    <sql:query dataSource="${dbSource}" var="dbResult">
        SELECT * FROM allievi WHERE nome LIKE '%${param.nome}%' 
    </sql:query>
    
    
<!-- Verifica se ci sono risultati per l'ID specificato -->
<c:if test="${not empty dbResult.rows}">
    <!-- Modulo di aggiornamento -->
    <form action="index.jsp" method="post">
        
    </form>
     <!-- tabella risultati -->
          <table border="2" width="350" >
              <tr>
                  <td bg color="cyan">ID allievo</td>
                  <td bg color="cyan">nome</td>
                  <td bg color="cyan">citta</td>
                  <td bg color="cyan">spese</td>
                  <td bg color="cyan">aggiorna allievo</td>
                  <td bg color="cyan">cancella allievo</td>
                 <td colspan = "2"></td>
              </tr>
               <c:forEach var="row" items="${dbResult.rows}">
                <tr>
                    <td>${row.idallievi}</td>
                    <td>${row.nome}</td>
                    <td>${row.citta}</td>
                    <td>${row.spese}</td>
                    
                      <td>  
                        <a href="updateForm.jsp?id=<c:out 
                            value="${row.idallievi}"/>">Aggiorna</a>         
                    </td>
                    
                     <td>  
               <a href="delete.jsp?id=<c:out 
                            value="${row.idallievi}"/>">cancella</a>         
                    </td>
                    
                </tr>
            </c:forEach>
        </table>
        
</c:if>
    
    <c:if test="${empty dbResult.rows}">
        <p>Nessun risultato trovato per "${param.nome}".</p>
    </c:if>
    
    </body>
</html>
