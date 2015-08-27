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

            if (masp == null) {
                response.sendRedirect("sair.jsp");
            }

            UsuariosDAO dao = new UsuariosDAO();
            List<Usuarios> usuarios = dao.getUsu(masp);

            for (Usuarios usuario : usuarios) {
                nome = usuario.getNome();
            }
        %>

        <title>Sistema de Laudos Técnicos - Fundação Hemominas</title>
    </head>
    <body>

        <span id="MsgAguarde" style="display:none; font-size:11px;">
            Aguarde...
        </span>

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
                    <li><a href="novoLaudo.jsp">Novo Laudo</a></li>
                    <li><a href="pesqLaudoJQuery.jsp">Pesquisar Laudo</a></li>
                    <li><a href="adminValida.jsp">Administrador</a></li>
                    <%
                        if (sistema.contains("L") && sistema.contains("M")) {
                    %><li><a href="inicio_ambos.jsp">Mudar de sistema</a></li><%}%>
                </ul>
                <br/>
            </div>

            <div id="conteudo">
                <h2>Sistema de cadastro de Laudos técnicos.</h2>
                Bem vindo <%out.println("<b>" + nome + "</b>!");%><br/>
                <ul>
                    <li>Selecione o menu desejado para realizar os procedimentos:</li>
                </ul>
            </div>
        </div>
    </body>
</html>
