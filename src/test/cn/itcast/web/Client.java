package cn.itcast.web;

import cn.itcast.controller.DepartmentController;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.Model;
import org.springframework.web.context.WebApplicationContext;

/**
 * 使用SpringJUnit4ClassRunner需要servlet3.0以上的支持
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/web.xml"})
public class Client {

    //传入SpringMVC的IOC
    @Autowired
    WebApplicationContext context;

    //虚拟mvc请求,获取到请求结果
    MockMvc mockMvc;

    @Before
    public void initMokcMvc(){
        mockMvc= MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        //模拟请求获取返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.
                get("/department/page").
                param("currentPage", "1")).
                andReturn();

        //请求成功后，可取出请求域中的pageinfo
        MockHttpServletRequest request=result.getRequest();
        PageInfo pi = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码："+pi.getPageNum());

    }
}
