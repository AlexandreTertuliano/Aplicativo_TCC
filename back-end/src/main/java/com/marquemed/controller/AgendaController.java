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

import com.marquemed.entity.Agenda;
import com.marquemed.service.AgendaService;

@RestController
@RequestMapping("agenda")
public class AgendaController {
	
	private static final Logger logger = LoggerFactory.getLogger(AgendaController.class);

	@Autowired
	private AgendaService agendaService;
	
	
	@GetMapping
	public ResponseEntity<List<Agenda>> all(){
		logger.info("Get agenda");
		
		return ResponseEntity.status(HttpStatus.OK).body(agendaService.findAll());
	}
	
	@PostMapping
	public ResponseEntity<?> save(@RequestBody Agenda agenda) {
		logger.info("Save agenda");

		agendaService.save(agenda);		
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest()
							.path("/{id}").buildAndExpand(agenda.getId()).toUri();
		return ResponseEntity.created(uri).build();
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Optional<Agenda>> one(@PathVariable Long id) throws Exception {
		logger.info("Get by id agenda");

		return ResponseEntity.status(HttpStatus.OK).body(agendaService.findById(id));
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<Void> delete(@PathVariable Long id){
		logger.info("Delete agenda");

		agendaService.delete(id);
		return ResponseEntity.noContent().build();
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<Void> update(@RequestBody Agenda agenda, @PathVariable Long id) throws Exception {
		logger.info("Put agenda");
		
		agenda.setId(id);
		agendaService.update(agenda);
		return ResponseEntity.noContent().build();
	}
	
}
