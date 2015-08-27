package Servlets;

import DAO.PreliminaresDAO;
import POJO.Preliminares;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletPreliminar extends HttpServlet {
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=ISO-8859-1");
        PrintWriter out = response.getWriter();

        //recebe o nome do formulário jsp
        String nome = request.getParameter("nome");
        try {
            PreliminaresDAO dao = new PreliminaresDAO();
            Preliminares pre = new Preliminares();
            pre.setNome(nome);
            dao.adiciona(pre);

            //direciona novamente para a página setores.jsp
            RequestDispatcher rd = request.getRequestDispatcher("preliminares.jsp");
            rd.forward(request, response);
        } finally {
            out.close();
        }
    }
}
