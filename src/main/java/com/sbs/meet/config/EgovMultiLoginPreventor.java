package com.sbs.meet.config;

import javax.servlet.http.HttpSessionBindingEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.sbs.meet.dto.Member;

@Configuration
public class EgovMultiLoginPreventor implements WebMvcConfigurer {
	
	
}