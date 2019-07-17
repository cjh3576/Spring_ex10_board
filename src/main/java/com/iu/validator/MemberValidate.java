package com.iu.validator;

import java.util.regex.Pattern;

import javax.inject.Inject;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.iu.member.MemberDAO;
import com.iu.member.MemberDTO;

public class MemberValidate implements Validator{
	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return MemberDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberDTO memberDTO = (MemberDTO)target;
		String id = memberDTO.getId();
		String pw = memberDTO.getPw();
		String pw2 = memberDTO.getPw2();
		String name = memberDTO.getName();
		String email = memberDTO.getEmail();
		String ex1= "\\w{6,12}";
		String ex2= "\\d+&&[a-z]+&&[A-Z]+&&\\W+";
		
		boolean check = Pattern.matches(ex2, id);
		System.out.println(check);
		
		
		
		
		//id 검증
		if(memberDTO.getId() == null || memberDTO.getId().length() == 0) {
			errors.rejectValue("id", "member.id");
		}else {
			try {
				MemberDTO checkId = memberDAO.getId(memberDTO);
				if(checkId != null) {
					errors.rejectValue("id", "member.id.duplicate");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//pw 검증
		if(pw==null || pw.length()==0) {
			errors.rejectValue("pw2", "member.pw");
		}else {
			if(!pw.equals(pw2)) {
				errors.rejectValue("pw2", "member.pw.equal");
			}
		}
		
		//name 검증
		if(memberDTO.getName() == null || memberDTO.getName().length() == 0) {
			errors.rejectValue("name", "member.name");
		}
		
		//email 검증
		if(memberDTO.getEmail() == null || memberDTO.getEmail().length() == 0) {
			errors.rejectValue("email", "member.email");
		}
		
		
	}

}
