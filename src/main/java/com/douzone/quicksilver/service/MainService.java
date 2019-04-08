package com.douzone.quicksilver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.respository.MainDao;

@Service
public class MainService {	

	@Autowired
	private MainDao mainDao;

}
