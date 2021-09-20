package com.marquemed.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marquemed.entity.Agenda;
import com.marquemed.repository.AgendaRepository;

@Service
public class AgendaService {

	@Autowired
	private AgendaRepository agendaRepository;
	
	private Optional<Agenda> agenda;
	
	
	public List<Agenda> findAll() {
		return agendaRepository.findAll();
	}
	
	public Agenda save(Agenda agenda) {
		return agendaRepository.save(agenda);	
	}
	
	public Optional<Agenda> findById(Long id) throws Exception {
		agenda = agendaRepository.findById(id);

		if(agenda.isEmpty()) {
			throw new Exception("Cliente não encontrado");
		}
		return agenda;
	}
	
	public void delete(Long id) {
		agendaRepository.deleteById(id);
	}
	
	public void update(Agenda agenda) throws Exception {
		var upProgramacao = findById(agenda.getId()).get();
		BeanUtils.copyProperties(agenda, upProgramacao);
		agendaRepository.save(upProgramacao);
	}
	
}
