package com.marquemed.controller;

import java.net.URI;
import java.util.List;
import java.util.Optional;

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

	@Autowired
	private AgendaService agendaService;
	
	
	@GetMapping
	public ResponseEntity<List<Agenda>> all(){
		return ResponseEntity.status(HttpStatus.OK).body(agendaService.findAll());
	}
	
	@PostMapping
	public ResponseEntity<?> save(@RequestBody Agenda agenda) {
		
		agendaService.save(agenda);		
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest()
							.path("/{id}").buildAndExpand(agenda.getId()).toUri();
		return ResponseEntity.created(uri).build();
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Optional<Agenda>> one(@PathVariable Long id) throws Exception {
		return ResponseEntity.status(HttpStatus.OK).body(agendaService.findById(id));
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<Void> delete(@PathVariable Long id){
		agendaService.delete(id);
		return ResponseEntity.noContent().build();
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<Void> update(@RequestBody Agenda agenda, @PathVariable Long id) throws Exception {
		agenda.setId(id);
		agendaService.update(agenda);
		return ResponseEntity.noContent().build();
	}
	
}
