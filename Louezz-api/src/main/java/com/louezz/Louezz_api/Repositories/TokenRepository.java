package com.louezz.Louezz_api.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.louezz.Louezz_api.Entities.Token;

import java.util.Optional;

public interface TokenRepository extends JpaRepository<Token, Long> {

    Optional<Token> findByToken(String token);
}
