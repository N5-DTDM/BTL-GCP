package com.cmh.dao;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

import com.cmh.entity.Document;

@Transactional
public interface DocumentDao extends CrudRepository<Document, Integer>{

/*	  public Document findById(Integer id);*/

}
