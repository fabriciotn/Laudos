<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="DAO.EquipamentosDAO"%>
<%@page import="POJO.Equipamentos"%>
<%@page import="java.util.List"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; ISO-8859-1">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>
        <script type="text/javascripr" scr="script.js"></script>

        <%
            //Recebe o valor da variável de sessão e valida se a sessão está ativa
            String masp = (String) session.getAttribute("user");
            if (masp == null) {
                response.sendRedirect("sair.jsp");
            }
            
            EquipamentosDAO dao = new EquipamentosDAO();
            List<Equipamentos> equipamentos = dao.getLista();
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
                <h2>Tipos de Equipamentos</h2>
                <form method="post" action="ServletEquipamento" name="equipamento">
                    <label for="nome">Tipo equipamento:</label>
                    <input type="text" name="nome" maxlength="100" size="50"><br/>
                    <input type="submit" name="button" value="Cadastrar" id="submitbutton">
                </form>

                <br/><br/>
                <center>
                <table class="tb">
                    <tr>
                        <td class="tbHeader">ID</td>
                        <td class="tbHeader">Tipo Equipamento</td>
                        <td class="tbHeader">Ações</td>
                    </tr>
                <%
                    int i = 0;
                    for (Equipamentos equipamento : equipamentos) {
                        if(i%2 == 0){
                            out.println("<tr>" +
                                "<td align=\"center\" class=\"tbDetail2\"><b>" + equipamento.getId() + "</b></td>" +
                                "<td class=\"tbDetail2\">" + equipamento.getNome() + "</td>" +
                                "<td align=\"center\" class=\"tbDetail2\"><a href=\"excluiEquipamento.jsp?id="+ equipamento.getId() +"\">Excluir</a></td>" +
                                "</tr>");
                        }else{
                            out.println("<tr>" +
                                "<td align=\"center\" class=\"tbDetail1\"><b>" + equipamento.getId() + "</b></td>" +
                                "<td class=\"tbDetail1\">" + equipamento.getNome() + "</td>" +
                                "<td align=\"center\" class=\"tbDetail1\"><a href=\"excluiEquipamento.jsp?id="+ equipamento.getId() +"\">Excluir</a></td>" +
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