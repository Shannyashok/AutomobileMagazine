package com.ntu.auto.magazine.util;

public class Test {
public static void main(String[] args) {
	String a = null;
	System.out.println("".equals(a));
	System.out.println(!"".equals(a));
	if(!"".equals(a)){
		System.out.println("pass1");
	}
	if("".equals(a)){
		System.out.println("pass2");
	}
}
}
