package cn.itcast.controller;

import cn.itcast.domain.User;
import cn.itcast.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public ModelAndView login(User user, String checkcode, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("login");
        //判断验证码是否正确
        if (checkcode==null){
            return mv.addObject("login_msg","验证码错误");
        }else {
            HttpSession session = request.getSession();
            String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
            if (!checkcode_server.equalsIgnoreCase(checkcode)){
                //验证码错误
                return mv.addObject("login_msg","验证码错误");
            }else {
                //验证码正确
                //执行方法
                User login = userService.login(user);
                if (login!=null){
                    //登录成功
                    mv.addObject("user",user);
                    request.getSession().setAttribute("user",user);
                    mv.setViewName("success");
                }else {
                    //登录失败
                    mv.addObject("login_msg","用户名或密码错误！");
                }
                return mv;
            }
        }

    }

    @RequestMapping("delete")
    public void login_delete(HttpServletRequest request){
        request.getSession().removeAttribute("user");
    }

}
