package com.marquemed.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;

@Entity
public class Cadastro {

	@Id
	private Long id;
	
	private Integer email;
	
	private String senha;
	
	@JoinColumn(name = "paciente_idpaciente")
	private Integer idPaciente;
	
	@JoinColumn(name = "carteira_idcarteira")
	private Integer idCarteira;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getEmail() {
		return email;
	}

	public void setEmail(Integer email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public Integer getIdPaciente() {
		return idPaciente;
	}

	public void setIdPaciente(Integer idPaciente) {
		this.idPaciente = idPaciente;
	}

	public Integer getIdCarteira() {
		return idCarteira;
	}

	public void setIdCarteira(Integer idCarteira) {
		this.idCarteira = idCarteira;
	}
	
}
