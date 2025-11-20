<%-- 
    Document   : salir
    Created on : 19 nov. 2025, 19:27:21
    Author     : truks
--%>

<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
