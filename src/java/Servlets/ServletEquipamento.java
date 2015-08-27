package Servlets;

import DAO.EquipamentosDAO;
import POJO.Equipamentos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletEquipamento extends HttpServlet {
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=ISO-8859-1");
        PrintWriter out = response.getWriter();
        
        //recebe o nome do formulário jsp
        String nome = request.getParameter("nome");
        try {
            EquipamentosDAO dao = new EquipamentosDAO();
            Equipamentos equ = new Equipamentos();
            equ.setNome(nome);
            dao.adiciona(equ);

            //direciona novamente para a página equipamentos.jsp
            RequestDispatcher rd = request.getRequestDispatcher("equipamentos.jsp");
            rd.forward(request, response);
        } finally {
            out.close();
        }
    }
}
