package com.marquemed.controller;

import java.net.URI;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.marquemed.entity.Cadastro;
import com.marquemed.service.CadastroService;

@RestController
@RequestMapping("cadastro")
public class CadastroController {

	private static final Logger logger = LoggerFactory.getLogger(CadastroController.class);
	
	@Autowired
	private CadastroService cadastroService;
	
	@GetMapping
	public ResponseEntity<List<Cadastro>> all(){
		logger.info("Get cadastro");
		
		return ResponseEntity.status(HttpStatus.OK).body(cadastroService.findAll());
	}
	
	@PostMapping
	public ResponseEntity<?> save(@RequestBody Cadastro cadastro) {
		logger.info("Save cadastro");
		
		cadastroService.save(cadastro);		
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest()
							.path("/{id}").buildAndExpand(cadastro.getId()).toUri();
		return ResponseEntity.created(uri).build();
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Optional<Cadastro>> one(@PathVariable Long id) throws Exception {
		logger.info("Get by id cadastro");
		
		return ResponseEntity.status(HttpStatus.OK).body(cadastroService.findById(id));
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<Void> delete(@PathVariable Long id){
		logger.info("Delete cadastro");
		
		cadastroService.delete(id);
		return ResponseEntity.noContent().build();
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<Void> update(@RequestBody Cadastro cadastro, @PathVariable Long id) throws Exception {
		logger.info("Put cadastro");
		
		cadastro.setId(id);
		cadastroService.update(cadastro);
		return ResponseEntity.noContent().build();
	}
	
}
