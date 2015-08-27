<%-- 
    Document   : index
    Created on : 06/04/2011, 08:42:25
    Author     : Fabrício T. Nascimento
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
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
<%@page import="java.util.List"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; ISO-8859-1">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>
        <title>Sistema de Laudos Técnicos - Fundação Hemominas</title>
        <%
            //Recebe o valor da variável de sessão e valida se a sessão está ativa
            String masp = (String) session.getAttribute("user");
            if (masp == null) {
                response.sendRedirect("sair.jsp");
            }

            String nome = "";
            Long id = null;

            UsuariosDAO daoUni = new UsuariosDAO();
            List<Usuarios> usuarios = daoUni.getUsu(masp);

            for(Usuarios usuario : usuarios) {
                nome = usuario.getNome();
                id = usuario.getId();
            }
        %>
    </head>
    <body class="fundo">
        <div id="tudo">
            <div id="frame">
                <iframe src="banner.jsp" height="100px" width="100%" frameborder="0" scrolling="no"></iframe>
            </div>

            <div>
                <a href="sair.jsp">Logoff</a>
            </div>

            <div id="menu">
                <ul>
                    <li><a href="inicio.jsp">Página inicial</a></li>
                </ul>
                <br/>
            </div>

            <div id="conteudo">
                <h2 align="center">Laudo Técnico</h2>
                
                <form method="post" action="ServletLaudo" name="form">
                    <h4>Localização do equipamento</h4>
                    <label for="unidade">Unidade:</label>
                    <select name="unidade">
                        <option value="">-</option>
                    <%
                        UnidadesDAO dao = new UnidadesDAO();
                        List<Unidades> unidades = dao.getLista();
                        for (Unidades unidade : unidades) {
                            out.println("<option value=\"" + unidade.getId() + "\">" + unidade.getSigla() + " - " + unidade.getNome() +"</option>");
                        }
                    %>
                    </select>
                    <br/>
                    <label for="setor">Setor:</label>
                    <select name="setor">
                        <option value="">-</option>
                    <%
                        SetoresDAO dao1 = new SetoresDAO();
                        List<Setores> setores = dao1.getLista();
                        for (Setores setor : setores) {
                            out.println("<option value=\"" + setor.getId() + "\">" + setor.getNome() +"</option>");
                        }
                    %>
                    </select>
                    <br/>

                    <h4>Descrição do equipamento</h4>
                    <label for="tipo">Tipo:</label>
                    <select name="tipo">
                        <option value="">-</option>
                    <%
                        EquipamentosDAO dao2 = new EquipamentosDAO();
                        List<Equipamentos> equipamentos = dao2.getLista();
                        for (Equipamentos equipamento : equipamentos) {
                            out.println("<option value=\"" + equipamento.getId() + "\">" + equipamento.getNome() +"</option>");
                        }
                    %>
                    </select>
                    <br/>
                    <label for="marca">Marca e modelo:</label>
                    <input type="text" name="marca" value="" size="40">
                    <br/>
                    <label for="patrimonio">Patrimônio:</label>
                    <input type="text" name="patrimonio" value="" size="40">
                    <br/>
                    <label for="serie">Número de série:</label>
                    <input type="text" name="serie" value="" size="40">
                    <br/>

                    <h4>Diagnóstico</h4>
                    <label for="preliminar">Preliminar:</label>
                    <select name="preliminar">
                        <option value="">-</option>
                         <%
                            PreliminaresDAO dao3 = new PreliminaresDAO();
                            List<Preliminares> preliminares = dao3.getLista();
                            for (Preliminares preliminar : preliminares) {
                                out.println("<option value=\"" + preliminar.getId() + "\">" + preliminar.getNome() +"</option>");
                            }
                         %>
                    </select>
                    <br/>
                    <label for="conclusivo">Conclusivo:</label>
                    <textarea name="conclusivo" cols="31"></textarea>
                    <br/>
                    <label for="obs">Observações:</label>
                    <textarea name="obs" cols="31"></textarea>
                    <br/>

                    <h4>Dados do laudo do fornecedor</h4>
                    <label for="fornecedor">Fornecedor:</label>
                    <select name="fornecedor">
                        <option value="">-</option>
                    <%
                        FornecedoresDAO dao4 = new FornecedoresDAO();
                        List<Fornecedores> fornecedores = dao4.getLista();
                        for (Fornecedores fornecedor : fornecedores) {
                            out.println("<option value=\"" + fornecedor.getId() + "\">" + fornecedor.getNome() +"</option>");
                        }
                    %>
                    </select>
                    <br/>
                    <label for="num_laud_forne">Número do laudo:</label>
                    <input type="text" name="num_laud_forne" value="">
                    <br/>
                    <label for="data_forne">Data do laudo:</label>
                    <input type="text" name="data_forne" value="" onkeypress="formatar(this,'##/##/####');" size="10" maxlength="10"><small>(dd/mm/aaaa)</small>
                    <br/>

                    <h4>Responsável pelo laudo</h4>
                    <label for="responsavel">Nome:</label>
                    <b><%out.print(nome);%></b>
                    <input type="text" name="responsavel" value="<%out.print(id);%>" id="tx1" size="2">
                    <br/>
                    <label for="masp">Masp:</label>
                    <b><%out.print(masp);%></b>
                    <br/>

                    <input id="submitbutton" type="submit" value="Gravar" onclick="return valida();">
                    <input id="resetbutton" type="reset" value="Limpar">
                </form>
            </div>
        </div>         
    </body>
</html>

