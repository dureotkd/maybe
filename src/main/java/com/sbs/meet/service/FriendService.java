package com.sbs.meet.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbs.meet.dao.FriendDao;

@Service
public class FriendService {
	@Autowired
	FriendDao friendDao;

	public void applyToFollow(Map<String, Object> param) {
		friendDao.applyToFollow(param);
	}
}
