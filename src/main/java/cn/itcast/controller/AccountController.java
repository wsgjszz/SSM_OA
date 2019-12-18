package cn.itcast.controller;

import cn.itcast.domain.Account;
import cn.itcast.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountService accountService;

    @RequestMapping("findAll")
    public ModelAndView findAll(){
        //创建ModelAndView对象
        ModelAndView mv = new ModelAndView();
        mv.setViewName("list2");
        System.out.println("表现层：查询所有账户...");
        //执行业务层方法
        List<Account> list = accountService.findAll();
        mv.addObject("list",list);
        return mv;
    }

    @RequestMapping("save")
    public void save(Account account, HttpServletRequest request, HttpServletResponse response) throws IOException {
        accountService.save(account);
        response.sendRedirect(request.getContextPath()+"/account/findAll");
        return;
    }
}
