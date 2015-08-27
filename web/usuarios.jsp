<%--
    Author     : Fabricio
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="DAO.SetoresDAO"%>
<%@page import="POJO.Setores"%>
<%@page import="DAO.UsuariosDAO"%>
<%@page import="POJO.Usuarios"%>
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
            //Recebe o valor da variável de sessão e valida se a sessão está ativa
            String masp = (String) session.getAttribute("user");
            if (masp == null) {
                response.sendRedirect("sair.jsp");
            }
            
            UsuariosDAO dao = new UsuariosDAO();
            List<Usuarios> usuarios = dao.getLista();
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
                <h2>Usuários</h2>
                <form method="post" action="ServletUsuario" name="usuarios">
                    <label for="nome">Nome:</label>
                    <input type="text" name="nome" maxlength="100" size="40"><br/>
                    <label for="masp">MASP:</label>
                    <input type="text" name="masp" maxlength="20" size="20"><br/>
                    <label for="setor">Setor:</label>
                    <select name="setor">
                        <%
                            SetoresDAO dao1 = new SetoresDAO();
                            List<Setores> setor = dao1.getLista();
                            for (Setores s : setor) {
                                out.print("<option value=\"" + s.getId() + "\">");
                                out.print(s.getNome());
                                out.print("</option>");
                            }
                        %>
                    </select>
                    <br/>
                    <label for="unidade">Unidade:</label>
                    <select name="unidade">
                        <%
                            UnidadesDAO dao2 = new UnidadesDAO();
                            List<Unidades> unidades = dao2.getLista();
                            for (Unidades u : unidades) {
                                out.print("<option value=\"" + u.getId() + "\">");
                                out.print(u.getNome());
                                out.print("</option>");
                            }
                        %>
                    </select>
                    <br/>
                    <input type="submit" name="button" value="Cadastrar" id="submitbutton">
                </form>

                <br/><br/>
                <center>
                <table class="tb">
                    <tr>
                        <td class="tbHeader">ID</td>
                        <td class="tbHeader">Nome</td>
                        <td class="tbHeader">MASP</td>
                        <td class="tbHeader">Setor</td>
                        <td class="tbHeader">Unidade</td>
                        <td class="tbHeader">Ações</td>
                    </tr>
                <%
                    int i = 0;
                    String nom_setor   = "";
                    String nom_unidade = "";

                    for (Usuarios usuario : usuarios) {
                        List<Setores> set = dao1.getUsu(usuario.getId_setor());
                        for (Setores s : set) {
                            nom_setor = s.getNome();
                        }

                        List<Unidades> unid = dao2.getUsu(usuario.getId_unidade());
                        for (Unidades u : unid) {
                            nom_unidade = u.getSigla();
                        }

                        if(i%2 == 0){
                            out.println("<tr>" +
                                "<td align=\"center\" class=\"tbDetail2\"><b>" + usuario.getId() + "</b></td>" +
                                "<td class=\"tbDetail2\">" + usuario.getNome() + "</td>" +
                                "<td class=\"tbDetail2\">" + usuario.getMasp() + "</td>" +
                                "<td class=\"tbDetail2\">" + nom_setor + "</td>" +
                                "<td align=\"center\" class=\"tbDetail2\">" + nom_unidade + "</td>" +
                                "<td align=\"center\" class=\"tbDetail2\"><a href=\"excluiUsuario.jsp?id="+ usuario.getId() +"\">Excluir</a></td>" +
                                "</tr>");
                        }else{
                            out.println("<tr>" +
                                "<td align=\"center\" class=\"tbDetail1\"><b>" + usuario.getId() + "</b></td>" +
                                "<td class=\"tbDetail1\">" + usuario.getNome() + "</td>" +
                                "<td class=\"tbDetail1\">" + usuario.getMasp() + "</td>" +
                                "<td class=\"tbDetail1\">" + nom_setor + "</td>" +
                                "<td align=\"center\" class=\"tbDetail1\">" + nom_unidade + "</td>" +
                                "<td align=\"center\" class=\"tbDetail1\"><a href=\"excluiUsuario.jsp?id="+ usuario.getId() +"\">Excluir</a></td>" +
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