<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="DAO.UsuariosDAO"%>
<%@page import="POJO.Usuarios"%>
<%@page import="java.util.List"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; ISO-8859-1">
        <meta http-equiv="refresh" content="0;URL=usuarios.jsp">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>

        <%
            //Recebe o valor da variável de sessão e valida se a sessão está ativa
            String masp = (String) session.getAttribute("user");
            if (masp == null) {
                response.sendRedirect("sair.jsp");
            }
            
            Long id = Long.parseLong(request.getParameter("id"));
            UsuariosDAO dao = new UsuariosDAO();
            dao.exclui(id);
        %>

        <title>Sistema de Laudos Técnicos - Fundação Hemominas</title>
    </head>
    <body>
    </body>
</html>