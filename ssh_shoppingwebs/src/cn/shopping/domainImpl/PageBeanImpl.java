package cn.shopping.domainImpl;

import java.util.List;

import cn.shopping.domain.PageBean;

public class PageBeanImpl<T> implements PageBean<T> {
	private int pc;// 当前页数
	private int tp;// 总页数
	private int tr;// 总共多少条记录
	private int ps;// 每页多少条记录
	private List<T> beanList;// 存储多条记录

	private String url;// 它就是url后的条件！

	@Override
	public String toString() {
		return "PageBeanImpl [pc=" + pc + ", tp=" + tp + ", tr=" + tr + ", ps=" + ps + ", beanList=" + beanList
				+ ", url=" + url + "]";
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getPc() {
		return pc;
	}

	public void setPc(int pc) {
		this.pc = pc;
	}

	public int getTp() {
		int tp = tr / ps;
		return tr % ps == 0 ? tp : tp + 1;
	}

	public int getTr() {
		return tr;
	}

	public void setTr(int tr) {
		this.tr = tr;
	}

	public int getPs() {
		return ps;
	}

	public void setPs(int ps) {
		this.ps = ps;
	}

	public List<T> getBeanList() {
		return beanList;
	}

	public void setBeanList(List<T> beanList) {
		this.beanList = beanList;
	}

}
