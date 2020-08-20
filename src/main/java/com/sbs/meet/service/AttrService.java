package com.sbs.meet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbs.meet.dao.AttrDao;

@Service
public class AttrService {
	@Autowired
	private AttrDao attrDao;
	
	public int setValue(String name, String value) {
		String[] nameBits = name.split("__");
		String relTypeCode = nameBits[0];
		int relId = Integer.parseInt(nameBits[1]);
		String typeCode = nameBits[2];
		String type2Code = nameBits[3];

		return attrDao.setValue(relTypeCode, relId, typeCode, type2Code, value);
	}

	public String getValue(String name) {
		String[] nameBits = name.split("__");
		String relTypeCode = nameBits[0];
		int relId = Integer.parseInt(nameBits[1]);
		String typeCode = nameBits[2];
		String type2Code = nameBits[3];
		
		return attrDao.getValue(relTypeCode, relId, typeCode, type2Code);
	}

	public String getValue(String relTypeCode, int relId, String typeCode, String type2Code) {
		return attrDao.getValue(relTypeCode, relId, typeCode, type2Code);
	}

	public int setValue(String relTypeCode, int relId, String typeCode, String type2Code, String value) {
		return attrDao.setValue(relTypeCode, relId, typeCode, type2Code, value);
	}

	public void remove(String relTypeCode, int relId, String typeCode, String type2Code) {
		attrDao.remove(relTypeCode, relId, typeCode, type2Code);		
	}
	
	

}
