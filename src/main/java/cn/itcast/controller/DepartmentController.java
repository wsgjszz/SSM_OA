package cn.itcast.controller;


import cn.itcast.domain.Department;
import cn.itcast.service.DepartmentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/department")
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    /**
     *
     * 普通查询
     * @return
     */
    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("list2");
        mv.addObject("depart_list",departmentService.findAll());
        return mv;
    }

    //@RequestMapping("/page")
    public String QueryList(@RequestParam(value = "currentPage",defaultValue = "1") Integer currentPage,Model model){

        //引入分页查询插件
        PageHelper.startPage(currentPage,5);
        //后面紧跟着的查询就是分页查询
        List<Department> deps = departmentService.findAll();
        //使用pageInfo包装查询后的结果，然后只需将pageInfo传递给页面即可
        //封装详细的分页信息和查询得到的数据，传入连续显示的页数
        PageInfo pageInfo = new PageInfo(deps,5);
        model.addAttribute("pageInfo",pageInfo);
        System.out.println("deps:"+deps);
        System.out.println("pageInfo:"+pageInfo);
        return "list";
    }

    @RequestMapping("/page")
    @ResponseBody
    public PageInfo QueryListWithJson(@RequestParam(value = "currentPage",defaultValue = "1") Integer currentPage){
        //引入分页查询插件
        PageHelper.startPage(currentPage,5);
        //后面紧跟着的查询就是分页查询
        List<Department> deps = departmentService.findAll();
        //使用pageInfo包装查询后的结果，然后只需将pageInfo传递给页面即可
        //封装详细的分页信息和查询得到的数据，传入连续显示的页数
        PageInfo pageInfo = new PageInfo(deps,5);
        return pageInfo;
    }
}
