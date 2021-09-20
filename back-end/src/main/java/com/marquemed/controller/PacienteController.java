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

import com.marquemed.entity.Paciente;
import com.marquemed.service.PacienteService;

@RestController
@RequestMapping("paciente")
public class PacienteController {

	private static final Logger logger = LoggerFactory.getLogger(PacienteController.class);
	
	@Autowired
	private PacienteService pacienteService;
	
	@GetMapping
	public ResponseEntity<List<Paciente>> all(){
		logger.info("Get paciente");
		
		return ResponseEntity.status(HttpStatus.OK).body(pacienteService.findAll());
	}
	
	@PostMapping
	public ResponseEntity<?> save(@RequestBody Paciente paciente) {
		logger.info("Save paciente");
		
		pacienteService.save(paciente);		
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest()
							.path("/{id}").buildAndExpand(paciente.getId()).toUri();
		return ResponseEntity.created(uri).build();
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Optional<Paciente>> one(@PathVariable Long id) throws Exception {
		logger.info("Get by id paciente");
		
		return ResponseEntity.status(HttpStatus.OK).body(pacienteService.findById(id));
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<Void> delete(@PathVariable Long id){
		logger.info("Delete paciente");
		
		pacienteService.delete(id);
		return ResponseEntity.noContent().build();
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<Void> update(@RequestBody Paciente paciente, @PathVariable Long id) throws Exception {
		logger.info("Put paciente");
		
		paciente.setId(id);
		pacienteService.update(paciente);
		return ResponseEntity.noContent().build();
	}
	
}
