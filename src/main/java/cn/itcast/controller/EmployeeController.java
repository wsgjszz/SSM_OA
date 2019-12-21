package cn.itcast.controller;

import cn.itcast.domain.Department;
import cn.itcast.domain.Employee;
import cn.itcast.domain.Msg;
import cn.itcast.domain.PageBean;
import cn.itcast.service.EmployeeService;
import cn.itcast.utils.PageBeanInfo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/emp")
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/page")
    @ResponseBody
    public Msg QueryListWithJson(@RequestParam(value = "currentPage",defaultValue = "1") Integer currentPage,@RequestParam(value = "pageSize",defaultValue = "5") Integer pageSize){
        //调用service方法查询分页员工数据
        PageBean<Employee> employeePageBean = employeeService.findByPage(currentPage, pageSize);
        //调用PageBeanInfo工具类
        PageBeanInfo pageBeanInfo = new PageBeanInfo(employeePageBean, 5);
        return Msg.success().add("pageInfo",pageBeanInfo);
    }
}
