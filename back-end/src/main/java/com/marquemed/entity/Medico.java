package com.marquemed.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;

@Entity
public class Medico {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String nameMedico;
	
	private String crmMedico;
	
	private String telefoneMedico;
	
	private String especialidadeMedico;

	@JoinColumn(name = "id_clinica")
	private Integer idClinica;
	
	@JoinColumn(name = "id_carteira")
	private Integer idCarteira;
	
	@JoinColumn(name = "id_agenda")
	private Integer idAgenda;
	
	@JoinColumn(name = "id_cadastro")
	private Integer idCadastro;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNameMedico() {
		return nameMedico;
	}

	public void setNameMedico(String nameMedico) {
		this.nameMedico = nameMedico;
	}

	public String getCrmMedico() {
		return crmMedico;
	}

	public void setCrmMedico(String crmMedico) {
		this.crmMedico = crmMedico;
	}

	public String getTelefoneMedico() {
		return telefoneMedico;
	}

	public void setTelefoneMedico(String telefoneMedico) {
		this.telefoneMedico = telefoneMedico;
	}

	public String getEspecialidadeMedico() {
		return especialidadeMedico;
	}

	public void setEspecialidadeMedico(String especialidadeMedico) {
		this.especialidadeMedico = especialidadeMedico;
	}

	public Integer getIdClinica() {
		return idClinica;
	}

	public void setIdClinica(Integer idClinica) {
		this.idClinica = idClinica;
	}

	public Integer getIdCarteira() {
		return idCarteira;
	}

	public void setIdCarteira(Integer idCarteira) {
		this.idCarteira = idCarteira;
	}

	public Integer getIdAgenda() {
		return idAgenda;
	}

	public void setIdAgenda(Integer idAgenda) {
		this.idAgenda = idAgenda;
	}

	public Integer getIdCadastro() {
		return idCadastro;
	}

	public void setIdCadastro(Integer idCadastro) {
		this.idCadastro = idCadastro;
	}
}
