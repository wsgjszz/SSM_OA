package cn.itcast.utils;

import cn.itcast.domain.PageBean;

import java.util.Arrays;
import java.util.List;

/**
 * 分页工具类
 */
public class PageBeanInfo {

    private PageBean pageBean;

    private int[] pageNums;      //当前显示的页码范围
    private Boolean isFirstNum;  //是否是首页
    private Boolean isEndNum;    //是否是尾页
    private int navigatePages;   //连续显示页数
    private int startPage;       //开始页码
    private int endPage;         //结束页码

    public PageBeanInfo(){}

    public PageBeanInfo(PageBean pageBean,int navigatePages){
        setNavigatePages(navigatePages);
        setFirstNum(pageBean.getCurrentPage()==1);
        setEndNum(pageBean.getCurrentPage()==pageBean.getTotalPages());
        bulidPageNums(pageBean);
    }

    public void bulidPageNums(PageBean pageBean){
        int currentPage = pageBean.getCurrentPage();
        int totalPages = pageBean.getTotalPages();
        pageNums = new int[navigatePages];
        if (currentPage<=Math.floor(navigatePages/2)+1){
            for (int i = 0; i < navigatePages; i++) {
                if (i==0) startPage=i+1;
                if (i==navigatePages-1) endPage=i+1;
                pageNums[i]=i+1;
            }
        }else if (currentPage>totalPages-Math.floor(navigatePages/2)-1){
            for (int i = 0; i < navigatePages; i++) {
                if (i==0) startPage= totalPages-navigatePages+i+1;
                if (i==navigatePages-1) endPage=totalPages-navigatePages+i+1;
                pageNums[i]=totalPages-navigatePages+i+1;
            }
        }else {
            if (navigatePages%2==0){
                //连续显示偶数页码
                int half = navigatePages / 2; //左边页码
                for (int i = 0; i < navigatePages; i++) {
                    if (i==0) startPage=currentPage-half+i;
                    if (i==navigatePages-1) endPage=currentPage-half+i;
                    pageNums[i]=currentPage-half+i;
                }
            }else {
                //连续显示奇数页码
                int half = navigatePages / 2; //左右的页码
                for (int i = 0; i < navigatePages; i++) {
                    if (i==0) startPage=currentPage-half+i;
                    if (i==navigatePages-1) endPage=currentPage-half+i;
                    pageNums[i]=currentPage-half+i;
                }
            }
        }
    }

    public void setNavigatePages(int navigatePages) {
        this.navigatePages = navigatePages;
    }

    public void setFirstNum(Boolean firstNum) {
        isFirstNum = firstNum;
    }

    public void setEndNum(Boolean endNum) {
        isEndNum = endNum;
    }

    @Override
    public String toString() {
        return "PageBeanInfo{" +
                "pageBean=" + pageBean +
                ", pageNums=" + Arrays.toString(pageNums) +
                ", isFirstNum=" + isFirstNum +
                ", isEndNum=" + isEndNum +
                ", navigatePages=" + navigatePages +
                ", startPage=" + startPage +
                ", endPage=" + endPage +
                '}';
    }
}
