package com.marquemed.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marquemed.entity.Carteira;
import com.marquemed.repository.CarteiraRepository;

@Service
public class CarteiraService {

	@Autowired
	private CarteiraRepository carteiraRepository;
	
	private Optional<Carteira> carteira;
	
	
	public List<Carteira> findAll() {
		return carteiraRepository.findAll();
	}
	
	public Carteira save(Carteira carteira) {
		return carteiraRepository.save(carteira);	
	}
	
	public Optional<Carteira> findById(Long id) throws Exception {
		carteira = carteiraRepository.findById(id);

		if(carteira.isEmpty()) {
			throw new Exception("Carteira não encontrada");
		}
		return carteira;
	}
	
	public void delete(Long id) {
		carteiraRepository.deleteById(id);
	}
	
	public void update(Carteira carteira) throws Exception {
		var upProgramacao = findById(carteira.getId()).get();
		BeanUtils.copyProperties(carteira, upProgramacao);
		carteiraRepository.save(upProgramacao);
	}
	
}
