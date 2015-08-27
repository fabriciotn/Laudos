package DAO;

import Conecta.ConectaOracle;
import POJO.Usuarios;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuariosDAO {

    private Connection connection;

    public UsuariosDAO(){
        this.connection = ConectaOracle.conecta();
    }

    public void adiciona(Usuarios usuario){
        String sql = "INSERT INTO LD_USUARIOS (ID, NOME, MASP, ID_SETOR, ID_UNIDADE) " +
                "VALUES(LD_SEQ_USER.NEXTVAL, ?, ?, ?, ?)";
        try{
            PreparedStatement ps = this.connection.prepareStatement(sql);

            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getMasp());
            ps.setLong(3, usuario.getId_setor());
            ps.setLong(4, usuario.getId_unidade());

            ps.execute();
            ps.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    public List<Usuarios> getLista(){
        List<Usuarios> usuarios = new ArrayList<Usuarios>();
        String sql = "SELECT * FROM LD_USUARIOS ORDER BY ID";
            try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()){
                    Usuarios usuario = new Usuarios();

                    usuario.setId(rs.getLong("ID"));
                    usuario.setNome(rs.getString("NOME"));
                    usuario.setMasp(rs.getString("MASP"));
                    usuario.setId_setor(rs.getLong("ID_SETOR"));
                    usuario.setId_unidade(rs.getLong("ID_UNIDADE"));
                    usuario.setSistema(rs.getString("SISTEMA"));

                    usuarios.add(usuario);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return usuarios;
    }

    public List<Usuarios> getUsu(String masp){
        List<Usuarios> usuarios = new ArrayList<Usuarios>();
        String sql = "SELECT * FROM LD_USUARIOS WHERE MASP = ?";
            try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ps.setString(1, masp);
                ResultSet rs = ps.executeQuery();

                while(rs.next()){
                    Usuarios usuario = new Usuarios();

                    usuario.setId(rs.getLong("ID"));
                    usuario.setNome(rs.getString("NOME"));
                    usuario.setMasp(rs.getString("MASP"));
                    usuario.setId_setor(rs.getLong("ID_SETOR"));
                    usuario.setId_unidade(rs.getLong("ID_UNIDADE"));
                    usuario.setSistema(rs.getString("SISTEMA"));

                    usuarios.add(usuario);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return usuarios;
    }

    public List<Usuarios> getUsu(Long id){
        List<Usuarios> usuarios = new ArrayList<Usuarios>();
        String sql = "SELECT * FROM LD_USUARIOS WHERE ID = ?";
            try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ps.setLong(1, id);
                ResultSet rs = ps.executeQuery();

                while(rs.next()){
                    Usuarios usuario = new Usuarios();

                    usuario.setId(rs.getLong("ID"));
                    usuario.setNome(rs.getString("NOME"));
                    usuario.setMasp(rs.getString("MASP"));
                    usuario.setId_setor(rs.getLong("ID_SETOR"));
                    usuario.setId_unidade(rs.getLong("ID_UNIDADE"));
                    usuario.setSistema(rs.getString("SISTEMA"));

                    usuarios.add(usuario);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return usuarios;
    }

    /*
    public void edita(Usuarios usuario, Long id){
        String sql = "UPDATE USUARIOS SET NOME = ?" +
                ", MASP = ?" +
                ", SETOR = ?" +
                " WHERE ID = ?";
        try{
            PreparedStatement ps = this.connection.prepareStatement(sql);

            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getMasp());
            ps.setLong(3, usuario.getId_setor());
            ps.setLong(4,id);

            ps.execute();
            ps.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
     */

    public void exclui(Long id) {
        String sql = "DELETE FROM LD_USUARIOS WHERE ID = ?";
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
