package cn.shopping.domain;

import java.util.List;

public interface PageBean<T> {
	public String toString();

	public String getUrl();

	public void setUrl(String url);

	public int getPc();

	public void setPc(int pc);

	public int getTp();

	public int getTr();

	public void setTr(int tr);

	public int getPs();

	public void setPs(int ps);

	public List<T> getBeanList();

	public void setBeanList(List<T> beanList);

}
