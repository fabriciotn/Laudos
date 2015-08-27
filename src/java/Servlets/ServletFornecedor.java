package Servlets;

import DAO.FornecedoresDAO;
import POJO.Fornecedores;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletFornecedor extends HttpServlet {
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        response.setContentType("text/html;charset=ISO-8859-1");
        PrintWriter out = response.getWriter();

        //recebe o nome do formulário jsp
        String nome = request.getParameter("nome");
        try {
            FornecedoresDAO dao = new FornecedoresDAO();
            Fornecedores fornecedor = new Fornecedores();
            fornecedor.setNome(nome);
            dao.adiciona(fornecedor);

            //direciona novamente para a página equipamentos.jsp
            RequestDispatcher rd = request.getRequestDispatcher("fornecedores.jsp");
            rd.forward(request, response);
        } finally {
            out.close();
        }
    } 
}
