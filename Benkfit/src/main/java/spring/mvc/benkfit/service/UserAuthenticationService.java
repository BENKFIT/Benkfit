package spring.mvc.benkfit.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import spring.mvc.benkfit.vo.UserDTO;

// UserDetailsService : users 테이블의 정보를 가지고 인증처리위해 사용자 상세정보를 제공하는 인터페이스
public class UserAuthenticationService implements UserDetailsService {

	@Inject
	SqlSessionTemplate sqlSession;
	
	@Inject
	BCryptPasswordEncoder passwordEncoder;
	
	public UserAuthenticationService() {}
	
	public UserAuthenticationService(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
		
	// 로그인 인증을 처리하는 코드
	// 파라미터로 입력된 아이디값에 해당하는 테이블의 레코드를 읽어옴
	// 정보가 없으면 예외를 발생시키고, 있으면 해당 정보가 map(dto)로 리턴됨
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		// id와 패스워드가 불일치시 user에 null이 넘어오고, 일치시 계정이 넘어온다.
		// 비밀번호 체크로직은 스프링 시큐리티안에 숨어있다.
		Map<String, Object> user = sqlSession.selectOne("spring.mvc.benkfit.persistence.UserDAO.selectUser", userid);
		System.out.println("로그인 체크 : " + user);
		
		// 인위적으로 예외 발생
		if(user == null) throw new UsernameNotFoundException(userid);
		List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
		
		// 오라클에서는 필드명을 대문자로 적어야 함
		// 오라클에서는 BigInteger 관련 오류가 발생할 수 있으므로 아래와 같이 처리
		
		// 테이블의 USERNAME(=id), PASSWORD(아래)와 사용자가 입력한 값을 비교해서 비밀번호가 불일치시 LoginFailure, 일치시 LoginSuccess
		authority.add(new SimpleGrantedAuthority(user.get("AUTHORITY").toString()));
		return new UserDTO(user.get("USERNAME").toString(), 
				user.get("PASSWORD").toString(),
				(Integer)Integer.valueOf(user.get("ENABLED").toString())==1,
				true, true, true, authority, user.get("USERNAME").toString());
	}

}
