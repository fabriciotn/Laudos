<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="DAO.LaudoDAO"%>
<%@page import="POJO.Laudo"%>
<%@page import="DAO.UnidadesDAO"%>
<%@page import="POJO.Unidades"%>
<%@page import="java.util.List"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; ISO-8859-1">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>

        <%
            //Recebe o valor da vari�vel de sess�o e valida se a sess�o est� ativa
            String masp = (String) session.getAttribute("user");
            if (masp == null) {
                response.sendRedirect("sair.jsp");
            }

            Long id = Long.parseLong(request.getParameter("id"));
            LaudoDAO dao = new LaudoDAO();
            List<Laudo> laudos = dao.getLaudo(id);

            UnidadesDAO dao1 = new UnidadesDAO();
        %>

        <title>Sistema de Laudos T�cnicos - Funda��o Hemominas</title>
    </head>
    <body>
        <div id="tudo">
            <div id="frame">
                <iframe src="banner.jsp" height="100px" width="100%" frameborder="0" scrolling="no"></iframe>
            </div>

            <div>
                <a href="sair.jsp">Logoff</a>
            </div>

            <div id="menu">
                <ul>
                    <li><a href="adminValida.jsp">Voltar</a></li>
                    <li><a href="inicio.jsp">P�gina inicial</a></li>
                </ul>
                <br/>
            </div>

            <div id="conteudo">
                <%
                String sigla_un = "";
                for (Laudo l : laudos) {
                    List<Unidades> unidades = dao1.getUsu(l.getId_unidade());
                    for(Unidades u : unidades){
                        sigla_un = u.getSigla();
                    }
                    out.println("<div id=\"alerta\">" +
                            "Tem certeza que deseja excluir o Laudo: " +
                            "<b> " + sigla_un + l.getId() + "</b>?" +
                            "</div>");
                }
                out.println(
                        "<div id=\"botao\">" +
                        "<ul>" +
                        "<li><a href=\"excluiLaudo1.jsp?id=" + id + "\">Excluir</a></li>" +
                        "<li><a href=\"pesqLaudo.jsp\">Voltar</a></li>" +
                        "</ul><br/><br/>" +
                        "</div>");
                %>
            </div>
        </div>
    </body>
</html>