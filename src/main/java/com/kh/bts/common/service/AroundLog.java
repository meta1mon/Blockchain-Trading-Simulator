package com.kh.bts.common.service;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

@Service
@Aspect
public class AroundLog {
	private static final Logger logger = LoggerFactory.getLogger(AroundLog.class);

	@Around("LogPointcut.allPointcut()")
	public Object aroundLosg(ProceedingJoinPoint pp) throws Throwable {
		logger.info("============ 사전 공통 코드 동작! =============");
		String methodName = pp.getSignature().getName();
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		Object obj = pp.proceed();
		stopWatch.stop();
		System.out.println(methodName + "() 메소드 수행에 걸린 시간 : " + stopWatch.getTotalTimeMillis() + "(ms)초");
		logger.info("============ 사후 공통 코드 동작! =============");
		return obj;
	}
}