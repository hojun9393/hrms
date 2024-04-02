package edu.hrms.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.hrms.service.MessageService;
import edu.hrms.vo.MsgReceiveVO;
import edu.hrms.vo.MsgVO;
import edu.hrms.vo.UserVO;

@Controller
@RequestMapping(value = "/message")
public class MessageController {
	
	private int userId = 0;
	
	@Autowired
	MessageService messageService;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(Authentication authentication, Model model) {
		UserVO loginUser = (UserVO)authentication.getPrincipal();
		userId = Integer.parseInt(loginUser.getUserid());
		
		List<MsgVO> list = messageService.selectMsgAll(userId);
		List<MsgVO> recList = messageService.selectMsgReceiveAll(userId);
		model.addAttribute("list", list);
		model.addAttribute("recList", recList);
		return "/message/main";
	}
	
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String write(Model model) {
		model.addAttribute("userId", userId);
		return "/message/write";
	}
	
	@RequestMapping(value = "/reply.do", method = RequestMethod.POST)
	public String write(Model model, int sendUserId) {
		model.addAttribute("userId", userId);
		model.addAttribute("sendUserId", sendUserId);
		return "/message/write";
	}
   
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public void write(@RequestParam List<Integer> receiver, String content, HttpServletResponse res) throws IOException {
		if(content == null || content.equals("") || receiver.size() == 0 || userId == 0) {
			res.getWriter().append("<script>alert('쪽지를 전송하지 못했습니다.');location.href='main.do'</script>");
			res.getWriter().flush();
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("content", content);
		map.put("receiver", receiver);
		int result = messageService.insertMsg(map);
		int result2 = messageService.insertMsgReceive(map);
		
		if(result>0 && result2>0) {
			res.getWriter().append("<script>alert('쪽지가 전송 되었습니다.');location.href='main.do'</script>");
		}else {
			res.getWriter().append("<script>alert('쪽지를 전송하지 못했습니다.');location.href='main.do'</script>");
		}
		res.getWriter().flush();
	}
	
	@RequestMapping(value = "/receiverPlus.do")
	@ResponseBody
	public Map<String, Object> receiverPlus() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<MsgReceiveVO> receiverList = messageService.selectReceiverAll();
		List<Map<String, String>> deptCount = messageService.selectDeptCount();
		map.put("receiverList", receiverList);
		map.put("deptCount", deptCount);
		return map;
	}
	
	@RequestMapping(value = "/msgRead.do")
	@ResponseBody
	public int msgRead(int msgRNo) {
		int result = messageService.updateMsgRead(msgRNo);
		return result;
	}
	
	@RequestMapping(value = "/msgCancel.do", method = RequestMethod.GET)
	public void msgCancel(int msgRNo, HttpServletResponse res) throws IOException {
		int result = messageService.deleteMsgReceive(msgRNo);
		
		if(result>0) {
			res.getWriter().append("<script>alert('발신취소 되었습니다.');location.href='main.do'</script>");
		}else {
			res.getWriter().append("<script>alert('발신취소하지 못했습니다.');location.href='main.do'</script>");
		}
		res.getWriter().flush();
	}
	
}
