package com.poly.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.poly.entity.RoleDetail;


@Repository
public interface RoleDetailRepo extends JpaRepository<RoleDetail, Long>{

}
