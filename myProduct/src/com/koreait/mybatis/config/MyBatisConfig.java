package com.koreait.mybatis.config;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConfig {
	// SqlSession Factory Builder 에서 MyBatis Config File을 불러와 SqlSession Factory를 만든다.
	// SqlSessionFactory 선언
	private static SqlSessionFactory sqlsessionFactory;
	
	static {
		try {
			// config 파일의 경로를 resource 변수에 넣는다.
			String resource ="./com/koreait/mybatis/config/config.xml";
			// reader 객체에 config 파일을 읽을 수 있도록 값을 집어넣는다.
			Reader reader = Resources.getResourceAsReader(resource);
			// sqlSession Factory를 만들기 위해 FactoryBuilder에 config 파일을 읽어 만들어낸다.
			sqlsessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			System.out.println("초기화 문제 발생, MyBatisConfig.java");
			e.printStackTrace();
		}
	}

	public static SqlSessionFactory getSqlsessionFactory() {
		return sqlsessionFactory;
	}
}