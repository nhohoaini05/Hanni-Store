package com.poly.service;

import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.databind.JsonNode;
import com.poly.entity.Order;
import com.poly.report.ReportCategory;

public interface OrderService {

	Order create(JsonNode order);

	Order findById(Long id);

	List<Order> findByUsername(String username);

//	Double sumCostInMonth(Integer month);

	List<Order> findOrderInMonth(Integer month);

	Integer countOrderInMonth(Integer month);
	
}
