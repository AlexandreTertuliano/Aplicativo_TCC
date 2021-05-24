package com.aplicacao.agendaMedica.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.aplicacao.agendaMedica.domain.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

}
