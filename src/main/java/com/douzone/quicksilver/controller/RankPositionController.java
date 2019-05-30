package com.douzone.quicksilver.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.RankPositionService;

@Controller
public class RankPositionController {

	@Autowired
	private RankPositionService rankPositionService;
	
	@ResponseBody
	@RequestMapping("/savePositionValue/{compSeq}/{positionCode}/{korea}/{english}/{use}/{order}/{comment}/{position}")
	public JSONResult savePositionValue(@PathVariable Optional<String> compSeq,
								  @PathVariable Optional<String> positionCode,
								  @PathVariable Optional<String> korea,
								  @PathVariable Optional<String> english,
								  @PathVariable Optional<String> use,
								  @PathVariable Optional<String> order,
								  @PathVariable Optional<String> comment,
								  @PathVariable Optional<String> position) {
		
		if( positionCode.isPresent()) {
			System.out.println(positionCode);
		}
		if( korea.isPresent()) {
			System.out.println(korea);
		}
		if( english.isPresent()) {
			System.out.println(english);
		}
		if( use.isPresent()) {
			System.out.println(use);
		}
		if( order.isPresent()) {
			System.out.println(order);
		}
		if( comment.isPresent()) {
			System.out.println(comment);
		}
		if( position.isPresent()) {
			System.out.println(position);
		}
		
		return JSONResult.success( rankPositionService.insertValue(compSeq.get(), 
										positionCode.get(), 
										korea.get(), 
										english.get(), 
										use.get(), 
										order.get(),
										comment.get(),
										position.get()) );
	}
	
	@ResponseBody
	@RequestMapping("/removePositionValue/{positionCode}/{position}")
	public JSONResult removePositionValue(
								  @PathVariable Optional<String> positionCode,
								  @PathVariable Optional<String> position) {
		
		if( positionCode.isPresent()) {
			System.out.println(positionCode);
		}
		if( position.isPresent()) {
			System.out.println(position);
		}
		
		return JSONResult.success( rankPositionService.removeValue(positionCode.get(), position.get()) );
	}
}
