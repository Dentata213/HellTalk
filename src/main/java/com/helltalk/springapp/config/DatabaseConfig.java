package com.helltalk.springapp.config;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URL;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jndi.JndiObjectFactoryBean;
import org.springframework.transaction.support.TransactionTemplate;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
public class DatabaseConfig {

	/*
	//히카리 커넥션 풀 사용:server.xml 및 context.xml에 커넥션 풀 관련 설정 불 필요
	@Value("${driverClassName}")
	private String driverClassName;
	@Value("${url}")
	private String url;
	@Value("${happyuser}")
	private String username;
	@Value("${password}")
	private String password;
	//히카리 데이타 소스 - 스프링 씨큐리티 적용시에는 주석처리하고 주입받아서 사용
	
	@Bean 
	public HikariDataSource hikariDataSource() {
		HikariConfig hikariConfig = new HikariConfig();
		System.out.println(driverClassName);
		System.out.println(url);
		System.out.println(username);
		System.out.println(password);
		
		hikariConfig.setDriverClassName(driverClassName);
		hikariConfig.setJdbcUrl(url);
		hikariConfig.setUsername(username);
		hikariConfig.setPassword(password);
		return new HikariDataSource(hikariConfig);
	}
	*/
	
	//https://mybatis.org/spring/ko/factorybean.html
	//마이바티스 관련 빈
	@Bean
	public SqlSessionFactory sqlSessionFactory(HikariDataSource hikariDataSource) {		
		SqlSessionFactory factory=null;
		try {
			SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
			factoryBean.setDataSource(hikariDataSource);//데이타 소스로 히카리 전달
			factoryBean.setConfigLocation(new ClassPathResource("mybatis/configuration.xml"));
	    	factory=factoryBean.getObject();
	    }
	    catch(Exception e) {e.printStackTrace();}
	   	return factory;		
		  
	}
	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}////////////////
	
	//트랜잭션관련 빈 등록
	 //https://mybatis.org/spring/transactions.html
	@Bean
	public DataSourceTransactionManager transactionManager(HikariDataSource hikariDataSource) {
		return new DataSourceTransactionManager(hikariDataSource);
	}
	@Bean
	public TransactionTemplate transactionTemplate(DataSourceTransactionManager transactionManager) {
		TransactionTemplate transactionTemplate= new TransactionTemplate();
		transactionTemplate.setTransactionManager(transactionManager);
		return transactionTemplate;
	}
	
	//jsp 페이지에서 properties 값 불러오기
	@Bean
	public PropertiesFactoryBean commonProperties() {
		PropertiesFactoryBean bean = new PropertiesFactoryBean();
		bean.setLocation(new ClassPathResource("config/database.properties"));
		return bean;
	}
	
}
