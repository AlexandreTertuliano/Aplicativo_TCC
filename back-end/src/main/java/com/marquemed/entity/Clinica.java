package com.marquemed.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Clinica {

	@Id
	private Long id;
	
	private String nameClinica;
	
	private String cnpjClinica;
	
	private String telefoneClinica;
	
	private String cepClinica;
	
	private String estadoClinica;
	
	private String cidadeClinica;
	
	private String bairroClinica;
	
	private String ruaClinica;
	
	private String numeroClinica;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNameClinica() {
		return nameClinica;
	}

	public void setNameClinica(String nameClinica) {
		this.nameClinica = nameClinica;
	}

	public String getCnpjClinica() {
		return cnpjClinica;
	}

	public void setCnpjClinica(String cnpjClinica) {
		this.cnpjClinica = cnpjClinica;
	}

	public String getTelefoneClinica() {
		return telefoneClinica;
	}

	public void setTelefoneClinica(String telefoneClinica) {
		this.telefoneClinica = telefoneClinica;
	}

	public String getCepClinica() {
		return cepClinica;
	}

	public void setCepClinica(String cepClinica) {
		this.cepClinica = cepClinica;
	}

	public String getEstadoClinica() {
		return estadoClinica;
	}

	public void setEstadoClinica(String estadoClinica) {
		this.estadoClinica = estadoClinica;
	}

	public String getCidadeClinica() {
		return cidadeClinica;
	}

	public void setCidadeClinica(String cidadeClinica) {
		this.cidadeClinica = cidadeClinica;
	}

	public String getBairroClinica() {
		return bairroClinica;
	}

	public void setBairroClinica(String bairroClinica) {
		this.bairroClinica = bairroClinica;
	}

	public String getRuaClinica() {
		return ruaClinica;
	}

	public void setRuaClinica(String ruaClinica) {
		this.ruaClinica = ruaClinica;
	}

	public String getNumeroClinica() {
		return numeroClinica;
	}

	public void setNumeroClinica(String numeroClinica) {
		this.numeroClinica = numeroClinica;
	}
	
}
