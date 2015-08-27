<%-- 
    Document   : nova_Solicitacao
    Created on : 24/08/2012, 14:22:29
    Author     : 12546446
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="DAO.UnidadesDAO"%>
<%@page import="POJO.Unidades"%>
<%@page import="DAO.SetoresDAO"%>
<%@page import="POJO.Setores"%>
<%@page import="DAO.EquipamentosDAO"%>
<%@page import="POJO.Equipamentos"%>
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
        <title>Sistema de Gerenciamento de Materiais - GTC.STI - Fundação Hemominas</title>
        <%
            //Recebe o valor da variável de sessão e valida se a sessão está ativa
            //String masp = (String) session.getAttribute("user");
            String masp = "12546446";
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
                    <li><a href="inicio_materiais.jsp">Página inicial</a></li>
                </ul>
                <br/>
            </div>

            <div id="conteudo">
                <h2 align="center">Solicitação de Equipamentos de Informática e TI</h2>
                
                <form method="post" action="ServletMateriais" name="form">
                    <h4>Identificação:</h4>
                    <label for="data_solicitacao">Data da solicitação</label>
                    <input type="text" name="data_solicitacao" value="" onkeypress="formatar(this,'##/##/####');" size="10" maxlength="10"><small>(dd/mm/aaaa)</small>
                    <br/>
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
                    <label for="responsavel">Responsável:</label>
                    <input type="text" name="responsavel" size="35">
                    <br/>

                    <h4>Identificação da necessidade e quantidade:</h4>
                    <input type="radio" name="necessidade" value="Aumento_da_demanda" checked="true">Aumento da demanda
                    <input type="radio" name="necessidade" value="Modernizacao">Modernização
                    <input type="radio" name="necessidade" value="Substituicao">Substituição
                    <input type="radio" name="necessidade" value="Baixa_patrimonial">Baixa patrimonial
                    <input type="radio" name="necessidade" value="Outros">Outros
                    
                    <br/>
                    <br/>
                    <label for="quantidade">Quantidade:</label>
                    <input type="text" name="quantidade" size="5">
                    
                    <br/>
                    <label for="motivo">Motivo</label>
                    <input type="text" name="motivo" value="" size="40">
                    
                    <br/>
                    <label for="patrimonio">Patrimônio:</label>
                    <input type="text" name="patrimonio" value="" size="40">
                    
                    <br/>
                    <label for="qtd_manutencoes">Quantidade de manutenções:</label>
                    <input type="text" name="qtd_manutencoes" value="" size="5"><br/>
                    <label for="qtd_manutencoes">&nbsp;</label>
                    <small>Número de manutenções corretivas nos últimos 06 (seis) meses</small>
                    <br/>

                    <h4>Dados do equipamento:</h4>
                    <label for="equipamento">Equipamento:</label>
                    <select name="equipamento" style="width:230px">
                        <option value="">-</option>
                    <%
                        EquipamentosDAO dao4 = new EquipamentosDAO();
                        List<Equipamentos> equipamentos = dao4.getLista();
                        for (Equipamentos e : equipamentos) {
                            out.println("<option value=\"" + e.getId() + "\">" + e.getNome() +"</option>");
                        }
                    %>
                    </select>
                    <br/>
                    
                    <label for="fornecedor">Fornecedor:</label>
                    <select name="fornecedor" style="width:230px">
                        <option value="">-</option>
                    <%
                        FornecedoresDAO dao5 = new FornecedoresDAO();
                        List<Fornecedores> fornecedores = dao5.getLista();
                        for (Fornecedores fornecedor : fornecedores) {
                            out.println("<option value=\"" + fornecedor.getId() + "\">" + fornecedor.getNome() +"</option>");
                        }
                    %>
                    </select>
                    <br/>
                    
                    <label for="obs">Observações:</label>
                    <textarea name="obs" cols="26"></textarea>
                    <br/>


                    <h4>Responsável pela digitação:</h4>
                    <label for="responsavel_digitacao">Nome:</label>
                    <b><%out.print(nome);%></b>
                    <br/>
                    
                    <label for="masp">Masp:</label>
                    <b><%out.print(masp);%></b>
                    <br/><br/>

                    <input id="submitbutton" type="submit" value="Gravar" onclick="return valida();">
                    <input id="resetbutton" type="reset" value="Limpar">
                </form>
            </div>
        </div>         
    </body>
</html>
