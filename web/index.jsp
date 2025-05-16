<%-- 
    Document   : index.jsp
    Created on : 12 dic 2024, 00:10:34
    Author     : primu
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GESTIONE ALLIEVI</title>
        
        <style>
     /* Stile generale */
    body {
        background-color: #e3f2fd; /* Azzurro chiaro, più rilassante */
        font-family: Arial, sans-serif;
        text-align: center;
        margin: 0;
        padding: 20px;
    }

    h1 {
        color: #01579b; /* Blu scuro */
    }

    h2 {
        color: #0277bd;
    }

    .container {
        max-width: 600px;
        margin: auto;
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }

    input, button {
        padding: 8px;
        margin: 5px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 14px;
    }

    input {
        width: 80%;
        padding: 8px;
    }

    /* Stile per i bottoni */
    button {
        cursor: pointer;
        padding: 10px;
        font-weight: bold;
        border: none;
        transition: 0.3s;
    }

    .btn-primary {
        background-color: #0288d1; /* Blu acceso */
        color: white;
    }

    .btn-primary:hover {
        background-color: #0277bd;
    }

    .btn-danger {
        background-color: #d32f2f; /* Rosso */
        color: white;
    }

    .btn-danger:hover {
        background-color: #b71c1c;
    }

    .btn-update {
        background-color: #ff9800; /* Arancione */
        color: white;
    }

    .btn-update:hover {
        background-color: #e65100;
    }

    /* Stile tabella */
    table {
        width: 100%;
        margin-top: 20px;
        border-collapse: collapse;
    }

    table, th, td {
        border: 1px solid #ddd;
    }

    th, td {
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #0288d1; /* Blu */
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f1f1f1;
    }

    tr:hover {
        background-color: #bbdefb;
    }
</style>
        
    </head>
    <body bgcolor="yellow">
        <h1>GESTIONE DATABASE</h1>
   
         <!-- Connessione al Database -->
        <sql:setDataSource 
            var="dbSource"
            driver="com.mysql.cj.jdbc.Driver"
            url="jdbc:mysql://localhost/scuola2?useTimezone=true&serverTimezone=UTC"
            user="root"
            password="admin"/>
       <sql:query dataSource="${dbSource}" var="dbResult">
            SELECT * FROM allievi
        </sql:query> 
            
           <!-- Inserimento Nuovo Allievo -->
        <form action="insert.jsp" method="post">
        <IMG SRC="c:\\immagini\\scuola2.jpg" align="RIGHT">
        <h3 align="center">Sezione Archivio Allievi</h3>
        
        <p>Aggiungere Allievo</p>
       
        <label>Nome: <input type="text" name="nome"></label><br>
        <label>Città: <input type="text" name="citta"></label><br>
        <label>Spese: <input type="text" name="spese"></label><br>
        <input type="submit" value="Registra">
        <c:if test="${not empty param.msg}">  
            <c:out value="${param.msg}"/> 
        </c:if>
        
    </form>
            
        <form action="cerca.jsp" method="post">
        <br/>    
        <label>Cerca per nome</label>
        <input type="text" name="nome">
        <input type="submit" value="Cerca">
        </br>  
        <font color="blue">
         <c:if test="${not empty param.msg}">  
            <c:out value="${param.msg}"/> 
        </c:if>
        </font>
        </br>  

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
              
               <!-- Ciclo forEach per iterare sui risultati -->
            <c:forEach var="row" items="${dbResult.rows}">
                <tr>
                    <td><c:out value="${row.idallievi}" /></td>
                    <td><c:out value="${row.nome}" /></td>
                    <td><c:out value="${row.citta}" /></td>
                    <td><c:out value="${row.spese}" /></td>
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
    </body>
</html>
