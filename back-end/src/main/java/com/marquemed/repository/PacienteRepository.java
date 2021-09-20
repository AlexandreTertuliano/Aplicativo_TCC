package com.marquemed.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.marquemed.entity.Paciente;

public interface PacienteRepository extends JpaRepository<Paciente, Long>{

}
