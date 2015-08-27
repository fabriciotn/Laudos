<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="DAO.FornecedoresDAO"%>
<%@page import="POJO.Fornecedores"%>
<%@page import="java.util.List"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; ISO-8859-1">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>

        <%
            //Recebe o valor da variável de sessão e valida se a sessão está ativa
            String masp = (String) session.getAttribute("user");
            if (masp == null) {
                response.sendRedirect("sair.jsp");
            }
            
            Long id = Long.parseLong(request.getParameter("id"));
            FornecedoresDAO dao = new FornecedoresDAO();
            List<Fornecedores> fornecedores = dao.getUsu(id);
        %>

        <title>Sistema de Laudos Técnicos - Fundação Hemominas</title>
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
                    <li><a href="inicio.jsp">Página inicial</a></li>
                </ul>
                <br/>
            </div>

            <div id="conteudo">
                <%
                    for (Fornecedores fornecedor : fornecedores) {
                        out.println("<div id=\"alerta\">" +
                                "Tem certeza que deseja excluir o Fornecedor:" +
                                "<b> " + fornecedor.getNome() + "</b>?" +
                                "</div>");
                    }
                    out.println(
                            "<div id=\"botao\">" +
                                "<ul>" +
                                    "<li><a href=\"excluiFornecedor1.jsp?id="+ id +"\">Excluir</a></li>" +
                                    "<li><a href=\"fornecedores.jsp\">Voltar</a></li>" +
                                "</ul><br/><br/>" +
                            "</div>");
                %>
            </div>
        </div>
    </body>
</html>