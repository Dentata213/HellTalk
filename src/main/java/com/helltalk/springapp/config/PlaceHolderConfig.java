package com.helltalk.springapp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;


//servlet-context.xml의 <context:property-placeholder location="classpath:rescs.properties,classpath:sub/rescs.properties,classpath:config/database.properties,classpath:onememo/resource/paging.properties"/>
//를 자바코드로 설정하기

@Configuration
@PropertySource({"classpath:onememo/resource/paging.properties","classpath:config/database.properties","classpath:rescs.properties","classpath:sub/rescs.properties"})
public class PlaceHolderConfig {
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
}
