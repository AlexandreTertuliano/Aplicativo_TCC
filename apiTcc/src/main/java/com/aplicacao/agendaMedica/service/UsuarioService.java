package com.aplicacao.agendaMedica.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aplicacao.agendaMedica.domain.Usuario;
import com.aplicacao.agendaMedica.repository.UsuarioRepository;

@Service
public class UsuarioService {

	@Autowired
	private UsuarioRepository usuarioRepository;
	
	public List<Usuario> list(){
		return usuarioRepository.findAll();
	}
}
