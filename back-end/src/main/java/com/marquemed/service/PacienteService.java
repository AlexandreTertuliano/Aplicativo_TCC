package com.marquemed.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marquemed.entity.Paciente;
import com.marquemed.repository.PacienteRepository;

@Service
public class PacienteService {

	@Autowired
	private PacienteRepository pacienteRepository;
	
	private Optional<Paciente> paciente;
	
	
	public List<Paciente> findAll() {
		return pacienteRepository.findAll();
	}
	
	public Paciente save(Paciente paciente) {
		paciente.setId(null);
		return pacienteRepository.save(paciente);	
	}
	
	public Optional<Paciente> findById(Long id) throws Exception {
		paciente = pacienteRepository.findById(id);

		if(paciente.isEmpty()) {
			throw new Exception("Paciente não encontrado");
		}
		return paciente;
	}
	
	public void delete(Long id) {
		pacienteRepository.deleteById(id);
	}
	
	public void update(Paciente medico) throws Exception {
		var upProgramacao = findById(medico.getId()).get();
		BeanUtils.copyProperties(medico, upProgramacao);
		pacienteRepository.save(upProgramacao);
	}
	
}
