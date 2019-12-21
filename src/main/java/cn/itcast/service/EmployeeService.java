package cn.itcast.service;

import cn.itcast.dao.EmployeeDao;
import cn.itcast.domain.Employee;
import cn.itcast.domain.PageBean;

import java.util.List;

public interface EmployeeService {

    /**
     * 获取所有员工数据
     * @return
     */
    public List<Employee> findAll();

    /**
     * 分页查询员工信息
     * @param currentPage
     * @param pageSize
     * @return
     */
    public PageBean<Employee> findByPage(int currentPage,int pageSize);
}
