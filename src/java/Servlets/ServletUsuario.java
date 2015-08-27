package Servlets;

import DAO.UsuariosDAO;
import POJO.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletUsuario extends HttpServlet {
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=ISO-8859-1");
        PrintWriter out = response.getWriter();

        //recebe o nome do formulário jsp
        String nome     = request.getParameter("nome");
        String masp     = request.getParameter("masp");
        Long id_setor   = Long.parseLong(request.getParameter("setor"));
        Long id_unidade = Long.parseLong(request.getParameter("unidade"));


        try {
            UsuariosDAO dao = new UsuariosDAO();
            Usuarios usu = new Usuarios();
                usu.setNome(nome);
                usu.setMasp(masp);
                usu.setId_setor(id_setor);
                usu.setId_unidade(id_unidade);
            dao.adiciona(usu);

            //direciona novamente para a página setores.jsp
            RequestDispatcher rd = request.getRequestDispatcher("usuarios.jsp");
            rd.forward(request, response);
        } finally {
            out.close();
        }
    } 
}
