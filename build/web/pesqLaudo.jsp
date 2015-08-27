<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.UnidadesDAO"%>
<%@page import="POJO.Unidades"%>
<%@page import="DAO.SetoresDAO"%>
<%@page import="POJO.Setores"%>
<%@page import="DAO.EquipamentosDAO"%>
<%@page import="POJO.Equipamentos"%>
<%@page import="DAO.PreliminaresDAO"%>
<%@page import="POJO.Preliminares"%>
<%@page import="DAO.FornecedoresDAO"%>
<%@page import="POJO.Fornecedores"%>
<%@page import="DAO.UsuariosDAO"%>
<%@page import="POJO.Usuarios"%>
<%@page import="DAO.LaudoDAO"%>
<%@page import="POJO.Laudo"%>
<%@page import="Servlets.Login"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>

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
            if (masp == null) {
                response.sendRedirect("sair.jsp");
            }

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

            UsuariosDAO dao = new UsuariosDAO();
            UnidadesDAO daoUni = new UnidadesDAO();
            LaudoDAO daoL = new LaudoDAO();
            SetoresDAO daoSet = new SetoresDAO();
            EquipamentosDAO daoEqu = new EquipamentosDAO();
            FornecedoresDAO daoFor = new FornecedoresDAO();

            /* Recebe os dados do usuário que está logado para
             * selecionar somento os laudos referentes ao seu próprio setor*/
            Long id_setor = null;
            List<Usuarios> usuarios = dao.getUsu(masp);
            for (Usuarios usuario : usuarios) {
                id_setor = usuario.getId_setor();
            }

            List<Laudo> laudos = daoL.getListSetor(id_setor);
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
                    <li><a href="inicio.jsp">Voltar</a></li>
                </ul>
                <br/>
            </div>
            
            <div id="conteudo">
                <center>
                <table class="tb">
                    <tr>
                        <td class="tbHeader" align="center">COD</td>
                        <td class="tbHeader" align="center">Data</td>
                        <td class="tbHeader" align="center">Unidade</td>
                        <td class="tbHeader" align="center">Setor</td>
                        <td class="tbHeader" align="center">Equipamento</td>
                        <td class="tbHeader" align="center">Fornecedor</td>
                        <td class="tbHeader" align="center">Responsável</td>
                        <td class="tbHeader" align="center">Ações</td>
                    </tr>
                        <%
                        int i = 0;
                        String unidade     = "";
                        String setor       = "";
                        String equipamento = "";
                        String fornecedor  = "";
                        String responsavel = "";
                        
                        for (Laudo l : laudos) {

                            //recebendo a sigla da unidade do laudo.
                            List<Unidades> unidades = daoUni.getUsu(l.getId_unidade());
                            for (Unidades un : unidades) {
                                unidade = un.getSigla();
                            }

                            //recebendo o nome do setor referente ao laudo.
                            List<Setores> setores = daoSet.getUsu(l.getId_setor());
                            for (Setores s : setores) {
                                setor = s.getNome();
                            }
                                                        
                            //recebendo o nome do equipamento referente ao laudo.
                            List<Equipamentos> equipamentos = daoEqu.getUsu(l.getId_tipo());
                            for (Equipamentos e : equipamentos) {
                                equipamento = e.getNome();
                            }

                            //recebendo os nome do fornecedor referente ao laudo.
                            List<Fornecedores> fornecedores = daoFor.getUsu(l.getId_fornecedor());
                            for (Fornecedores f : fornecedores) {
                                fornecedor = f.getNome();
                            }

                            //recebendo o nome do usuário que gerou o laudo.
                            usuarios = dao.getUsu(l.getId_usuario());
                            for (Usuarios usuario : usuarios) {
                                responsavel = usuario.getNome();
                            }
                            
                            if (i % 2 == 0) {
                                out.println("<tr>" +
                                        "<td align=\"center\" class=\"tbDetail2\"><b>" + l.getId() + "</b></td>" +
                                        "<td class=\"tbDetail2\">" + sdf.format(l.getDt_laudo().getTimeInMillis()) + "</td>" +
                                        "<td align=\"center\" class=\"tbDetail2\">" + unidade + "</td>" +
                                        "<td class=\"tbDetail2\">" + setor + "</td>" +
                                        "<td class=\"tbDetail2\">" + equipamento + "</td>" +
                                        "<td class=\"tbDetail2\">" + fornecedor + "</td>" +
                                        "<td class=\"tbDetail2\">" + responsavel + "</td>" +
                                        "<td align=\"center\" class=\"tbDetail2\">" +
                                                "<a href=\"visualiza.jsp?id_laudo="+ l.getId() + "&id_setor="+id_setor+"\" target=\"blank\">Visualizar</a><br/>" +
                                                "<a href=\"excluiLaudo.jsp?id=" + l.getId() +"\">Excluir</a>" +
                                        "</td>" +
                                        "</tr>");
                            } else {
                                out.println("<tr>" +
                                        "<td align=\"center\" class=\"tbDetail1\"><b>" + l.getId() + "</b></td>" +
                                        "<td class=\"tbDetail1\">" + sdf.format(l.getDt_laudo().getTimeInMillis()) + "</td>" +
                                        "<td align=\"center\" class=\"tbDetail1\">" + unidade + "</td>" +
                                        "<td class=\"tbDetail1\">" + setor + "</td>" +
                                        "<td class=\"tbDetail1\">" + equipamento + "</td>" +
                                        "<td class=\"tbDetail1\">" + fornecedor + "</td>" +
                                        "<td class=\"tbDetail1\">" + responsavel + "</td>" +
                                        "<td align=\"center\" class=\"tbDetail1\">" +
                                                "<a href=\"visualiza.jsp?id_laudo="+ l.getId() + "&id_setor="+id_setor+"\" target=\"blank\">Visualizar</a><br/>" +
                                                "<a href=\"excluiLaudo.jsp?id=" + l.getId() + "\">Excluir</a>" +
                                        "</td>" +
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
