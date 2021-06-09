package com.kh.bts.common.service;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AfterThrowingLog {
	private static final Logger logger = LoggerFactory.getLogger(AfterThrowingLog.class);

	@AfterThrowing(pointcut = "LogPointcut.allPointcut()", throwing = "exceptObj")
	public void exceptionLog(JoinPoint jp, Exception exceptObj) {
		String methodName = jp.getSignature().getName();
		logger.warn(methodName + "() 메소드 수행 중 예외 발생!");
		logger.warn("예외가 발생했습니다 : " + exceptObj.getMessage());
	}
}