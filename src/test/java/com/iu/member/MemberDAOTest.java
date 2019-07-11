package com.iu.member;

import static org.junit.Assert.*;

import java.util.ArrayList;

import javax.inject.Inject;

import org.junit.Test;

import com.iu.s10.AbtractTest;

public class MemberDAOTest extends AbtractTest{

	@Inject
	private MemberDAO memberDAO;
	@Test
	public void deleteTest() throws Exception{
		ArrayList<String> list = new ArrayList<String>();
		list.add("t1");
		list.add("t2");
		int result = memberDAO.setDelete(list);
		assertEquals(2, result);
	}
	

}







