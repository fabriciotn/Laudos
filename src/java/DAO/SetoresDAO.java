package DAO;

import Conecta.ConectaOracle;
import POJO.Setores;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SetoresDAO {

    private Connection connection;

    public SetoresDAO(){
        this.connection = ConectaOracle.conecta();
    }

    public void adiciona(Setores setor){
        String sql = "INSERT INTO LD_SETOR (ID, NOME) VALUES(LD_SEQ_SETOR.NEXTVAL, ?)";
        try{
            PreparedStatement ps = this.connection.prepareStatement(sql);

            ps.setString(1, setor.getNome());

            ps.execute();
            ps.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    public List<Setores> getLista(){
        List<Setores> setores = new ArrayList<Setores>();
        String sql = "SELECT * FROM LD_SETOR ORDER BY NOME";
            try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while(rs.next()){
                    Setores setor = new Setores();

                    setor.setId(rs.getLong("ID"));
                    setor.setNome(rs.getString("NOME"));

                    setores.add(setor);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return setores;
    }

    public List<Setores> getUsu(Long id){
        List<Setores> setores = new ArrayList<Setores>();
        String sql = "SELECT * FROM LD_SETOR WHERE ID = ?";
            try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ps.setLong(1, id);
                ResultSet rs = ps.executeQuery();

                while(rs.next()){
                    Setores setor = new Setores();

                    setor.setId(rs.getLong("ID"));
                    setor.setNome(rs.getString("NOME"));

                    setores.add(setor);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return setores;
    }

    public void edita(Setores setor, Long id){
        String sql = "UPDATE LD_SETOR SET NOME = ?" +
                " WHERE ID = ?";
        try{
            PreparedStatement ps = this.connection.prepareStatement(sql);

            ps.setString(1, setor.getNome());
            ps.setLong(2,id);

            ps.execute();
            ps.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    public void exclui(Long id) {
        String sql = "DELETE FROM LD_SETOR WHERE ID = ?";
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