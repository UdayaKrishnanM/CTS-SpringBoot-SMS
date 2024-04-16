package com.sportsmanagement.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sportsmanagement.model.Ranks;

public interface RanksRepository extends JpaRepository<Ranks, Integer>{

}
