package cn.itcast.service;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AccountServiceTest {

    @Test
    public void findAll(){
        //加载配置文件
        ApplicationContext context=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        //获取对象
        AccountService service = context.getBean("accountService", AccountService.class);
        //调用方法
        service.findAll();
    }
}
