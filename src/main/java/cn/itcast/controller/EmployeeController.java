package cn.itcast.controller;

import cn.itcast.domain.Department;
import cn.itcast.domain.Employee;
import cn.itcast.domain.Msg;
import cn.itcast.service.EmployeeService;
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
    public Msg QueryListWithJson(@RequestParam(value = "currentPage",defaultValue = "1") Integer currentPage){
        //引入分页查询插件
        PageHelper.startPage(currentPage,3);
        //后面紧跟着的查询就是分页查询
        List<Employee> emps = employeeService.findAll();
        //使用pageInfo包装查询后的结果，然后只需将pageInfo传递给页面即可
        //封装详细的分页信息和查询得到的数据，传入连续显示的页数
        PageInfo pageInfo = new PageInfo<Employee>(emps,5);
        long total = pageInfo.getTotal();
        int pages = (int) Math.floor(total/5)+1;
        pageInfo.setPageSize(5);
        pageInfo.setPages(pages);
        pageInfo.setStartRow((currentPage-1)*5);
        pageInfo.setEndRow(currentPage*5);
        int[] pageNums=new int[pages];
        for (int i = 0; i < pages; i++) {
            pageNums[i]=currentPage+i;
        }
        pageInfo.setNavigatepageNums(pageNums);
        //成功返回
        System.out.println(pageInfo);
        return Msg.success().add("pageInfo",pageInfo);
    }
}
