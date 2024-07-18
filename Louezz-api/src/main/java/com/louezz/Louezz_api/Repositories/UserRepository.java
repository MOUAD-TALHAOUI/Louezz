package com.louezz.Louezz_api.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.louezz.Louezz_api.Entities.User;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String username);
}
