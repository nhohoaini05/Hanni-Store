package com.poly.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;
import com.poly.entity.Order;
import com.poly.service.OrderService;

@CrossOrigin("*")
@RestController
public class OrderRestController {
	@Autowired OrderService oService;
	@PostMapping("/rest/order")
	public Order create(@RequestBody JsonNode order) {
		return oService.create(order);
	}
}
