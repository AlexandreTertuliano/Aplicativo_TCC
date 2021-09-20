package com.marquemed.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marquemed.entity.Clinica;
import com.marquemed.repository.ClinicaRepository;

@Service
public class ClinicaService {

	@Autowired
	private ClinicaRepository clinicaRepository;
	
	private Optional<Clinica> clinica;
	
	
	public List<Clinica> findAll() {
		return clinicaRepository.findAll();
	}
	
	public Clinica save(Clinica clinica) {
		return clinicaRepository.save(clinica);	
	}
	
	public Optional<Clinica> findById(Long id) throws Exception {
		clinica = clinicaRepository.findById(id);

		if(clinica.isEmpty()) {
			throw new Exception("Clinica não encontrada");
		}
		return clinica;
	}
	
	public void delete(Long id) {
		clinicaRepository.deleteById(id);
	}
	
	public void update(Clinica clinica) throws Exception {
		var upProgramacao = findById(clinica.getId()).get();
		BeanUtils.copyProperties(clinica, upProgramacao);
		clinicaRepository.save(upProgramacao);
	}
	
}
