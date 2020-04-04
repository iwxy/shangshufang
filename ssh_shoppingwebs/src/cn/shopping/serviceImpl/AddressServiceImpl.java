package cn.shopping.serviceImpl;

import org.springframework.transaction.annotation.Transactional;

import cn.shopping.dao.AddressDao;
import cn.shopping.domain.Address;
import cn.shopping.service.AddressService;

@Transactional
public class AddressServiceImpl implements AddressService {

	AddressDao addressDao;

	public void setAddressDao(AddressDao addressDao) {
		this.addressDao = addressDao;
	}

	@Override
	public boolean save(Address address) {
		try {
			addressDao.save(address);
			return true;
		} catch (Exception e) {
			return false;
		}

	}

}
