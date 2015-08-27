package DAO;

import Conecta.ConectaOracle;
import POJO.Preliminares;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PreliminaresDAO {

    private Connection connection;

    public PreliminaresDAO(){
        this.connection = ConectaOracle.conecta();
    }

    public void adiciona(Preliminares preliminar){
        String sql = "INSERT INTO LD_PRELIMINAR (ID, PRELIMINAR) VALUES(LD_SEQ_PRELIMINAR.NEXTVAL, ?)";
        try{
            PreparedStatement ps = this.connection.prepareStatement(sql);

            ps.setString(1, preliminar.getNome());

            ps.execute();
            ps.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    public List<Preliminares> getLista(){
        List<Preliminares> preliminares = new ArrayList<Preliminares>();
        String sql = "SELECT * FROM LD_PRELIMINAR ORDER BY ID";
            try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while(rs.next()){
                    Preliminares preliminar = new Preliminares();

                    preliminar.setId(rs.getLong("ID"));
                    preliminar.setNome(rs.getString("PRELIMINAR"));

                    preliminares.add(preliminar);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return preliminares;
    }

    public List<Preliminares> getUsu(Long id){
        List<Preliminares> preliminares = new ArrayList<Preliminares>();
        String sql = "SELECT * FROM LD_PRELIMINAR WHERE ID = ?";
            try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ps.setLong(1, id);
                ResultSet rs = ps.executeQuery();

                while(rs.next()){
                    Preliminares preliminar = new Preliminares();

                    preliminar.setId(rs.getLong("ID"));
                    preliminar.setNome(rs.getString("PRELIMINAR"));

                    preliminares.add(preliminar);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return preliminares;
    }

    public void edita(Preliminares preliminar, Long id){
        String sql = "UPDATE LD_PRELIMINAR SET PRELIMINAR = ?" +
                " WHERE ID = ?";
        try{
            PreparedStatement ps = this.connection.prepareStatement(sql);

            ps.setString(1, preliminar.getNome());
            ps.setLong(2,id);

            ps.execute();
            ps.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    public void exclui(Long id) {
        String sql = "DELETE FROM LD_PRELIMINAR WHERE ID = ?";
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