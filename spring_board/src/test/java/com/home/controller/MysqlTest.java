package com.home.controller;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MysqlTest {
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/jsdb?useSSL=false&serverTimezone=UTC";
	private static final String USER = "js";
	private static final String PW = "7206";
	
	@Test
	public void testConnection() throws Exception{
		
		Class.forName(DRIVER);
		
		try(Connection con = DriverManager.getConnection(URL, USER, PW)){
			System.out.println("연결성공");
			System.out.println(con);
		}catch(Exception e) {
			e.printStackTrace();
		}//try_
	}//testConnection_
}
