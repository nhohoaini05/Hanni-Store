package com.poly;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class HN_StoreApplication {

	public static void main(String[] args) {
		SpringApplication.run(HN_StoreApplication.class, args);
	}

}
