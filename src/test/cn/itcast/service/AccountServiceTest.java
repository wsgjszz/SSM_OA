package cn.itcast.service;

import cn.itcast.domain.Account;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class AccountServiceTest {

    @Test
    public void findAll(){
        //加载配置文件
        ApplicationContext context=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        //获取对象
        AccountService service = context.getBean("accountService", AccountService.class);
        //调用方法
        List<Account> list = service.findAll();
        for (Account account : list) {
            System.out.println(account);
        }
    }
}
