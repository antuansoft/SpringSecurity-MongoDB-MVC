package com.antuansoft.mongodb.repositories;

import org.springframework.data.repository.CrudRepository;

import com.antuansoft.mongodb.domain.User;


public interface UserRepositoryDao extends CrudRepository<User, String> {
	
	
	public User findByUsername(String username);

}
