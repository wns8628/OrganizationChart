package com.douzone.config.app;

import javax.sql.DataSource; 

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@PropertySource("classpath:com/douzone/config/app/properties/jdbc.properties")
public class DBConfig {

	@Autowired
	private Environment env;
	
    //이런거 다 프로퍼티파일로뺴야됨 뷰리절브이딴거
	@Bean
	public DataSource basicDataSource() {
		BasicDataSource basicDataSource =
							new BasicDataSource();
		
		basicDataSource.setDriverClassName(env.getProperty("jdbc.driverClassName"));
		basicDataSource.setUrl(env.getProperty("jdbc.url"));
		basicDataSource.setUsername(env.getProperty("jdbc.username"));
		basicDataSource.setPassword(env.getProperty("jdbc.password"));
		basicDataSource.setInitialSize(env.getProperty("jdbc.initialSize",Integer.class));
		basicDataSource.setMaxActive(env.getProperty("jdbc.maxActive",Integer.class));
		
		return basicDataSource;
	}
	//트랜잭션 매니저? 
	@Bean
	public PlatformTransactionManager transactionManager(DataSource dataSource) {
		return new DataSourceTransactionManager(dataSource);
	}
}
