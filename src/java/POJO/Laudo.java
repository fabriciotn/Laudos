package POJO;

import java.util.Calendar;

public class Laudo {
    private Long id;
    private Long id_usuario;
    private Long id_fornecedor;
    private Long id_preliminar;
    private Long id_tipo;
    private Long id_setor;
    private Long id_unidade;
    private String patrimonio;
    private String serie;
    private String conclusivo;
    private String obs;
    private Calendar dt_laudo;
    private Calendar dt_forne;
    private String num_laud_forne;
    private String marca;

    public String getConclusivo() {
        return conclusivo;
    }

    public void setConclusivo(String conclusivo) {
        this.conclusivo = conclusivo;
    }

    public Calendar getDt_forne() {
        return dt_forne;
    }

    public void setDt_forne(Calendar dt_forne) {
        this.dt_forne = dt_forne;
    }

    public Calendar getDt_laudo() {
        return dt_laudo;
    }

    public void setDt_laudo(Calendar dt_laudo) {
        this.dt_laudo = dt_laudo;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId_fornecedor() {
        return id_fornecedor;
    }

    public void setId_fornecedor(Long id_fornecedor) {
        this.id_fornecedor = id_fornecedor;
    }

    public Long getId_preliminar() {
        return id_preliminar;
    }

    public void setId_preliminar(Long id_preliminar) {
        this.id_preliminar = id_preliminar;
    }

    public Long getId_setor() {
        return id_setor;
    }

    public void setId_setor(Long id_setor) {
        this.id_setor = id_setor;
    }

    public Long getId_tipo() {
        return id_tipo;
    }

    public void setId_tipo(Long id_tipo) {
        this.id_tipo = id_tipo;
    }

    public Long getId_unidade() {
        return id_unidade;
    }

    public void setId_unidade(Long id_unidade) {
        this.id_unidade = id_unidade;
    }

    public Long getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Long id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getNum_laud_forne() {
        return num_laud_forne;
    }

    public void setNum_laud_forne(String num_laud_forne) {
        this.num_laud_forne = num_laud_forne;
    }

    public String getObs() {
        return obs;
    }

    public void setObs(String obs) {
        this.obs = obs;
    }

    public String getPatrimonio() {
        return patrimonio;
    }

    public void setPatrimonio(String patrimonio) {
        this.patrimonio = patrimonio;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }
}
