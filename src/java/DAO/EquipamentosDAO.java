package DAO;

import Conecta.ConectaOracle;
import POJO.Equipamentos;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EquipamentosDAO {

    private Connection connection;

    public EquipamentosDAO(){
        this.connection = ConectaOracle.conecta();
    }

    public void adiciona(Equipamentos equipamento){
        String sql = "INSERT INTO LD_TIPO (ID, TIPO) VALUES(LD_SEQ_TIPO.NEXTVAL, ?)";
        try{
            PreparedStatement ps = this.connection.prepareStatement(sql);

            ps.setString(1, equipamento.getNome());

            ps.execute();
            ps.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    public List<Equipamentos> getLista(){
        List<Equipamentos> equipamentos = new ArrayList<Equipamentos>();
        String sql = "SELECT * FROM LD_TIPO ORDER BY TIPO";
            try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while(rs.next()){
                    Equipamentos equipamento = new Equipamentos();

                    equipamento.setId(rs.getLong("ID"));
                    equipamento.setNome(rs.getString("TIPO"));

                    equipamentos.add(equipamento);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return equipamentos;
    }

    public List<Equipamentos> getUsu(Long id){
        List<Equipamentos> equipamentos = new ArrayList<Equipamentos>();
        String sql = "SELECT * FROM LD_TIPO WHERE ID = ?";
            try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ps.setLong(1, id);
                ResultSet rs = ps.executeQuery();

                while(rs.next()){
                    Equipamentos equipamento = new Equipamentos();

                    equipamento.setId(rs.getLong("ID"));
                    equipamento.setNome(rs.getString("TIPO"));

                    equipamentos.add(equipamento);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return equipamentos;
    }

    public void edita(Equipamentos equipamento, Long id){
        String sql = "UPDATE LD_TIPO SET TIPO = ?" +
                " WHERE ID = ?";
        try{
            PreparedStatement ps = this.connection.prepareStatement(sql);

            ps.setString(1, equipamento.getNome());
            ps.setLong(2,id);

            ps.execute();
            ps.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    public void exclui(Long id) {
        String sql = "DELETE FROM LD_TIPO WHERE ID = ?";
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