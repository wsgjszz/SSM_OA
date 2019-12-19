package cn.itcast.utils;

import cn.itcast.domain.PageBean;

public class PageBeanInfo {

    private PageBean pageBean;

    private int[] pageNums; //当前显示的页码范围
    private Boolean isFirstNum; //是否是首页
    private Boolean isEndNum; //是否是尾页

    public PageBeanInfo(){}

    public PageBeanInfo(PageBean pageBean,int pageSize){
        pageBean.setPageSize(pageSize);
    }
}
