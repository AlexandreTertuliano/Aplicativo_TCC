package com.marquemed.entity;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Agenda {

	@Id
	private Long id;

	private LocalDateTime dadosAgenda;
	
	private String ocupadoAgenda;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LocalDateTime getDadosAgenda() {
		return dadosAgenda;
	}

	public void setDadosAgenda(LocalDateTime dadosAgenda) {
		this.dadosAgenda = dadosAgenda;
	}

	public String getOcupadoAgenda() {
		return ocupadoAgenda;
	}

	public void setOcupadoAgenda(String ocupadoAgenda) {
		this.ocupadoAgenda = ocupadoAgenda;
	}
	
	
}
