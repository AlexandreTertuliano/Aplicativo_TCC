package com.marquemed.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Medico {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String nameMedico;
	
	private String crmMedico;
	
	private String telefoneMedico;
	
	private String especialidadeMedico;

	@JoinColumn(name = "clinica_id")
	@ManyToOne(fetch = FetchType.EAGER)
	private Clinica clinica;
	
	@JoinColumn(name = "carteira_id")
	@ManyToOne(fetch = FetchType.EAGER)
	private Carteira carteira;
	
	@JoinColumn(name = "agenda_id")
	@ManyToOne(fetch = FetchType.EAGER)
	private Agenda agenda;
	
	@JoinColumn(name = "cadastro_id")
	@ManyToOne(fetch = FetchType.EAGER)
	private Cadastro cadastro;

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

	public Clinica getClinica() {
		return clinica;
	}

	public void setClinica(Clinica clinica) {
		this.clinica = clinica;
	}

	public Carteira getCarteira() {
		return carteira;
	}

	public void setCarteira(Carteira carteira) {
		this.carteira = carteira;
	}

	public Agenda getAgenda() {
		return agenda;
	}

	public void setAgenda(Agenda agenda) {
		this.agenda = agenda;
	}

	public Cadastro getCadastro() {
		return cadastro;
	}

	public void setCadastro(Cadastro cadastro) {
		this.cadastro = cadastro;
	}

	
}
