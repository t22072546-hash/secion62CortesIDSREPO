<%-- 
    Document   : rUsuario
    Created on : 9 nov. 2025, 16:30:52
    Author     : truks
--%>

<%@include file="conexion2.jsp"%>   
               <%
    //int matr=Integer.parseInt(request.getParameter("Matricula"));
    String usuario=request.getParameter("usuario");
    String contrase=request.getParameter("contrase"); 
    //String fusURL=matr+".jpg"; //URL DE FOTO
    //String matriculaID=String.valueOf(matr);
    st=conexion.prepareStatement("INSERT INTO prueba values (null,?,?)");
    //st.setInt(1, matr);
    st.setString(1, usuario);
    st.setString(2, contrase);
    st.execute();
    conexion.close();
    response.sendRedirect("index2.jsp");
        out.println("<meta http-equiv='refresh' content='0;url=index2.jsp'"); //actualizar pagina
        
%>