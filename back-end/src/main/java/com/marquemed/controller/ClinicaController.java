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

import com.marquemed.entity.Clinica;
import com.marquemed.service.ClinicaService;

@RestController
@RequestMapping("clinica")
public class ClinicaController {

	@Autowired
	private ClinicaService clinicaService;
	
	@GetMapping
	public ResponseEntity<List<Clinica>> all(){
		return ResponseEntity.status(HttpStatus.OK).body(clinicaService.findAll());
	}
	
	@PostMapping
	public ResponseEntity<?> save(@RequestBody Clinica clinica) {

		clinicaService.save(clinica);		
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest()
							.path("/{id}").buildAndExpand(clinica.getId()).toUri();
		return ResponseEntity.created(uri).build();
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Optional<Clinica>> one(@PathVariable Long id) throws Exception {
		return ResponseEntity.status(HttpStatus.OK).body(clinicaService.findById(id));
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<Void> delete(@PathVariable Long id){
		clinicaService.delete(id);
		return ResponseEntity.noContent().build();
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<Void> update(@RequestBody Clinica clinica, @PathVariable Long id) throws Exception {
		clinica.setId(id);
		clinicaService.update(clinica);
		return ResponseEntity.noContent().build();
	}
	
}
