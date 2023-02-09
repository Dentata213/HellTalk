package com.helltalk.springapp.models;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.service.MemberDTO;
import com.helltalk.springapp.service.MemberServiceImpl;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private MemberServiceImpl memberServiceImpl;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberDTO member = memberServiceImpl.soicalOne(username);
		String role = member.getU_kind().replace("ROLE_","");
        UserDetails userDetails = User.builder()
                .username(member.getU_email())
                .roles(role)
                .password(member.getU_pw())
                .build();
        
        return userDetails;
    }

}
