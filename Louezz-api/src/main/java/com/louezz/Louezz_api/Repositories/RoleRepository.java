package com.louezz.Louezz_api.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.louezz.Louezz_api.Entities.Role;

import java.util.Optional;

public interface RoleRepository extends JpaRepository<Role, Integer> {
    Optional<Role> findByName(String roleStudent);
}
