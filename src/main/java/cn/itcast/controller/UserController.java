package cn.itcast.controller;

import cn.itcast.domain.User;
import cn.itcast.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public ModelAndView login(User user){
        //创建ModelAndView对象
        ModelAndView mv = new ModelAndView();
        //执行方法
        User login = userService.login(user);
        mv.addObject("user",user);
        if (login!=null){
            //登录成功
            mv.setViewName("success");
        }else {
            //登录失败
            mv.setViewName("faild");
        }
        return mv;
    }

}
