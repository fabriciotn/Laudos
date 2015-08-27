<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>
        <title>Login</title>
    </head>
    <body onload="foco()">
        <div id="tudo">
            <div id="frame">
                <iframe src="banner.jsp" height="100px" width="100%" frameborder="0" scrolling="no"></iframe>
            </div>
            <!Página de Login!>
            <div id="conteudo">
                <form method="post" action="Login" name="form">
                    <h2>Entre com usuário e senha</h2>
                    <label for="nome">Usuário:</label><input type="text" name="user" value=""><br/>
                    <label for="nome">Senha:</label><input type="password" name="pass" value=""><br/>
                    <input type="submit" value="Logar" id="submitbutton"><input type="reset" value="Limpar" id="resetbutton">
                </form>
            </div>
            <iframe src="rodape.jsp" width="180px" height="20px" frameborder="0" scrolling="no"></iframe>
        </div>
    </body>
</html>
