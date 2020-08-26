package com.sbs.meet.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FriendDao {
	void applyToFollow(Map<String, Object> param);
}
