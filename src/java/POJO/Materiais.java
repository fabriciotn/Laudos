package POJO;

import java.util.Calendar;

/**
 *
 * @author 12546446
 */
public class Materiais {
    private Long id_solcitacao;
    private Calendar data_solicitacao;
    private Long id_unidade;
    private Long id_setor;
    private String responsavel;
    private String necessidade;
    private int qtd_equipamento;
    private String motivo;
    private String patrimonio;
    private int qtd_manutencoes;
    private Long id_equipamento;
    private Long id_fornecedor;
    private String obs;
    private Long id_usuario_digitacao;
    private Calendar data_digitacao;
    

    public Calendar getData_digitacao() {
        return data_digitacao;
    }

    public void setData_digitacao(Calendar data_digitacao) {
        this.data_digitacao = data_digitacao;
    }

    public Calendar getData_solicitacao() {
        return data_solicitacao;
    }

    public void setData_solicitacao(Calendar data_solicitacao) {
        this.data_solicitacao = data_solicitacao;
    }

    public Long getId_equipamento() {
        return id_equipamento;
    }

    public void setId_equipamento(Long id_equipamento) {
        this.id_equipamento = id_equipamento;
    }

    public Long getId_fornecedor() {
        return id_fornecedor;
    }

    public void setId_fornecedor(Long id_fornecedor) {
        this.id_fornecedor = id_fornecedor;
    }

    public Long getId_setor() {
        return id_setor;
    }

    public void setId_setor(Long id_setor) {
        this.id_setor = id_setor;
    }

    public Long getId_solcitacao() {
        return id_solcitacao;
    }

    public void setId_solcitacao(Long id_solcitacao) {
        this.id_solcitacao = id_solcitacao;
    }

    public Long getId_unidade() {
        return id_unidade;
    }

    public void setId_unidade(Long id_unidade) {
        this.id_unidade = id_unidade;
    }

    public Long getId_usuario_digitacao() {
        return id_usuario_digitacao;
    }

    public void setId_usuario_digitacao(Long id_usuario_digitacao) {
        this.id_usuario_digitacao = id_usuario_digitacao;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNecessidade() {
        return necessidade;
    }

    public void setNecessidade(String necessidade) {
        this.necessidade = necessidade;
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

    public int getQtd_equipamento() {
        return qtd_equipamento;
    }

    public void setQtd_equipamento(int qtd_equipamento) {
        this.qtd_equipamento = qtd_equipamento;
    }

    public int getQtd_manutencoes() {
        return qtd_manutencoes;
    }

    public void setQtd_manutencoes(int qtd_manutencoes) {
        this.qtd_manutencoes = qtd_manutencoes;
    }

    public String getResponsavel() {
        return responsavel;
    }

    public void setResponsavel(String responsavel) {
        this.responsavel = responsavel;
    }
    
    
}