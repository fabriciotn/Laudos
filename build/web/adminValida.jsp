<%-- 
    Document   : adminValida
    Created on : 11/05/2011, 16:06:06
    Author     : 12546446
--%>

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
        <title></title>
    </head>
    <body>
        <%
            //Recebe o valor da variável de sessão e valida se a sessão está ativa
            String masp = (String) session.getAttribute("user");
            if (masp == null) {
                response.sendRedirect("sair.jsp");
            }

            //não faz validação de usuário e envia para a parte de administrador
            //response.sendRedirect("administrador.jsp");
            //String masp = (String) session.getAttribute("user");
            UsuariosDAO dao = new UsuariosDAO();
            List<Usuarios> usuarios = dao.getUsu(masp);
            //Se não valida o login, o sistema emite uma mensagem de erro e exobe aopção de voltar.
            for (Usuarios usuario : usuarios) {
                out.println(usuario.getId_setor());
                if (usuario.getId_setor() == null) {
                    response.sendRedirect("erroLogin.jsp");
                } else {
                    response.sendRedirect("administrador.jsp");
                }
            }
        
        %>
    </body>
</html>
