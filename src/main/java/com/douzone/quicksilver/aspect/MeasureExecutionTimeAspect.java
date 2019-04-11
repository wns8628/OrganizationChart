package com.douzone.quicksilver.aspect;

import org.apache.commons.logging.Log; 
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

@Aspect
@Component
public class MeasureExecutionTimeAspect {
	
	@Around("execution(* *..repository.*.*(..)) || execution(* *..service.*.*(..)) || execution(* *..controller.*.*(..))")
	public Object aroundAdvice(ProceedingJoinPoint pjp) throws Throwable{
		
		final Log LOG = LogFactory.getLog( MeasureExecutionTimeAspect.class ); // 로그만드는방식?

		//before
		 StopWatch stopWatch  = new StopWatch();
		 stopWatch.start();
		 
		//method 실행
		Object result = pjp.proceed();
		
		//after
		stopWatch.stop();
		double totalTime = stopWatch.getTotalTimeSeconds();

		//리플렉션- 객체를가지고 클래스랑,메소드이름찾아오는것
		//String className = pjp.getTarget().getClass().getName();
		String methodName = pjp.getSignature().getName();
		String taskName = methodName;
		
		LOG.info("[ExecutionTime][" + taskName + "]" + totalTime + "초");
		System.out.println("[ExecutionTime][" + taskName + "]" + totalTime + "초");
		
		return result;
	}
}