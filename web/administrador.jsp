<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.UsuariosDAO"%>
<%@page import="POJO.Usuarios"%>
<%@page import="Servlets.Login"%>
<%@page import="java.util.List"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>

        <%
            //Recebe o valor da variável de sessão e valida se a sessão está ativa
            String masp = (String) session.getAttribute("user");
            if (masp == null) {
                response.sendRedirect("sair.jsp");
            }
            
            String nome = "";

            UsuariosDAO dao = new UsuariosDAO();
            List<Usuarios> usuarios = dao.getUsu(masp);

            for(Usuarios usuario : usuarios) {
                nome = usuario.getNome();
            }
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
                    <li><a href="inicio.jsp">Página inicial</a></li>
                </ul>
                <br/>
            </div>

            <div id="conteudo">
                <h3>Selecione o menu desejado.</h3>
               
                <div id="botao">
                    <ul>
                        <li><a href="setores.jsp">Setores</a></li>
                        <li><a href="unidades.jsp">Unidades</a></li>
                    </ul><br/><br/>
                    <ul>
                        <li><a href="equipamentos.jsp">Equipamentos</a></li>
                        <li><a href="preliminares.jsp">Preliminares</a></li>
                    </ul><br/><br/>
                    <ul>
                        <li><a href="usuarios.jsp">Usuários</a></li>
                        <li><a href="fornecedores.jsp">Fornecedores</a></li>
                    </ul>
                    <br/><br/><br/>
                </div>
            </div>
        </div>
    </body>
</html>