<%@page import="POJO.Fornecedores"%>
<%@page import="POJO.Usuarios"%>
<%@page import="POJO.Preliminares"%>
<%@page import="POJO.Equipamentos"%>
<%@page import="POJO.Setores"%>
<%@page import="POJO.Unidades"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="POJO.Laudo"%>
<%@page import="java.util.List"%>
<%@page import="DAO.LaudoDAO"%>
<%@page import="DAO.FornecedoresDAO"%>
<%@page import="java.util.Date"%>
<%@page import="DAO.UsuariosDAO"%>
<%@page import="DAO.PreliminaresDAO"%>
<%@page import="DAO.EquipamentosDAO"%>
<%@page import="DAO.UnidadesDAO"%>
<%@page import="DAO.SetoresDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>
        <title></title>
        <%
            //Recebe o valor da variável de sessão e valida se a sessão está ativa
            String mas = (String) session.getAttribute("user");
            if (mas == null) {
                response.sendRedirect("sair.jsp");
            }

            Long id_laudo = Long.parseLong(request.getParameter("id_laudo"));
            Long id_setor = Long.parseLong(request.getParameter("id_setor"));
            session.setAttribute("laudo", id_laudo);

            SetoresDAO daoSet = new SetoresDAO();
            UnidadesDAO daoUn = new UnidadesDAO();
            EquipamentosDAO daoEqu = new EquipamentosDAO();
            PreliminaresDAO daoPre = new PreliminaresDAO();
            UsuariosDAO daoUsu = new UsuariosDAO();
            FornecedoresDAO daoFor = new FornecedoresDAO();
            Date hoje = new Date();

            LaudoDAO dao = new LaudoDAO();
            List<Laudo> laudos = dao.getLaudo(id_laudo);
            SimpleDateFormat sdf = new SimpleDateFormat("dd 'de' MMMM 'de' yyyy", new Locale("pt", "BR"));
            SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy", new Locale("pt", "BR"));


            Long id = null;
            String unidade = "";
            String setor = "";
            String tipo = "";
            String marca = "";
            String patrimonio = "";
            String serie = "";
            String preliminar = "";
            String conclusivo = "";
            String obs = "";
            String responsavel = "";
            String masp = "";
            String data = "";
            String fornecedor = "";
            String data_forne = "dd/MM/yyyy";
            String num_laud_forne = "";
            String anoAtual = "2011";

            for (Laudo laud : laudos) {

                //Recebe a sigla da unidade de acordo com o id_unidade que está no laudo
                List<Unidades> unidades = daoUn.getUsu(laud.getId_unidade());
                for (Unidades un : unidades) {
                    unidade = un.getSigla();
                }

                //Recebe o nome do setor de acordo com o id_setor que está no laudo
                List<Setores> setores = daoSet.getUsu(laud.getId_setor());
                for (Setores set : setores) {
                    setor = set.getNome();
                }

                //Recebe o nome do tipo do equipamento de acordo com o id_tipo que está cadastrado no laudo
                List<Equipamentos> equipamentos = daoEqu.getUsu(laud.getId_tipo());
                for (Equipamentos equipamento : equipamentos) {
                    tipo = equipamento.getNome();
                }

                //Recebe o nome do diagnóstico preliminar de acordo com o id_preliminar que está cadastrado no laudo
                List<Preliminares> preliminares = daoPre.getUsu(laud.getId_preliminar());
                for (Preliminares pre : preliminares) {
                    preliminar = pre.getNome();
                }

                //Recebe o nome e masp do usuário que criou o laudo
                List<Usuarios> usuarios = daoUsu.getUsu(laud.getId_usuario());
                for (Usuarios usuario : usuarios) {
                    responsavel = usuario.getNome();
                    masp = usuario.getMasp();
                }

                //Recebe o nome do fornecedor de acordo com o id_fornecedor que está cadastrado no laudo.
                List<Fornecedores> fornecedores = daoFor.getUsu(laud.getId_fornecedor());
                for (Fornecedores forne : fornecedores) {
                    fornecedor = forne.getNome();
                }

                //Outros campos referente ao laudo selecionado.
                id = laud.getId();
                marca = laud.getMarca();
                patrimonio = laud.getPatrimonio();
                serie = laud.getSerie();
                conclusivo = laud.getConclusivo();
                obs = laud.getObs();
                data = sdf.format(laud.getDt_laudo().getTimeInMillis());
                data_forne = sdf1.format(laud.getDt_forne().getTimeInMillis());
                num_laud_forne = laud.getNum_laud_forne();
            }

            //verifica se o setor é o de manutenção, que atualmente está com o código 16
            String link = "";
            if (id_setor != 16) {
                link = "relatorioHelp.jsp";
                //response.sendRedirect();
            } else {
                link = "relatorioManut.jsp";
                //response.sendRedirect();
            }
        %>
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
                    <li><a href="pesqLaudoJQuery.jsp">Voltar</a></li>
                </ul>
                <br/>
            </div>

            <div id="conteudo">
                <h2>Detalhes do Laudo: <% out.println(id);%></h2>
                <table cellpadding="5" cellspacing="0" border="0" class="display">
                    <tr class="tbDetail1">
                        <td>Data do Laudo:</td>
                        <td><% out.println(data);%></td>
                    </tr>
                    <tr class="tbDetail2">
                        <td>Unidade:</td>
                        <td><% out.println(unidade);%></td>
                    </tr>
                    <tr class="tbDetail1">
                        <td>Setor:</td>
                        <td><% out.println(setor);%></td>
                    </tr>
                    <tr class="tbDetail2">
                        <td>Patrimonio:</td>
                        <td><% out.println(patrimonio);%></td>
                    </tr>
                    <tr class="tbDetail1">
                        <td>Tipo:</td>
                        <td><% out.println(tipo);%></td>
                    </tr>
                    <tr class="tbDetail2">
                        <td>Marca:</td>
                        <td><% out.println(marca);%></td>
                    </tr>
                    <tr class="tbDetail1">
                        <td>Serie:</td>
                        <td><% out.println(serie);%></td>
                    </tr>
                    <tr class="tbDetail2">
                        <td>Preliminar:</td>
                        <td><% out.println(preliminar);%></td>
                    </tr>
                    <tr class="tbDetail1">
                        <td>Conclusivo:</td>
                        <td><% out.println(conclusivo);%></td>
                    </tr>
                    <tr class="tbDetail2">
                        <td>Observacoes:</td>
                        <td><% out.println(obs);%></td>
                    </tr>
                    <tr class="tbDetail1">
                        <td>Fornecedor:</td>
                        <td><% out.println(fornecedor);%></td>
                    </tr>
                    <tr class="tbDetail2">
                        <td>Numero do Laudo do fornecedor:</td>
                        <td><% out.println(num_laud_forne);%></td>
                    </tr>
                    <tr class="tbDetail1">
                        <td>Data Laudo do fornecedor:</td>
                        <td><% out.println(data_forne);%></td>
                    </tr>
                    <tr class="tbDetail2">
                        <td>Responsavel:</td>
                        <td><% out.println(responsavel);%></td>
                    </tr>
                </table>
                <div id="botao">
                    <ul>
                        <li><a href="<%out.println(link);%>" target="_blank">Imprimir</a></li>
                    </ul>
                    <br/>
                </div>
            </div>
        </div>  
    </body>
</html>
