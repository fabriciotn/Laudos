package Servlets;

import DAO.SetoresDAO;
import POJO.Setores;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletSetor extends HttpServlet {
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=ISO-8859-1");
        PrintWriter out = response.getWriter();

        //recebe o nome do formulário jsp
        String nome = request.getParameter("nome");
        try {
            SetoresDAO dao = new SetoresDAO();
            Setores set = new Setores();
            set.setNome(nome);
            dao.adiciona(set);

            //direciona novamente para a página setores.jsp
            RequestDispatcher rd = request.getRequestDispatcher("setores.jsp");
            rd.forward(request, response);
        } finally { 
            out.close();
        }
    } 
}
