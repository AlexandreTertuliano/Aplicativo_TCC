package com.marquemed.entity;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;

@Entity
public class Paciente {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String namePaciente;
	
	private String cpfPaciente;
	
	private LocalDate dnPaciente;
	
	private String telefonePaciente;
	
	private String cidadePaciente;
	
	private String bairroPaciente;
	
	private String ruaPaciente;
	
	private String tipoSanguePaciente;
	
	private String generoPaciente;
	
	private String doadorPaciente;
	
	private String emailPaciente;
	
	@JoinColumn(name = "id_carteira")
	private Integer idCarteira;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNamePaciente() {
		return namePaciente;
	}

	public void setNamePaciente(String namePaciente) {
		this.namePaciente = namePaciente;
	}

	public String getCpfPaciente() {
		return cpfPaciente;
	}

	public void setCpfPaciente(String cpfPaciente) {
		this.cpfPaciente = cpfPaciente;
	}

	public LocalDate getDnPaciente() {
		return dnPaciente;
	}

	public void setDnPaciente(LocalDate dnPaciente) {
		this.dnPaciente = dnPaciente;
	}

	public String getTelefonePaciente() {
		return telefonePaciente;
	}

	public void setTelefonePaciente(String telefonePaciente) {
		this.telefonePaciente = telefonePaciente;
	}

	public String getCidadePaciente() {
		return cidadePaciente;
	}

	public void setCidadePaciente(String cidadePaciente) {
		this.cidadePaciente = cidadePaciente;
	}

	public String getBairroPaciente() {
		return bairroPaciente;
	}

	public void setBairroPaciente(String bairroPaciente) {
		this.bairroPaciente = bairroPaciente;
	}

	public String getRuaPaciente() {
		return ruaPaciente;
	}

	public void setRuaPaciente(String ruaPaciente) {
		this.ruaPaciente = ruaPaciente;
	}

	public String getTipoSanguePaciente() {
		return tipoSanguePaciente;
	}

	public void setTipoSanguePaciente(String tipoSanguePaciente) {
		this.tipoSanguePaciente = tipoSanguePaciente;
	}

	public String getGeneroPaciente() {
		return generoPaciente;
	}

	public void setGeneroPaciente(String generoPaciente) {
		this.generoPaciente = generoPaciente;
	}

	public String getDoadorPaciente() {
		return doadorPaciente;
	}

	public void setDoadorPaciente(String doadorPaciente) {
		this.doadorPaciente = doadorPaciente;
	}

	public String getEmailPaciente() {
		return emailPaciente;
	}

	public void setEmailPaciente(String emailPaciente) {
		this.emailPaciente = emailPaciente;
	}

	public Integer getIdCarteira() {
		return idCarteira;
	}

	public void setIdCarteira(Integer idCarteira) {
		this.idCarteira = idCarteira;
	}
	
}
