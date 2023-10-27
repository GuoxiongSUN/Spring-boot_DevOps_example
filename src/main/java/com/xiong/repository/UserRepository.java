package com.xiong.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.xiong.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
}