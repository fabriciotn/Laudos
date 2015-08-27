<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="DAO.LaudoDAO"%>
<%@page import="POJO.Laudo"%>
<%@page import="DAO.UnidadesDAO"%>
<%@page import="POJO.Unidades"%>
<%@page import="DAO.SetoresDAO"%>
<%@page import="POJO.Setores"%>
<%@page import="DAO.EquipamentosDAO"%>
<%@page import="POJO.Equipamentos"%>
<%@page import="DAO.PreliminaresDAO"%>
<%@page import="POJO.Preliminares"%>
<%@page import="DAO.UsuariosDAO"%>
<%@page import="POJO.Usuarios"%>
<%@page import="DAO.FornecedoresDAO"%>
<%@page import="POJO.Fornecedores"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>
        <title>Laudo Técnico</title>
    </head>
    <body class="espaco" onload="imprime();">
        <%
            //Recebe o valor da variável de sessão e valida se a sessão está ativa
            String mas = (String) session.getAttribute("user");
            if (mas == null) {
                response.sendRedirect("sair.jsp");
            }

            Long id_laudo = (Long) session.getAttribute("laudo");

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
        %>
        <div  id="tudo1">
            <table style="border: 2px solid black" id="tudo1">
                <tr>
                    <td width="30%">
                        <img alt="Hemominas" src="img/logoHemominas.png" width="200px" >
                    </td>
                    <td align="center">
                        <h2>CAT - Comissão de Avaliação Tecnológica</h2>
                    </td>
                    <td width="20%" align="right">
                        <b><%out.println(unidade);%>
                            <%out.println(id);%>
                                <b>/<%out.println(anoAtual);%></b>
                                </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="center">
                                        <h3>Solicitação de Baixa Patrimonial</h3>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="linha" colspan="3">
                                        <h4>1) Localização do equipamento</h4>
                                        <div id="tab"><b>Unidade:</b> <%out.println(unidade);%></div>
                                        <div id="tab"><b>Setor:</b> <%out.println(setor);%></div>
                                        <br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="linha" colspan="3">
                                        <h4>2) Descrição do equipamento</h4>
                                        <div id="tab"><b>Tipo:</b> <%out.println(tipo);%><br/></div>
                                        <div id="tab"><b>Marca e modelo:</b> <%out.println(marca);%></div>
                                        <div id="tab"><b>Patrimônio:</b> <%out.println(patrimonio);%></div>
                                        <div id="tab"><b>Número de Série:</b> <%out.println(serie);%></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="linha" colspan="3">
                                        <h4>3) Diagnóstico</h4>
                                        <div id="tab"><b>Preliminar:</b> <%out.println(preliminar);%></div>
                                        <div id="tab"><b>Conclusivo:</b> <%out.println(conclusivo);%></div>
                                        <div id="tab"><b>Observações:</b> <%out.println(obs);%></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="linha" colspan="3">
                                        <h4>4) Dados do laudo do garantidor</h4>
                                        <div id="tab"><b>Garantidor:</b> <%out.println(fornecedor);%></div>
                                        <div id="tab"><b>Nº da nota fiscal:</b> <%out.println(num_laud_forne);%></div>
                                        <div id="tab"><b>Data de emissão:</b> <%out.println(data_forne);%></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="linha" colspan="3">
                                        <div id="float">
                                            <h4>Belo Horizonte, <%out.println(data);%></h4>
                                        </div>
                                        <div id="float">
                                            __________________________________<br/>
                                            <b>Funcionário responsável</b><br/>
                                            <%out.println(responsavel);%><br/>
                                            <%out.println(masp);%><br/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="linha" align="center" colspan="3"><br><br>
                                        <div id="ass1">
                                            ______________________________<br/>
                                            <b><b></b><h3> Membro do CAT</h3></b><br/>
                                        </div>

                                        <div id="ass1">
                                            ______________________________<br/>
                                            <b><h3>Membro do CAT</h3></b><br/>
                                        </div>

                                        <div id="ass1">
                                            ______________________________<br/>
                                            <b><h3>Membro do CAT</h3></b>
                                        </div>
                                        </div>
                                    </td>
                                </tr>
                                </table>
                                </div>
                                </body>
                                <br>

                                <div style="border: 2px solid black" id="tudo1">
                                    <table  align="center" width="700px" bgcolor="#fff">
                                        <tr>
                                               <td width="30%">
                                            <img alt="Hemominas" src="img/logoHemominas.png" width="200px" >
                                        </td>
                                        <td align="center">
                                            <h2>CAT - Comissão de Avaliação Tecnológica</h2>
                                        </td>
                                        <td width="20%" align="right">
                                            <b><%out.println(unidade);%>
                                                <b><%out.println(id);%>
                                                    <b>/<%out.println(anoAtual);%></b>
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3" align="center">
                                                            <div id="float">
                                                                <div id="tab"><b>Belo Horizonte, <%out.println(data);%></b>
                                                                    <br>

                                                                    </td>
                                                                    </tr>
                                                                    <tr>
                                                                </div>
                                                                <td colspan="5">
                                                                    <br>
                                                                    <div id="tab"><b><h2>COMUNICAÇÃO DE BAIXA</h2></div>
                                                                    <div id="tab"><b>De: CAT - Comitê de Avaliação Tecnológica</div>
                                                                    <div id="tab"><b>Unidade:</b> <%out.println(unidade);%></div>
                                                                    <div id="tab"><b>Setor:</b> <%out.println(setor);%></div>
                                                                </td>
                                                    </tr>
                                                    <tr>
                                                        <td id="tab" colspan="3">
                                                            <div id="tab"> <h3><div id="tab"></div> Sr.(a) Chefe, <br>
                                                                    Comunicamos a V.Sª que:
                                                                    <br>
                                                                    <br>O(s) equipamento(s):</b> <%out.println(tipo);%><br/>
                                                                    <b>Patrimônio(s) nº:</b> <%out.println(patrimonio);%>
                                                                    <br>Está sendo encaminhado ao serviço de Patrimônio objetivando a baixa patrimonial do mesmo
                                                                    conforme avaliação do CAT - Comitê de Avaliação Tecnológica.
                                                                    <br><br>Desta forma, a referida chefia deverá avaliar a necessidade de aquisição de outra, se for o caso,
                                                                    objetivando reposição.</h3></div>

                                                            <br/><br/><br/><br/><br/>

                                                            <div id="tab"><h3>Atenciosamente</h3><b></b>
                                                                <h3>CAT - Comitê de Avaliação Tecnológica</h3></div>
                                                            <br/><br/><br/><br/><br/><br/><br/><br/><br><br><br/><br><br>
                                                        </td>
                                                    </tr>
                                                    </td>
                                                    </tr>
                                                    </table>
                                                    </div>
                                                    </body>
                                                    </html>
