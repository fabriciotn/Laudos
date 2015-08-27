package Servlets;

import DAO.LaudoDAO;
import POJO.Laudo;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletLaudo extends HttpServlet {

    public static Connection con;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(true);
        Long id_setor = (Long) session.getAttribute("setor");

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

        /*Recebendo os valores da página JSP
        Dados do Laudo*/
        Long unidade = Long.parseLong(request.getParameter("unidade"));
        Long setor = Long.parseLong(request.getParameter("setor"));
        Long tipo = Long.parseLong(request.getParameter("tipo"));
        Long preliminar = Long.parseLong(request.getParameter("preliminar"));
        Long responsavel = Long.parseLong(request.getParameter("responsavel"));
        Long fornecedor = Long.parseLong(request.getParameter("fornecedor"));
        String marca = request.getParameter("marca");
        String patrimonio = request.getParameter("patrimonio");
        String serie = request.getParameter("serie");
        String conclusivo = request.getParameter("conclusivo");
        String obs = request.getParameter("obs");
        String dt = request.getParameter("data_forne");
        Calendar dt_forne = Calendar.getInstance();
        try {
            dt_forne.setTime(sdf.parse(dt));
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        String num_laud_forne = request.getParameter("num_laud_forne");

        LaudoDAO dao = new LaudoDAO();
        Laudo laud = new Laudo();
        laud.setId_usuario(responsavel);
        laud.setId_fornecedor(fornecedor);
        laud.setId_preliminar(preliminar);
        laud.setId_tipo(tipo);
        laud.setId_setor(setor);
        laud.setId_unidade(unidade);
        laud.setPatrimonio(patrimonio);
        laud.setSerie(serie);
        laud.setConclusivo(conclusivo);
        laud.setObs(obs);
        laud.setDt_laudo(Calendar.getInstance());
        laud.setDt_forne(dt_forne);
        laud.setNum_laud_forne(num_laud_forne);
        laud.setMarca(marca);

        if (dao.adiciona(laud)) {
            LaudoDAO daoL = new LaudoDAO();
            List<Laudo> laudos = daoL.getUltimo();
            for(Laudo l : laudos){
                session.setAttribute("laudo", l.getId());
            }

            RequestDispatcher rd = null;

            //verifica se o setor é o de manutenção, que atualmente está com o código 16
            if (id_setor != 16) {
                rd = request.getRequestDispatcher("relatorioHelp.jsp");
            } else {
                rd = request.getRequestDispatcher("relatorioManut.jsp");
            }
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("erro.jsp");
            rd.forward(request, response);
        }
    }
}
