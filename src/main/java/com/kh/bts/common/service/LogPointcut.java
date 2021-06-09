package com.kh.bts.common.service;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class LogPointcut {
	@Pointcut("execution(* com.kh.bts..*Impl.*(..))")
	public void allPointcut() {
	}

	@Pointcut("execution(* com.kh.bts..*Impl.get*(..))")
	public void getPointcut() {
	}
}
