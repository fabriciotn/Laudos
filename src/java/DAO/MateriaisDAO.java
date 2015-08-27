package DAO;

import Conecta.ConectaOracle;
import POJO.Materiais;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author 12546446
 */
public class MateriaisDAO {
    
    private Connection connection;

    public MateriaisDAO(){
        this.connection = ConectaOracle.conecta();
    }
    
    public boolean adiciona(Materiais materiais){
        String sql = "INSERT INTO LD_CADSOLICITACAO (" +
                "ID_SOLICITACAO, " +
                "DATA_SOLICITA, " +
                "ID_UNIDADE, " +
                "ID_SETOR, " +
                "RESPONSAVEL, " +
                "NECESSIDADE, " +
                "QTD_EQUIPAMENTO, " +
                "MOTIVO, " +
                "PATRIMONIO, " +
                "QTD_MANUTENCOES, " +
                "ID_EQUIPAMENTO, " +
                "ID_FORNECEDOR, " +
                "OBS, " +
                "ID_USUARIO_DIGITACAO, " +
                "DATA_DIGITACAO) " +
            "VALUES(LD_SEQ_MATERIAIS.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try{
            PreparedStatement ps = this.connection.prepareStatement(sql);
            
            ps.setDate  ( 1, new java.sql.Date(materiais.getData_solicitacao().getTimeInMillis()));
            ps.setLong  ( 2, materiais.getId_unidade());
            ps.setLong  ( 3, materiais.getId_setor());
            ps.setString( 4, materiais.getResponsavel());
            ps.setString( 5, materiais.getNecessidade());
            ps.setInt   ( 6, materiais.getQtd_equipamento());
            ps.setString( 7, materiais.getMotivo());
            ps.setString( 8, materiais.getPatrimonio());
            ps.setInt   ( 9, materiais.getQtd_manutencoes());
            ps.setLong  (10, materiais.getId_equipamento());
            ps.setLong  (11, materiais.getId_fornecedor());
            ps.setString(12, materiais.getObs());
            ps.setLong  (13, materiais.getId_usuario_digitacao());
            ps.setDate  (14, new java.sql.Date(materiais.getData_digitacao().getTimeInMillis()));
            
            ps.execute();
            ps.close();
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
    public List<Materiais> getMateriais(Long id){
        List<Materiais> materiais = new ArrayList<Materiais>();
        String sql = "SELECT * FROM LD_CADSOLICITACAO WHERE ID_SOLICITACAO = ?";

            try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ps.setLong(1, id);
                ResultSet rs = ps.executeQuery();

                Calendar data  = Calendar.getInstance();
                Calendar data1  = Calendar.getInstance();
                
                while(rs.next()){
                    Materiais material = new Materiais();
                    
                    material.setId_solcitacao(rs.getLong("ID_SOLICITACAO"));
                    data.setTime(rs.getDate("DATA_SOLICITA"));
                    material.setData_solicitacao(data);
                    material.setId_unidade(rs.getLong("ID_UNIDADE"));
                    material.setId_setor(rs.getLong("ID_SETOR"));
                    material.setResponsavel(rs.getString("RESPONSAVEL"));
                    material.setNecessidade(rs.getString("NECESSIDADE"));
                    material.setQtd_equipamento(rs.getInt("QTD_EQUIPAMENTO"));
                    material.setMotivo(rs.getString("MOTIVO"));
                    material.setPatrimonio(rs.getString("PATRIMONIO"));
                    material.setQtd_manutencoes(rs.getInt("QTD_MANUTENCOES"));
                    material.setId_equipamento(rs.getLong("ID_EQUIPAMENTO"));
                    material.setId_fornecedor(rs.getLong("ID_FORNECEDOR"));
                    material.setObs(rs.getString("OBS"));
                    material.setId_usuario_digitacao(rs.getLong("ID_USUARIO_DIGITACAO"));

   
                    materiais.add(material);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return materiais;
    }
    
    public List<Materiais> getLista(){
        List<Materiais> materiais = new ArrayList<Materiais>();
        String sql = "SELECT * FROM LD_CADSOLICITACAO ORDER BY ID_SOLICITACAO DESC";
             try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                Calendar data  = Calendar.getInstance();
                Calendar data1  = Calendar.getInstance();

                while(rs.next()){
                    Materiais material = new Materiais();
                    
                    material.setId_solcitacao(rs.getLong("ID_SOLICITACAO"));
                    data.setTime(rs.getDate("DATA_SOLICITA"));
                    material.setData_solicitacao(data);
                    material.setId_unidade(rs.getLong("ID_UNIDADE"));
                    material.setId_setor(rs.getLong("ID_SETOR"));
                    material.setResponsavel(rs.getString("RESPONSAVEL"));
                    material.setNecessidade(rs.getString("NECESSIDADE"));
                    material.setQtd_equipamento(rs.getInt("QTD_EQUIPAMENTO"));
                    material.setMotivo(rs.getString("MOTIVO"));
                    material.setPatrimonio(rs.getString("PATRIMONIO"));
                    material.setQtd_manutencoes(rs.getInt("QTD_MANUTENCOES"));
                    material.setId_equipamento(rs.getLong("ID_EQUIPAMENTO"));
                    material.setId_fornecedor(rs.getLong("ID_FORNECEDOR"));
                    material.setObs(rs.getString("OBS"));
                    material.setId_usuario_digitacao(rs.getLong("ID_USUARIO_DIGITACAO"));

   
                    materiais.add(material);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return materiais;
    }
    
    public void exclui(Long id) {
        String sql = "DELETE FROM LD_CADSOLICITACAO WHERE ID_SOLCITACAO = ?";
        try {
            PreparedStatement ps = this.connection.prepareStatement(sql);
            ps.setLong(1, id);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
