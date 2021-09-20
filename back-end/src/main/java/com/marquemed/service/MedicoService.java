package com.marquemed.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marquemed.entity.Medico;
import com.marquemed.repository.MedicoRepository;

@Service
public class MedicoService {

	@Autowired
	private MedicoRepository medicoRepository;
	
	private Optional<Medico> medico;
	
	
	public List<Medico> findAll() {
		return medicoRepository.findAll();
	}
	
	public Medico save(Medico medico) {
		medico.setId(null);
		return medicoRepository.save(medico);	
	}
	
	public Optional<Medico> findById(Long id) throws Exception {
		medico = medicoRepository.findById(id);

		if(medico.isEmpty()) {
			throw new Exception("Medico não encontrado");
		}
		return medico;
	}
	
	public void delete(Long id) {
		medicoRepository.deleteById(id);
	}
	
	public void update(Medico medico) throws Exception {
		var upProgramacao = findById(medico.getId()).get();
		BeanUtils.copyProperties(medico, upProgramacao);
		medicoRepository.save(upProgramacao);
	}
	
}
