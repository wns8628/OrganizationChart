package com.douzone.quicksilver.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;

import com.douzone.config.app.DBConfig;
import com.douzone.config.app.MyBatisConfig;

@Configuration
@ComponentScan(value= {"com.douzone.quicksilver.service","com.douzone.quicksilver.repository","com.douzone.quicksilver.aspect"})
@EnableAspectJAutoProxy
@Import(value = { DBConfig.class, MyBatisConfig.class})
public class AppConfig {
}
