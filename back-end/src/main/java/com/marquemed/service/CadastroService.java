package com.marquemed.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marquemed.entity.Cadastro;
import com.marquemed.repository.CadastroRepository;

@Service
public class CadastroService {

	@Autowired
	private CadastroRepository cadastroRepository;
	
	private Optional<Cadastro> cadastro;
	
	
	public List<Cadastro> findAll() {
		return cadastroRepository.findAll();
	}
	
	public Cadastro save(Cadastro cadastro) {
		return cadastroRepository.save(cadastro);	
	}
	
	public Optional<Cadastro> findById(Long id) throws Exception {
		cadastro = cadastroRepository.findById(id);

		if(cadastro.isEmpty()) {
			throw new Exception("Cadastro não encontrado");
		}
		return cadastro;
	}
	
	public void delete(Long id) {
		cadastroRepository.deleteById(id);
	}
	
	public void update(Cadastro cadastro) throws Exception {
		var upProgramacao = findById(cadastro.getId()).get();
		BeanUtils.copyProperties(cadastro, upProgramacao);
		cadastroRepository.save(upProgramacao);
	}
	
}
