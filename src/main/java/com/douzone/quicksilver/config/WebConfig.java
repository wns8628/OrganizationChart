package com.douzone.quicksilver.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;

import com.douzone.config.web.MVCConfig;
import com.douzone.config.web.MessageConfig;
import com.douzone.config.web.SecurityConfig;


@Configuration											//로그백은 이거랑 xml파일 리소스밑에 넣으면끝
@ComponentScan(value= {"com.douzone.quicksilver.controller","com.douzone.exception"})
@EnableAspectJAutoProxy
@Import(value = {SecurityConfig.class, MVCConfig.class,MessageConfig.class})
public class WebConfig {
}
