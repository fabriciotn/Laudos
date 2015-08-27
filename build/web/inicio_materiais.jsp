<%-- 
    Document   : inicio_materiais
    Created on : 23/08/2012, 16:18:17
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
            //Recebe a variável da sessão. Variável user
            String masp = (String) session.getAttribute("user");
            String sistema = (String) session.getAttribute("sistema");
            String nome = "";

            //verifica se o usuário está logado.
            if (masp == null) {
                response.sendRedirect("sair.jsp");
            }

            UsuariosDAO dao = new UsuariosDAO();
            List<Usuarios> usuarios = dao.getUsu(masp);

            for(Usuarios usuario : usuarios) {
                nome = usuario.getNome();
            }
        %>

        <title>Sistema de Gerenciamento de Materiais - Fundação Hemominas</title>
    </head>
    <body>
        <div id="tudo">
            <div id="frame">
                <iframe src="banner.jsp" height="100px" width="100%" frameborder="0" scrolling="no"></iframe>
            </div>

            <div>
                <a href="sair.jsp">Logoff</a>
            </div>
            <!Listagem do Menu!>
            <div id="menu">
                <ul>
                    <li><a href="nova_Solicitacao.jsp">Nova Solicitção</a></li>
                    <li><a href="pesquisa_Solicitacao.jsp">Pesquisar Solicitação</a></li>
                    <li><a href="relatorios.jsp">Relatorios</a></li>
                    <%
                    if(sistema.contains("L") && sistema.contains("M")){
                    %><li><a href="inicio_ambos.jsp">Mudar de sistema</a></li><%
                    }
                    %>
                </ul>
                <br/>
            </div>

            <div id="conteudo">
                <h2>Sistema de Gerenciamento de Materiais - GTC.STF.</h2>
                Bem vindo <%out.println("<b>" + nome + "</b>!");%><br/>
                <ul>
                    <li>Selecione o menu desejado para realizar os procedimentos:</li>
                </ul>
            </div>
        </div>
    </body>
</html>