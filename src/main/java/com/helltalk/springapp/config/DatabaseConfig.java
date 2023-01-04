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

	
	//커넥션 풀 미 사용
	@Bean
	public DriverManagerDataSource driverManagerDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName(driverClassName);
		dataSource.setUrl(url);
		dataSource.setUsername(username);
		dataSource.setPassword(password);
		return dataSource;
	}
	//스프링 커넥션 풀 사용
	@Value("${jndiName}")
	private String jndiName;
	@Bean 
	JndiObjectFactoryBean jndiObjectFactoryBean() {
		JndiObjectFactoryBean dataSource = new JndiObjectFactoryBean();
		/*
		 *  server.xml이나 context.xml의 
		    <Context>태그 안의 <ResourceLink global="" 	name="" type="">태그의 
		     name속성에 지정한 이름
		 */
		dataSource.setJndiName(jndiName);
		/*
		    아래 세터를 사용하지 않은 경우(디폴트 false) 
		     위의 jndiName속성의 값으로 해당 WAS서버의 
			 루트 디렉토리까지 적어줘야 한다 예]java:/comp/env/spring 
		
		 */
		dataSource.setResourceRef(true);
		return dataSource;
	}
	//히카리 커넥션 풀 사용:server.xml 및 context.xml에 커넥션 풀 관련 설정 불 필요
	@Value("${driverClassName}")
	private String driverClassName;
	@Value("${url}")
	private String url;
	@Value("${user}")
	private String username;
	@Value("${password}")
	private String password;
	//히카리 데이타 소스 - 스프링 씨큐리티 적용시에는 주석처리하고 주입받아서 사용
	/*
	@Bean 
	public HikariDataSource hikariDataSource() {
		System.out.println("driverClassName:"+driverClassName);
		System.out.println("username:"+username);
		System.out.println("password:"+password);
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName(driverClassName);
		hikariConfig.setJdbcUrl(url);
		hikariConfig.setUsername(username);
		hikariConfig.setPassword(password);
		return new HikariDataSource(hikariConfig);
	}*/
	//주입 받기
	@Autowired
	private HikariDataSource hikariDataSource;
	
	//https://mybatis.org/spring/ko/factorybean.html
	//마이바티스 관련 빈
	@Bean
	public SqlSessionFactory sqlSessionFactory(HikariDataSource hikariDataSource) {		
		SqlSessionFactory factory=null;
		try {
			SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
			factoryBean.setDataSource(hikariDataSource);//데이타 소스로 히카리 전달
			factoryBean.setConfigLocation(new ClassPathResource("onememo/mybatis/configuration.xml"));
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
	
	
}
