package spring.mvc.benkfit.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import spring.mvc.benkfit.vo.UserDTO;


public class UserLoginSuccessHandler implements AuthenticationSuccessHandler{

	// 로그인이 성공한 경우에 실행할 코드
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		UserDTO dto = (UserDTO)authentication.getPrincipal();
		System.out.println(dto);
		String msg = authentication.getName() + "님 환영합니다.";
		request.setAttribute("msg", msg);
		RequestDispatcher rd = request.getRequestDispatcher("index");
		rd.forward(request, response);
	}

}
