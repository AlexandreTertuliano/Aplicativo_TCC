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

import com.marquemed.entity.Medico;
import com.marquemed.service.MedicoService;

@RestController
@RequestMapping("medico")
public class MedicoController {
	
	private static final Logger logger = LoggerFactory.getLogger(MedicoController.class);

	@Autowired
	private MedicoService medicoService;
	
	@GetMapping
	public ResponseEntity<List<Medico>> all(){
		logger.info("Get medico");
		
		return ResponseEntity.status(HttpStatus.OK).body(medicoService.findAll());
	}
	
	@PostMapping
	public ResponseEntity<?> save(@RequestBody Medico medico) {
		logger.info("Save medico");
		
		medicoService.save(medico);		
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest()
							.path("/{id}").buildAndExpand(medico.getId()).toUri();
		return ResponseEntity.created(uri).build();
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Optional<Medico>> one(@PathVariable Long id) throws Exception {
		logger.info("Get by id medico");
		
		return ResponseEntity.status(HttpStatus.OK).body(medicoService.findById(id));
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<Void> delete(@PathVariable Long id){
		logger.info("Delete medico");
		
		medicoService.delete(id);
		return ResponseEntity.noContent().build();
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<Void> update(@RequestBody Medico medico, @PathVariable Long id) throws Exception {
		logger.info("Put medico");
		
		medico.setId(id);
		medicoService.update(medico);
		return ResponseEntity.noContent().build();
	}
	
}
