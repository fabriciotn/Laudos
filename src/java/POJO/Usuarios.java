package POJO;

public class Usuarios {
    private Long id;
    private String nome;
    private String masp;
    private String sistema;
    private Long id_setor;
    private Long id_unidade;

    public Long getId_unidade() {
        return id_unidade;
    }

    public void setId_unidade(Long id_unidade) {
        this.id_unidade = id_unidade;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId_setor() {
        return id_setor;
    }

    public void setId_setor(Long id_setor) {
        this.id_setor = id_setor;
    }

    public String getMasp() {
        return masp;
    }

    public void setMasp(String masp) {
        this.masp = masp;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public String getSistema() {
        return sistema;
    }

    public void setSistema(String sistema) {
        this.sistema = sistema;
    }
}
