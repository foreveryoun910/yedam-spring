package com.yedam.app.advice;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Log
@Component		// Bean 등록
//@Aspect			// 로그 안 보려면 얘만 @Aspect 주석처리 or aop-context.xml에서 autoproxy 주석처리
public class LogAdvice {

	@Pointcut( "execution(* com.yedam.app..*ServiceImpl.*(..))" )
	public void allpointcut() {}
	
	
	@Before( "allpointcut()" )
	public void logBefore(JoinPoint jp) {
		log.info("[before]======================================================");
		String methodName = jp.getSignature().getName();
		Object[] arg = jp.getArgs();
		String str = methodName + " :arg= " + ( arg[0] != null && arg.length > 0 ? arg[0] : "" );
		log.info(str);
	}
	
	// 정상적으로 서비스가 실행되고나면 로그를 찍는다.
	@AfterReturning( pointcut = "allpointcut()", returning = "obj" )
	public void logAfter(JoinPoint jp, Object obj) {
		log.info("[after]======================================================");
		String methodName = jp.getSignature().getName();
		String str = methodName + " :return= " + ( obj != null ? obj : "" );		
		log.info(str);
	}
	
	
}
