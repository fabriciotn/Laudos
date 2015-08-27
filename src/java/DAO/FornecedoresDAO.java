package DAO;

import Conecta.ConectaOracle;
import POJO.Fornecedores;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FornecedoresDAO {

    private Connection connection;

    public FornecedoresDAO(){
        this.connection = ConectaOracle.conecta();
    }

    public void adiciona(Fornecedores fornecedor){
        String sql = "INSERT INTO LD_FORNECEDOR (ID, NOME) VALUES(LD_SEQ_FORNECEDOR.NEXTVAL, ?)";
        try{
            PreparedStatement ps = this.connection.prepareStatement(sql);

            ps.setString(1, fornecedor.getNome());

            ps.execute();
            ps.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    public List<Fornecedores> getLista(){
        List<Fornecedores> fornecedores = new ArrayList<Fornecedores>();
        String sql = "SELECT * FROM LD_FORNECEDOR ORDER BY NOME";
            try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while(rs.next()){
                    Fornecedores fornecedor = new Fornecedores();

                    fornecedor.setId(rs.getLong("ID"));
                    fornecedor.setNome(rs.getString("NOME"));

                    fornecedores.add(fornecedor);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return fornecedores;
    }

    public List<Fornecedores> getUsu(Long id){
        List<Fornecedores> fornecedores = new ArrayList<Fornecedores>();
        String sql = "SELECT * FROM LD_FORNECEDOR WHERE ID = ?";
            try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ps.setLong(1, id);
                ResultSet rs = ps.executeQuery();

                while(rs.next()){
                    Fornecedores fornecedor = new Fornecedores();

                    fornecedor.setId(rs.getLong("ID"));
                    fornecedor.setNome(rs.getString("NOME"));

                    fornecedores.add(fornecedor);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return fornecedores;
    }

    public void edita(Fornecedores fornecedor, Long id){
        String sql = "UPDATE LD_FORNECEDOR SET NOME = ?" +
                " WHERE ID = ?";
        try{
            PreparedStatement ps = this.connection.prepareStatement(sql);

            ps.setString(1, fornecedor.getNome());
            ps.setLong(2,id);

            ps.execute();
            ps.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    public void exclui(Long id) {
        String sql = "DELETE FROM LD_FORNECEDOR WHERE ID = ?";
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