package com.choongang.yeonsolution;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
public class YeonoosolutionApplication {

	public static void main(String[] args) {
		SpringApplication.run(YeonoosolutionApplication.class, args);
	}

}
