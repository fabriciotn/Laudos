<%--
    Author: Fabricio
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="DAO.PreliminaresDAO"%>
<%@page import="POJO.Preliminares"%>
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
            
            PreliminaresDAO dao = new PreliminaresDAO();
            List<Preliminares> preliminares = dao.getLista();
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
                <h2>Diagnósticos preliminares</h2>
                <form method="post" action="ServletPreliminar" name="preliminar">
                    <label for="nome">Preliminar:</label>
                    <input type="text" name="nome" maxlength="100" size="50"><br/>
                    <input type="submit" name="button" value="Cadastrar" id="submitbutton">
                </form>

                <br/><br/>
                <center>
                <table class="tb">
                    <tr>
                        <td class="tbHeader">ID</td>
                        <td class="tbHeader">Setor</td>
                        <td class="tbHeader">Ações</td>
                    </tr>
                    <%
                        int i = 0;
                        for (Preliminares preliminar : preliminares) {
                            if(i%2 == 0){
                                out.println("<tr>" +
                                    "<td align=\"center\" class=\"tbDetail2\"><b>" + preliminar.getId() + "</b></td>" +
                                    "<td class=\"tbDetail2\">" + preliminar.getNome() + "</td>" +
                                    "<td align=\"center\" class=\"tbDetail2\"><a href=\"excluiPreliminar.jsp?id="+ preliminar.getId() +"\">Excluir</a></td>" +
                                    "</tr>");
                            }else{
                                out.println("<tr>" +
                                    "<td align=\"center\" class=\"tbDetail1\"><b>" + preliminar.getId() + "</b></td>" +
                                    "<td class=\"tbDetail1\">" + preliminar.getNome() + "</td>" +
                                    "<td align=\"center\" class=\"tbDetail1\"><a href=\"excluiPreliminar.jsp?id="+ preliminar.getId() +"\">Excluir</a></td>" +
                                    "</tr>");
                            }
                            i++;
                        }
                    %>
                </table>
                </center>
            </div>
        </div>
    </body>
</html>