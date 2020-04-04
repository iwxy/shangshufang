package cn.shopping.daoImpl;

import org.springframework.orm.hibernate5.HibernateTemplate;

import cn.shopping.dao.AddressDao;
import cn.shopping.domain.Address;

public class AddressDaoImpl implements AddressDao {
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public void save(Address address) {
		hibernateTemplate.save(address);

	}

}
