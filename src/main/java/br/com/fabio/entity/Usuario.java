package br.com.fabio.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "usuario")
public class Usuario implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private String nome;
    private String cpf;
    private String email;
    private String senha;
    
    @ManyToOne
    @JoinColumn(name="id_perfil")
    private Perfil perfil = new Perfil();

    @Transient
    private String nomeFiltro;

    @Transient
    private String cpfFiltro;
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the cpf
     */
    public String getCpf() {
        return cpf;
    }

    /**
     * @param cpf the cpf to set
     */
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
    }

    /**
     * @return the perfil
     */
    public Perfil getPerfil() {
        return perfil;
    }

    /**
     * @param perfil the perfil to set
     */
    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }

    /**
     * @return the nomeFiltro
     */
    public String getNomeFiltro() {
        return nomeFiltro;
    }

    /**
     * @param nomeFiltro the nomeFiltro to set
     */
    public void setNomeFiltro(String nomeFiltro) {
        this.nomeFiltro = nomeFiltro;
    }

    /**
     * @return the cpfFiltro
     */
    public String getCpfFiltro() {
        return cpfFiltro;
    }

    /**
     * @param cpfFiltro the cpfFiltro to set
     */
    public void setCpfFiltro(String cpfFiltro) {
        this.cpfFiltro = cpfFiltro;
    }
}
