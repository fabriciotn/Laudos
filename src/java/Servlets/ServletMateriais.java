package Servlets;

import DAO.MateriaisDAO;
import DAO.UsuariosDAO;
import POJO.Materiais;
import POJO.Usuarios;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 12546446
 */
public class ServletMateriais extends HttpServlet {

    public static Connection con;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(true);
        String masp = session.getAttribute("user").toString();
        UsuariosDAO daoUni = new UsuariosDAO();
        List<Usuarios> usuarios = daoUni.getUsu(masp);
        Long id_usuario_digitacao = null;
        
        for (Usuarios usuario : usuarios) {
            id_usuario_digitacao = usuario.getId();
        }

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

        /*
         * Recebendo os valores da página JSP Dados do Laudo
         */
        Long unidade = Long.parseLong(request.getParameter("unidade"));
        Long setor = Long.parseLong(request.getParameter("setor"));
        String responsavel = request.getParameter("responsavel");
        Long fornecedor = Long.parseLong(request.getParameter("fornecedor"));
        String patrimonio = request.getParameter("patrimonio");
        String obs = request.getParameter("obs");
        String dt = request.getParameter("data_solicitacao");
        Calendar data_solicitacao = Calendar.getInstance();
        try {
            data_solicitacao.setTime(sdf.parse(dt));
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        String necessidade = request.getParameter("necessidade");
        String qtd_equipamento = request.getParameter("quantidade");
        String motivo = request.getParameter("motivo");
        String qtd_manutencoes = request.getParameter("qtd_manutencoes");
        Long equipamento = Long.parseLong(request.getParameter("equipamento"));

        Calendar data_dig = Calendar.getInstance();
        data_dig.setTime(new Date());

        MateriaisDAO dao = new MateriaisDAO();
        Materiais mat = new Materiais();

        mat.setData_solicitacao(data_solicitacao);
        mat.setId_unidade(unidade);
        mat.setId_setor(setor);
        mat.setResponsavel(responsavel);
        mat.setNecessidade(necessidade);
        mat.setQtd_equipamento(qtd_equipamento != null ? Integer.parseInt(qtd_equipamento) : 0);
        mat.setMotivo(motivo);
        mat.setPatrimonio(patrimonio);
        mat.setQtd_manutencoes(qtd_manutencoes != null ? Integer.parseInt(qtd_manutencoes) : 0);
        mat.setId_equipamento(equipamento);
        mat.setId_fornecedor(fornecedor);
        mat.setObs(obs);
        mat.setData_digitacao(data_dig);
        mat.setId_usuario_digitacao(id_usuario_digitacao);

        RequestDispatcher rd = null;
        
        if (dao.adiciona(mat)) rd = request.getRequestDispatcher("Confirmacao.jsp");
        else rd = request.getRequestDispatcher("erro.jsp");
        
        rd.forward(request, response);
    }
}
