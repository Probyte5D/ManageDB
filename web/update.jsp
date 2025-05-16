<%-- 
    Document   : update.jsp
    Created on : 16 dic 2024, 19:26:07
    Author     : primu
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Esegui l'aggiornamento dei dati nel database -->
<sql:update dataSource="${dbSource}">
    UPDATE allievi
    SET nome = '${param.nome}', citta = '${param.citta}', spese = '${param.spese}'
    WHERE idallievi = ${param.id}
</sql:update>

<!-- Dopo l'aggiornamento, fai un redirect alla pagina principale (index.jsp) per mostrare i dati aggiornati -->
<c:redirect url="index.jsp">
    <c:param name="msg" value="Allievo aggiornato con successo!"/>
</c:redirect>