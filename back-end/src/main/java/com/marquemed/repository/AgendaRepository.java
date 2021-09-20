package com.marquemed.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.marquemed.entity.Agenda;

public interface AgendaRepository extends JpaRepository<Agenda, Long>{

}
