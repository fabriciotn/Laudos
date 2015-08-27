package DAO;

import Conecta.ConectaOracle;
import POJO.Unidades;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UnidadesDAO {

    private Connection connection;

    public UnidadesDAO(){
        this.connection = ConectaOracle.conecta();
    }

    /*
     * Método getLista() não recebe nenhum parâmetro.
     * Retorna um list com todas as unidades que estiverem cadastradas
     */
    public List<Unidades> getLista(){
        List<Unidades> unidades = new ArrayList<Unidades>();
        String sql = "SELECT * FROM LD_UNIDADE ORDER BY SIGLA";
            try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while(rs.next()){
                    Unidades unidade = new Unidades();

                    unidade.setId(rs.getLong("ID"));
                    unidade.setNome(rs.getString("NOME"));
                    unidade.setSigla(rs.getString("SIGLA"));

                    unidades.add(unidade);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return unidades;
    }

    /*
     * Método getUsu(Long id) recebe um long como parâmetro.
     * esse parâmetro é o id da unidade.
     * Retorna um list com a unidade correspondente ao id
     */
    public List<Unidades> getUsu(Long id){
         List<Unidades> unidades = new ArrayList<Unidades>();
        String sql = "SELECT * FROM LD_UNIDADE WHERE ID = ?";
            try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ps.setLong(1, id);
                ResultSet rs = ps.executeQuery();

                while(rs.next()){
                    Unidades unidade = new Unidades();

                    unidade.setId(rs.getLong("ID"));
                    unidade.setNome(rs.getString("NOME"));
                    unidade.setSigla(rs.getString("SIGLA"));

                    unidades.add(unidade);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return unidades;
    }
}
