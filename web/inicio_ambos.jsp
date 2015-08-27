<%-- 
    Document   : inicio_ambos
    Created on : 22/08/2012, 16:16:38
    Author     : 12546446
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.UsuariosDAO"%>
<%@page import="POJO.Usuarios"%>
<%@page import="Servlets.Login"%>
<%@page import="java.util.List"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>

        <%
            //Recebe o valor da variável de sessão e valida se a sessão está ativa
            String masp = (String) session.getAttribute("user");
            if (masp == null) {
                response.sendRedirect("sair.jsp");
            }

            String nome = "";

            UsuariosDAO dao = new UsuariosDAO();
            List<Usuarios> usuarios = dao.getUsu(masp);

            for (Usuarios usuario : usuarios) {
                nome = usuario.getNome();
            }
        %>
        <title>Gerencia de Tecnologia da Informação e Comunicação - Fundação Hemominas</title>
    </head>
    <body>
        <div id="tudo">
            <div id="frame">
                <iframe src="banner.jsp" height="100px" width="100%" frameborder="0" scrolling="no"></iframe>
            </div>
            <div>
                <a href="sair.jsp">Logoff</a>
            </div>

            <div id="conteudo">
                <h3>Selecione sistema desejado.</h3>

                <div id="botao">
                    <ul>
                        <li><a href="inicio.jsp">Sistema de Laudos</a></li>
                        <li><a href="inicio_materiais.jsp">Sistema de Materiais</a></li>
                    </ul>
                    <br/><br/><br/>
                </div>
            </div>
        </div>
    </body>
</html>
