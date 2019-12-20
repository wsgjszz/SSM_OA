package cn.itcast.service.impl;

import cn.itcast.dao.EmployeeDao;
import cn.itcast.domain.Employee;
import cn.itcast.domain.PageBean;
import cn.itcast.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeDao employeeDao;

    @Override
    public List<Employee> findAll() {
        return employeeDao.findAll();
    }

    @Override
    public PageBean<Employee> findByPage(int currentPage, int pageSize) {
        //创建PageBean对象
        PageBean<Employee> pageBean = new PageBean<>();
        //设置当前页码，每页显示记录数
        pageBean.setPageSize(pageSize);
        pageBean.setCurrentPage(currentPage);
        //计算起始页码
        int start = (currentPage - 1) * pageSize;
        //查询并设置分页显示的数据集合
        List<Employee> list = employeeDao.findPageWithDepartName(start, pageSize);
        pageBean.setList(list);
        //计算总记录数
        int totalCount = employeeDao.findTotalCount();
        //设置总记录数
        pageBean.setTotalCounts(totalCount);
        //设置总页数
        pageBean.setTotalPages(totalCount/pageSize+1);
        return pageBean;
    }
}
