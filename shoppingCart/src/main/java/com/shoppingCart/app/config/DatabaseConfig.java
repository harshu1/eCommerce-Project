package com.shoppingCart.app.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class DatabaseConfig {

	/* @Value("${db.driver}") */
	@Value("${spring.datasource.driver-class-name}")
	private String DB_DRIVER;

	/* @Value("${db.password}") */
	@Value("${spring.datasource.password}")
	private String DB_PASSWORD;

	/* @Value("${db.url}") */
	@Value("${spring.datasource.url}")
	private String DB_URL;

	/* @Value("${db.username}") */
	@Value("${spring.datasource.username}")
	private String DB_USERNAME;

	/* @Value("${hibernate.dialect}") */
	@Value("${spring.jpa.properties.hibernate.dialect}")
	private String HIBERNATE_DIALECT;

	/* @Value("${hibernate.show_sql}") */
	@Value("${spring.jpa.show-sql}")
	private String HIBERNATE_SHOW_SQL;

	/* @Value("${hibernate.hbm2ddl.auto}") */
	@Value("${spring.jpa.hibernate.ddl-auto}")
	private String HIBERNATE_HBM2DDL_AUTO;
	
//	@Value("${hibernate.current_session_context_class}")
//	private String HIBERNATE_CURRENT_SESSION_CONTEXT_CLASS;

	@Value("${entitymanager.packagesToScan}")
	private String ENTITYMANAGER_PACKAGES_TO_SCAN;


	  @Bean(name = "dataSource") 
	  public DataSource dataSource() {
	  DriverManagerDataSource dataSource = new DriverManagerDataSource();
	  dataSource.setDriverClassName(DB_DRIVER); dataSource.setUrl(DB_URL);
	  dataSource.setUsername(DB_USERNAME); dataSource.setPassword(DB_PASSWORD);
	  return dataSource; }
	 

	@Autowired
	@Bean(name = "sessionFactory")
	public SessionFactory sessionFactory(DataSource dataSource) {
		LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);
		sessionBuilder.scanPackages("com.shoppingCart.app.model");
		sessionBuilder.addProperties(hibernateProperties());
		return sessionBuilder.buildSessionFactory();
	}

	@Autowired
	@Bean
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager();
		transactionManager.setSessionFactory(sessionFactory);
		return transactionManager;
	}
	
	private Properties hibernateProperties() {
		Properties hibernateProperties = new Properties();
		hibernateProperties.put("spring.jpa.properties.hibernate.dialect", HIBERNATE_DIALECT);
		hibernateProperties.put("spring.jpa.show-sql", HIBERNATE_SHOW_SQL);
		hibernateProperties.put("spring.jpa.hibernate.ddl-auto", HIBERNATE_HBM2DDL_AUTO);
//		hibernateProperties.put("hibernate.current_session_context_class", HIBERNATE_CURRENT_SESSION_CONTEXT_CLASS);
		return hibernateProperties;
	}
	

}
