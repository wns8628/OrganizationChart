package com.douzone.quicksilver.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.RankPositionManagementService;


@Controller
public class RankPositionManagementController {

	@Autowired
	private RankPositionManagementService rankPositionService;
	
	@ResponseBody
	@RequestMapping("/rPMSearch/{compSeq}/{useCheck}") 
	public JSONResult rPMSearch(@PathVariable String compSeq,
							@RequestParam (value = "kwd", required = false, defaultValue = "" ) String kwd,
							@PathVariable String useCheck,
							@RequestParam (value = "langCode", required = false, defaultValue = "kr") String langCode,
							@RequestParam (value = "position", required = false, defaultValue = "position") String position) { 
	
		System.out.println("compSeq : " + compSeq);
		System.out.println("kwd : " + kwd);
		System.out.println("useCheck : " + useCheck);
		System.out.println("langCode : " + langCode);
		System.out.println("position : " + position);
		
		return JSONResult.success(rankPositionService.search(compSeq, kwd, useCheck, langCode, position)); 
	}
	
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
