package DAO;

import Conecta.ConectaOracle;
import POJO.Laudo;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class LaudoDAO {

    private Connection connection;

    public LaudoDAO(){
        this.connection = ConectaOracle.conecta();
    }

    public boolean adiciona(Laudo laudo){
        String sql = "INSERT INTO LD_LAUDOS (" +
                "ID" +
                ", ID_USUARIO" +
                ", ID_FORNECEDOR" +
                ", ID_PRELIMINAR" +
                ", ID_TIPO" +
                ", ID_SETOR" +
                ", ID_UNIDADE" +
                ", PATRIMONIO" +
                ", SERIE" +
                ", CONCLUSIVO" +
                ", OBS" +
                ", DT_LAUDO" +
                ", DT_FORNE" +
                ", NUM_LAUD_FORNE" +
                ", MARCA) " +
            "VALUES(LD_SEQ_LAUDOS.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try{
            PreparedStatement ps = this.connection.prepareStatement(sql);
            
            ps.setLong( 1, laudo.getId_usuario());
            ps.setLong( 2, laudo.getId_fornecedor());
            ps.setLong( 3, laudo.getId_preliminar());
            ps.setLong( 4, laudo.getId_tipo());
            ps.setLong( 5, laudo.getId_setor());
            ps.setLong( 6, laudo.getId_unidade());
            ps.setString( 7, laudo.getPatrimonio());
            ps.setString( 8, laudo.getSerie());
            ps.setString(9, laudo.getConclusivo());
            ps.setString(10, laudo.getObs());
            ps.setDate(11, new java.sql.Date(laudo.getDt_laudo().getTimeInMillis()));
            ps.setDate(12, new java.sql.Date(laudo.getDt_forne().getTimeInMillis()));
            ps.setString(13, laudo.getNum_laud_forne());
            ps.setString(14, laudo.getMarca());

            ps.execute();
            ps.close();
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public List<Laudo> getLaudo(Long id){
        List<Laudo> laudos = new ArrayList<Laudo>();
        String sql = "SELECT * FROM LD_LAUDOS WHERE ID = ? ORDER BY ID DESC";

            try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ps.setLong(1, id);
                ResultSet rs = ps.executeQuery();

                Calendar data  = Calendar.getInstance();
                Calendar data1  = Calendar.getInstance();
                
                while(rs.next()){
                    Laudo laudo = new Laudo();
                    laudo.setId(rs.getLong("ID"));
                    laudo.setId_usuario(rs.getLong("ID_USUARIO"));
                    laudo.setId_fornecedor(rs.getLong("ID_FORNECEDOR"));
                    laudo.setId_preliminar(rs.getLong("ID_PRELIMINAR"));
                    laudo.setId_tipo(rs.getLong("ID_TIPO"));
                    laudo.setId_setor(rs.getLong("ID_SETOR"));
                    laudo.setId_unidade(rs.getLong("ID_UNIDADE"));
                    laudo.setPatrimonio(rs.getString("PATRIMONIO"));
                    laudo.setSerie(rs.getString("SERIE"));
                    laudo.setConclusivo(rs.getString("CONCLUSIVO"));
                    laudo.setObs(rs.getString("OBS"));
                    data.setTime(rs.getDate("DT_LAUDO"));
                    laudo.setDt_laudo(data);
                    data1.setTime(rs.getDate("DT_FORNE"));
                    laudo.setDt_forne(data1);
                    laudo.setNum_laud_forne(rs.getString("NUM_LAUD_FORNE"));
                    laudo.setMarca(rs.getString("MARCA"));
   
                    laudos.add(laudo);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return laudos;
    }

    public List<Laudo> getLista(){
        List<Laudo> laudos = new ArrayList<Laudo>();
        String sql = "SELECT * FROM LD_LAUDOS ORDER BY ID DESC";
             try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                Calendar data  = Calendar.getInstance();
                Calendar data1  = Calendar.getInstance();

                while(rs.next()){
                    Laudo laudo = new Laudo();
                    laudo.setId(rs.getLong("ID"));
                    laudo.setId_usuario(rs.getLong("ID_USUARIO"));
                    laudo.setId_fornecedor(rs.getLong("ID_FORNECEDOR"));
                    laudo.setId_preliminar(rs.getLong("ID_PRELIMINAR"));
                    laudo.setId_tipo(rs.getLong("ID_TIPO"));
                    laudo.setId_setor(rs.getLong("ID_SETOR"));
                    laudo.setId_unidade(rs.getLong("ID_UNIDADE"));
                    laudo.setPatrimonio(rs.getString("PATRIMONIO"));
                    laudo.setSerie(rs.getString("SERIE"));
                    laudo.setConclusivo(rs.getString("CONCLUSIVO"));
                    laudo.setObs(rs.getString("OBS"));
                    data.setTime(rs.getDate("DT_LAUDO"));
                    laudo.setDt_laudo(data);
                    data1.setTime(rs.getDate("DT_FORNE"));
                    laudo.setDt_forne(data1);
                    laudo.setNum_laud_forne(rs.getString("NUM_LAUD_FORNE"));
                    laudo.setMarca(rs.getString("MARCA"));

                    laudos.add(laudo);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return laudos;
    }

        public List<Laudo> getListSetor(Long id_setor){
        List<Laudo> laudos = new ArrayList<Laudo>();
        String sql = "SELECT * FROM LD_LAUDOS WHERE ID_USUARIO IN (SELECT ID FROM LD_USUARIOS WHERE ID_SETOR = ?) ORDER BY ID";
             try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ps.setLong(1, id_setor);
                ResultSet rs = ps.executeQuery();

                Calendar data;
                Calendar data1;
                
                while(rs.next()){
                    data  = Calendar.getInstance();
                    data1  = Calendar.getInstance();
                    
                    Laudo laudo = new Laudo();
                    laudo.setId(rs.getLong("ID"));
                    laudo.setId_usuario(rs.getLong("ID_USUARIO"));
                    laudo.setId_fornecedor(rs.getLong("ID_FORNECEDOR"));
                    laudo.setId_preliminar(rs.getLong("ID_PRELIMINAR"));
                    laudo.setId_tipo(rs.getLong("ID_TIPO"));
                    laudo.setId_setor(rs.getLong("ID_SETOR"));
                    laudo.setId_unidade(rs.getLong("ID_UNIDADE"));
                    laudo.setPatrimonio(rs.getString("PATRIMONIO"));
                    laudo.setSerie(rs.getString("SERIE"));
                    laudo.setConclusivo(rs.getString("CONCLUSIVO"));
                    laudo.setObs(rs.getString("OBS"));
                    data.setTime(rs.getDate("DT_LAUDO"));
                    laudo.setDt_laudo(data);
                    data1.setTime(rs.getDate("DT_FORNE"));
                    laudo.setDt_forne(data1);
                    laudo.setNum_laud_forne(rs.getString("NUM_LAUD_FORNE"));
                    laudo.setMarca(rs.getString("MARCA"));

                    laudos.add(laudo);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return laudos;
    }

    public List<Laudo> getUltimo(){
        List<Laudo> laudos = new ArrayList<Laudo>();
        String sql = "SELECT * FROM LD_LAUDOS ORDER BY ID DESC";
             try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                Calendar data  = Calendar.getInstance();
                Calendar data1  = Calendar.getInstance();

                if(rs.next()){
                    Laudo laudo = new Laudo();
                    laudo.setId(rs.getLong("ID"));
                    laudo.setId_usuario(rs.getLong("ID_USUARIO"));
                    laudo.setId_fornecedor(rs.getLong("ID_FORNECEDOR"));
                    laudo.setId_preliminar(rs.getLong("ID_PRELIMINAR"));
                    laudo.setId_tipo(rs.getLong("ID_TIPO"));
                    laudo.setId_setor(rs.getLong("ID_SETOR"));
                    laudo.setId_unidade(rs.getLong("ID_UNIDADE"));
                    laudo.setPatrimonio(rs.getString("PATRIMONIO"));
                    laudo.setSerie(rs.getString("SERIE"));
                    laudo.setConclusivo(rs.getString("CONCLUSIVO"));
                    laudo.setObs(rs.getString("OBS"));
                    data.setTime(rs.getDate("DT_LAUDO"));
                    laudo.setDt_laudo(data);
                    data1.setTime(rs.getDate("DT_FORNE"));
                    laudo.setDt_forne(data1);
                    laudo.setNum_laud_forne(rs.getString("NUM_LAUD_FORNE"));
                    laudo.setMarca(rs.getString("MARCA"));

                    laudos.add(laudo);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return laudos;
    }

    public void exclui(Long id) {
        String sql = "DELETE FROM LD_LAUDOS WHERE ID = ?";
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