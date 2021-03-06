package com.care.sys.appuserinfo.domain.logic;

import java.util.List;

import com.care.sys.appuserinfo.dao.AppUserInfoDao;
import com.care.sys.appuserinfo.domain.AppUserInfo;
import com.godoing.rose.lang.DataList;
import com.godoing.rose.lang.DataMap;
import com.godoing.rose.lang.SystemException;

public class AppUserInfoFacadeImpl implements AppUserInfoFacade{
	
	private AppUserInfoDao appUserInfoDao;
	

	public void setAppUserInfoDao(AppUserInfoDao appUserInfoDao) {
		this.appUserInfoDao = appUserInfoDao;
	}
	
	public AppUserInfoFacadeImpl(){
		
	}

	public List<DataMap> getAppUserInfo(AppUserInfo vo) throws SystemException {
		return appUserInfoDao.getAppUserInfo(vo);
	}

	public Integer insertAppUserInfo(AppUserInfo vo) throws SystemException {
		return appUserInfoDao.insertAppUserInfo(vo);
	}

	public Integer updateAppUserInfo(AppUserInfo vo) throws SystemException {
		return appUserInfoDao.updateAppUserInfo(vo);
	}

	public Integer getAppUserInfoCount(AppUserInfo vo) throws SystemException {
		// TODO Auto-generated method stub
		return appUserInfoDao.getAppUserInfoCount(vo);
	}

	public DataList getAppUserInfoListByVo(AppUserInfo vo)
			throws SystemException {
		DataList list = new DataList(appUserInfoDao.getAppUserInfoListByVo(vo));
		list.setTotalSize(appUserInfoDao.getAppUserInfoCountByVo(vo));
		return list;
	}

	public Integer getAppUserInfoCountGroupByTime(AppUserInfo vo)
			throws SystemException {
		// TODO Auto-generated method stub
		return appUserInfoDao.getAppUserInfoCountGroupByTime(vo);
	}

	public DataList getAppUserInfoGroupByTime(AppUserInfo vo)
			throws SystemException {
		DataList list = new DataList(appUserInfoDao.getAppUserInfoGroupByTime(vo));
		list.setTotalSize(appUserInfoDao.getAppUserInfoCountByVo(vo));
		return list;
	}

	public Integer getAppUserInfoCountByVo(AppUserInfo vo)
			throws SystemException {
		// TODO Auto-generated method stub
		return appUserInfoDao.getAppUserInfoCountByVo(vo);
	}

	public int insertUserPhotoInfo(AppUserInfo vo) throws SystemException {
		return appUserInfoDao.insertUserPhotoInfo(vo);
	}

	public List<DataMap> getUserPhotoInfo(AppUserInfo vo)
			throws SystemException {
		return appUserInfoDao.getUserPhotoInfo(vo);
	}

	public List<DataMap> getProjectImageInfo(AppUserInfo ao)
			throws SystemException {
		return appUserInfoDao.getProjectImageInfo(ao);
	}

	@Override
	public Integer insertSaoMaInfo(AppUserInfo vo) throws SystemException {
		// TODO Auto-generated method stub
		return appUserInfoDao.insertSaoMaInfo(vo);
	}

	@Override
	public DataList getSaoMaInfoListByVo(AppUserInfo vo) throws SystemException {
		DataList list = new DataList(appUserInfoDao.getSaoMaInfoListByVo(vo));
		list.setTotalSize(appUserInfoDao.getSaoMaInfoCount(vo));
		return list;
	}

	@Override
	public List<DataMap> getSaoMaInfo(AppUserInfo vo) throws SystemException {
		return appUserInfoDao.getSaoMaInfo(vo);
	}

	@Override
	public int deleteById(AppUserInfo vo) throws SystemException {
		// TODO Auto-generated method stub
		return appUserInfoDao.deleteById(vo);
	}

	@Override
	public int insertSaoMaInfoNew(AppUserInfo vo) throws SystemException {
		return appUserInfoDao.insertSaoMaInfoNew(vo);
	}

	@Override
	public List<DataMap> getSaoMaInfoNew(AppUserInfo vo) throws SystemException {
		return appUserInfoDao.getSaoMaInfoNew(vo);
	}

	@Override
	public int updateSaoMaInfo(AppUserInfo voNumber) throws SystemException {
		// TODO Auto-generated method stub
		return appUserInfoDao.updateSaoMaInfo(voNumber);
	}

	@Override
	public DataList getSaoMaInfoListByVoGroup(AppUserInfo vo)
			throws SystemException {
		DataList list = new DataList(appUserInfoDao.getSaoMaInfoListByVoGroup(vo));
		list.setTotalSize(appUserInfoDao.getAppUserInfoCountByVoGroup(vo));
		return list;
	}

	@Override
	public List<DataMap> getShuliangByWechat(AppUserInfo vo)
			throws SystemException {
		return appUserInfoDao.getShuliangByWechat(vo);
	}

}
