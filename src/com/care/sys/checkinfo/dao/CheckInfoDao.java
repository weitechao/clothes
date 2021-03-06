package com.care.sys.checkinfo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.care.sys.checkinfo.domain.CheckInfo;
import com.godoing.rose.lang.DataMap;
import com.godoing.rose.lang.SystemException;

public interface CheckInfoDao {
	
	public List<DataMap> getCheckInfo(CheckInfo vo) throws DataAccessException;
	
	public int updateCheckInfo(CheckInfo vo)throws DataAccessException;

	public int insertCheckInfo(CheckInfo vo)throws DataAccessException;
	
	public List<DataMap> getCheckInfoListByVo(CheckInfo vo) throws DataAccessException;
	
	public int getCheckInfoCount(CheckInfo vo) throws DataAccessException;
	
	public int insertCheckCodeInfo(CheckInfo vo) throws DataAccessException;
	
	public List<DataMap> getCheckCodeInfo(CheckInfo vo) throws DataAccessException;
	
	public int getCheckInfoCountByVo(CheckInfo vo) throws DataAccessException;

	public int deleteCheckInfo(CheckInfo del) throws DataAccessException;
	
	public List<DataMap> getFirmDevice(CheckInfo vo)throws DataAccessException;
	
	public int getFirmDeviceCountByVo(CheckInfo vo) throws DataAccessException;
	
	public int updateFirmDevice(CheckInfo vo)throws DataAccessException;
	
	public int insertFirmDevice(CheckInfo vo) throws DataAccessException;
	
	public List<DataMap> getFirmDeviceListByVo(CheckInfo vo)throws DataAccessException;
	

}
