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
        <link rel="stylesheet" href="css/table_jui.css" />
        <link rel="stylesheet" href="css/jquery-ui-1.8.4.custom.css" />
        <script type="text/javascript" src="JQuery/jquery.mim.js"></script>
        <script type="text/javascript" src="JQuery/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="script.js"></script>
        <script type="text/javascript" charset="utf-8">            
            $(document).ready(function() {
                oTable = $('#idTabela').dataTable({
                    "aoColumns": [
                        { "sType": 'numeric' },
                        { "sType": 'date' },
                        { "sType": 'html' },
                        { "sType": 'html' },
                        { "sType": 'html' },
                        { "sType": 'html' },
                        { "sType": 'html' }
                    ],
                    "bPaginate": true,
                    "bJQueryUI": true,
                    "sPaginationType": "full_numbers",
                    "iDisplayLength": 25 //quantidade de registros padrão
                });
            });
        </script>

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

            /*
             * Recebe os dados do usuário que está logado para selecionar
             * somento os laudos referentes ao seu próprio setor
             */
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
                    <table cellpadding="0" cellspacing="0" border="0" class="display" id="idTabela">
                        <thead>
                            <tr>
                                <th>COD</th>
                                <th>Data</th>
                                <th>Unidade</th>
                                <th>Patrimonio</th>
                                <th>Setor</th>
                                <th>Equipamento</th>
                                <th>Fornecedor</th>
                                <!--<th>Responsável</th>
                                <th>Ações</th>-->
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int i = 0;
                                String unidade = "";
                                String setor = "";
                                String equipamento = "";
                                String fornecedor = "";
                                //String responsavel = "";

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
                                    //usuarios = dao.getUsu(l.getId_usuario());
                                    //for (Usuarios usuario : usuarios) {
                                    //    responsavel = usuario.getNome();
                                    //}
                                    out.println("<tr>"
                                            + "<td>" + l.getId() + "</td>"
                                            + "<td>" + sdf.format(l.getDt_laudo().getTimeInMillis()) + "</td>"
                                            + "<td>" + unidade + "</td>"
                                            + "<td><a href=\"visualiza.jsp?id_laudo=" + l.getId() + "&id_setor=" + id_setor + "\">" + l.getPatrimonio() + "</a></td>"
                                            + "<td>" + setor + "</td>"
                                            + "<td>" + equipamento + "</td>"
                                            + "<td>" + fornecedor + "</td>"
                                            + //"<td>" + responsavel + "</td>" +
                                            //"<td>" +
                                            //        "<a href=\"visualiza.jsp?id_laudo="+ l.getId() + "&id_setor="+id_setor+"\" target=\"blank\">Visualizar</a><br/>" +
                                            //        "<a href=\"excluiLaudo.jsp?id=" + l.getId() +"\">Excluir</a>" +
                                            //"</td>" +
                                            "</tr>");
                                }
                                i++;
                            %>
                        </tbody>
                    </table>
                </center>
            </div>
        </div>
    </body>
</html>
