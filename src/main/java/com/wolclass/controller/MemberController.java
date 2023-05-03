package com.wolclass.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wolclass.domain.MemberVO;
import com.wolclass.service.ClassService;
import com.wolclass.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	@Autowired
	private ClassService cservice;
	@Autowired
	private JavaMailSender mailSender;
	
	// http://localhost:8080/member/join
	// 회원가입 페이지 이동 - 다빈 
	@RequestMapping(value = "/join",method = RequestMethod.GET)
	public void joinGET(MemberVO vo) {
		logger.info("JoinGET() 호출!");
	}
	
	// 회원가입 - 다빈 
	@RequestMapping(value = "/join",method = RequestMethod.POST)
	public String joinPOST(@RequestParam Map<String, Object> map) throws Exception{
		logger.info("join 실행 {}",map);
		service.memberJoin(map);
		
		return "redirect:/member/login";
	}
	
	// 이메일 인증 - 다빈
	@RequestMapping(value = "/mailCheck",method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{
		logger.info("이메일 데이터 전송 확인");
		
		// 인증번호 생성 - 다빈 
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111;
		logger.info("인증번호 "+checkNum);
		
		// 이메일 보내기 - 다빈 
		String setFrom = "eksjqls1@naver.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "인증번호는 " + checkNum + "입니다." +
				"<br>" +
				"해당 인증번호를 확인란에 기입하여 주세요.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
			helper.setFrom(setFrom,"월클래스");
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);
		return num;
	}
	
	// 로그인 페이지 이동 - 다빈 
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public void loginGET() throws Exception{
		logger.info("loginGET() 호출!");
	}
	
	// http://localhost:8080/member/login
	// 로그인 처리 - 다빈 
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(MemberVO vo,HttpSession session,RedirectAttributes rttr) throws Exception{
		logger.info("loginPOST() 호출!");
		MemberVO loginResultVO = service.memberLogin(vo);
		if(loginResultVO != null) {
			// 로그인 성공
			logger.info("로그인 성공!");
			// 아이디정보를 세션에 저장
			session.setAttribute("id", loginResultVO.getM_id());
			// main 페이지 이동
			return "redirect:/";
		}else {
			// 로그인 실패
			logger.info("로그인 실패!");
			rttr.addFlashAttribute("result",0);
			// 로그인 페이지 이동
			return "redirect:/member/login";
		}
	}
	
	// 로그아웃 - 다빈 
	@RequestMapping(value = "/logout",method = RequestMethod.GET)
	public String logoutGET(HttpSession session) {
		logger.info("logoutGET() 호출!");
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 아이디 찾기form - 다빈 
	@RequestMapping(value = "/findId",method = RequestMethod.GET)
	public String findIdGET() {
		logger.info("findIdGET() 호출");
		return "/member/findId";
	}
	
	// 아이디 찾기 기능 - 다빈 
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findIdPOST(MemberVO vo) throws Exception {
		logger.info("findIdPOST() 호출");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		MemberVO findIdVO = service.findId(vo);
		if (findIdVO == null) {
			resultMap.put("check", 1);
		} else {
			resultMap.put("check", 0);
			resultMap.put("id", findIdVO.getM_id());
		}
		return resultMap;
	}
	
	// 비밀번호 찾기 form - 다빈
	@RequestMapping(value = "/findPw",method = RequestMethod.GET)
	public String findPwGET() {
		logger.info("findPwGET() 호출");
		return "/member/findPw";
	}
	
	// 비밀번호 찾기 처리 - 다빈
	@RequestMapping(value = "/findPw",method = RequestMethod.POST)
	@ResponseBody
	public int findPwPOST(MemberVO vo) throws Exception{
		logger.info("findPwPOST() 호출");
		if(service.findPw(vo)) {
			Random random = new Random();
			String tempPassword = "";
			for (int i = 0; i < 8; i++) {
			    int digit = random.nextInt(10);
			    tempPassword += String.valueOf(digit);
			}
			logger.info("Temporary password: " + tempPassword);
			// 이메일 보내기 - 다빈 
			vo.setM_pw(tempPassword);
			String setFrom = "eksjqls1@naver.com";
			String toMail = vo.getM_email();
			String title = "임시 비밀번호입니다.";
			String content = "비밀번호는 " + tempPassword + "입니다." +
					"<br>" +
					"해당 비밀번호로 로그인 후 비밀번호 변경 해주세요.";
			new Thread(() -> {
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
					helper.setFrom(setFrom,"월클래스");
					helper.setTo(toMail);
					helper.setSubject(title);
					helper.setText(content,true);
					mailSender.send(message);
					
					service.updateTempPw(vo);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}).start();
			return 1;
		}
		return 0;
	}

	// 카카오 로그인 - 다빈
	@GetMapping("/kakao")
	public String kakaoLogin(@RequestParam String code, Model model, HttpSession session) throws Exception{
		logger.info("code : "+code);
		
		String access_token = service.getToken(code);
		Map<String, String> userInfo = service.getUserInfo(access_token);
		
		MemberVO vo = new MemberVO();
		vo.setM_id(userInfo.get("id"));
		vo.setM_pw(userInfo.get("password"));
		vo.setM_email(userInfo.get("email"));
		vo.setM_name(userInfo.get("name"));
		
		//if id db에 있을때
		if(service.kfindId(vo)!= null) session.setAttribute("id", vo.getM_id());
		else {
			service.kakaoInsert(vo);
			session.setAttribute("id", vo.getM_id());
		}
		return "redirect:/";
	}
	
	// 클래스 워크스페이스
	@RequestMapping(value = "/classWorkSpace", method = RequestMethod.GET)
	public void classWorkSpace(Model model, HttpSession session) throws Exception {
		logger.info(" classWorkSpaceGET() 호출 ");

		String id = (String) session.getAttribute("id");
		model.addAttribute("registerList", cservice.registerClassList(id));
	}
	// 클래스 워크스페이스
}
