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

import com.marquemed.entity.Carteira;
import com.marquemed.service.CarteiraService;

@RestController
@RequestMapping("carteira")
public class CarteiraController {
	
	private static final Logger logger = LoggerFactory.getLogger(CarteiraController.class);

	@Autowired
	private CarteiraService carteiraService;
	
	@GetMapping
	public ResponseEntity<List<Carteira>> all(){
		logger.info("Get carteira");
		
		return ResponseEntity.status(HttpStatus.OK).body(carteiraService.findAll());
	}
	
	@PostMapping
	public ResponseEntity<?> save(@RequestBody Carteira carteira) {
		logger.info("Save carteira");
		
		carteiraService.save(carteira);		
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest()
							.path("/{id}").buildAndExpand(carteira.getId()).toUri();
		return ResponseEntity.created(uri).build();
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Optional<Carteira>> one(@PathVariable Long id) throws Exception {
		logger.info("Get by id carteira");
		
		return ResponseEntity.status(HttpStatus.OK).body(carteiraService.findById(id));
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<Void> delete(@PathVariable Long id){
		logger.info("Delete carteira");
		
		carteiraService.delete(id);
		return ResponseEntity.noContent().build();
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<Void> update(@RequestBody Carteira carteira, @PathVariable Long id) throws Exception {
		logger.info("Put carteira");
		
		carteira.setId(id);
		carteiraService.update(carteira);
		return ResponseEntity.noContent().build();
	}
	
}
