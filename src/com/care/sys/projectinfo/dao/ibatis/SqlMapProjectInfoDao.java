package com.care.sys.projectinfo.dao.ibatis;

import java.util.List;

import org.apache.commons.logging.Log;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.care.sys.projectinfo.dao.ProjectInfoDao;
import com.care.sys.projectinfo.domain.ProjectInfo;
import com.godoing.rose.lang.DataMap;
import com.godoing.rose.log.LogFactory;

public class SqlMapProjectInfoDao extends SqlMapClientDaoSupport implements ProjectInfoDao{
	
	Log logger = LogFactory.getLog(SqlMapProjectInfoDao.class);
	
	public List<DataMap> getProjectInfo(ProjectInfo vo)
			throws DataAccessException {
		// TODO Auto-generated method stub
		logger.debug("getProjectInfo(ProjectInfo vo)");
		return getSqlMapClientTemplate().queryForList("getProjectInfo", vo);
	}
	public List<DataMap> getProjectName(ProjectInfo vo)
			throws DataAccessException {
		// TODO Auto-generated method stub
		logger.debug("getProjectName(ProjectInfo vo)");
		return getSqlMapClientTemplate().queryForList("getProjectName", vo);
	}

	public List<DataMap> getProjectInfoListByVo(ProjectInfo vo)
			throws DataAccessException {
		// TODO Auto-generated method stub
		logger.debug("getProjectInfoListByVo(ProjectInfo vo)");
		return getSqlMapClientTemplate().queryForList("getProjectInfoListByVo", vo);
	}

	public int getProjectInfoListCountByVo(ProjectInfo vo)
			throws DataAccessException {
		// TODO Auto-generated method stub
		logger.debug("getProjectInfoListCountByVo(ProjectInfo vo)");
		return (Integer)getSqlMapClientTemplate().queryForObject("getProjectInfoListCountByVo", vo);
	}

	public int getProjectInfoMaxId(ProjectInfo vo) throws DataAccessException {
		// TODO Auto-generated method stub
		logger.debug("getProjectInfoMaxId(ProjectInfo vo)");
		return (Integer)getSqlMapClientTemplate().queryForObject("getProjectInfoMaxId", vo);
	}

	public int insertProjectInfo(ProjectInfo vo) throws DataAccessException {
		// TODO Auto-generated method stub
		logger.debug("insertProjectInfo(ProjectInfo vo)");
		return getSqlMapClientTemplate().update("insertProjectInfo", vo);
	}

	public int insertRelevanceInfo2(ProjectInfo vo) throws DataAccessException {
		logger.debug("insertRelevanceInfo2(ProjectInfo vo)");
		return getSqlMapClientTemplate().update("insertRelevanceInfo2", vo);
	}

	public int getProjectInfoCount(ProjectInfo vo) throws DataAccessException {
		// TODO Auto-generated method stub
		logger.debug("getProjectInfoCount(ProjectInfo vo)");
		return (Integer)getSqlMapClientTemplate().queryForObject("getProjectInfoCount", vo);
	}

	public int updatePorjectInfo(ProjectInfo vo) throws DataAccessException {
		logger.debug("updatePorjectInfo(ProjectInfo vo)");
		return getSqlMapClientTemplate().update("updatePorjectInfo", vo);
	}
	public List<DataMap> getProjectStatus(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("getProjectStatus(ProjectInfo vo)");
		return getSqlMapClientTemplate().queryForList("getProjectStatus", vo);
	}
	public List<DataMap> getProjectRoleInfo(ProjectInfo rvo)
			throws DataAccessException {
		logger.debug("getProjectRoleInfo(ProjectInfo vo)");
		return getSqlMapClientTemplate().queryForList("getProjectRoleInfo", rvo);
	}
	public List<DataMap> getRoleProjectFuncInfo(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("getRoleProjectFuncInfo(ProjectInfo vo)");
		return getSqlMapClientTemplate().queryForList("getRoleProjectFuncInfo", vo);
	}
	public int insertProjectRoleFuncInfo(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("insertProjectRoleFuncInfo(ProjectInfo vo)");
		return getSqlMapClientTemplate().update("insertProjectRoleFuncInfo", vo);
	}
	public int deleteProjectRoleFunInfo(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("deleteProjectRoleFunInfo(ProjectInfo vo)");
		return getSqlMapClientTemplate().update("deleteProjectRoleFunInfo", vo);
	}
	public List<DataMap> getProjectLocationSwitchInfo(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("getProjectLocationSwitchInfo(ProjectInfo vo)");
		return getSqlMapClientTemplate().queryForList("getProjectLocationSwitchInfo", vo);
	}
	public List<DataMap> getProjectLocationSwitchInfoBvo(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("getProjectLocationSwitchInfo(ProjectInfo vo)");
		return getSqlMapClientTemplate().queryForList("getProjectLocationSwitchInfo", vo);
	}
	public int getProjectLocationInfoListCountByVo(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("getProjectLocationInfoListCountByVo(ProjectInfo vo)");
		return (Integer)getSqlMapClientTemplate().queryForObject("getProjectLocationInfoListCountByVo", vo);
	}
	public int updatePorjectSwitchInfo(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("updatePorjectSwitchInfo(ProjectInfo vo)");
		return getSqlMapClientTemplate().update("updatePorjectSwitchInfo", vo);
	}
	public int deletePorjectInfoxml(ProjectInfo vo) throws DataAccessException {
		logger.debug("deletePorjectInfoxml(ProjectInfo vo)");
		return getSqlMapClientTemplate().update("deletePorjectInfoxml", vo);
	}
	public List<DataMap> getWatchInfoListByVo(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("getWatchInfoListByVo(ProjectInfo vo)");
		return getSqlMapClientTemplate().queryForList("getWatchInfoListByVo", vo);
	}
	public int getWatchInfoListCountByVo(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("getWatchInfoListCountByVo(ProjectInfo vo)");
		return (Integer)getSqlMapClientTemplate().queryForObject("getWatchInfoListCountByVo", vo);
	}
	public int insertProjectWatchInfo(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("insertProjectWatchInfo(ProjectInfo vo)");
		return getSqlMapClientTemplate().update("insertProjectWatchInfo", vo);
	}
	public List<DataMap> getProjectWatchInfo(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("getProjectWatchInfo(ProjectInfo vo)");
		return getSqlMapClientTemplate().queryForList("getProjectWatchInfo", vo);
	}
	public int updatePorjectWatchInfo(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("updatePorjectWatchInfo(ProjectInfo vo)");
		return getSqlMapClientTemplate().update("updatePorjectWatchInfo", vo);
	}
	public int deletePorjectInfoWatch(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("deletePorjectInfoWatch(ProjectInfo vo)");
		return getSqlMapClientTemplate().update("deletePorjectInfoWatch", vo);
	}
	public List<DataMap> getProjectUserInfo(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("getProjectUserInfo(ProjectInfo vo)");
		return getSqlMapClientTemplate().queryForList("getProjectUserInfo", vo);
	}
	@Override
	public int insertKeHuDangAnInfo(ProjectInfo vo) throws DataAccessException {
		logger.debug("insertKeHuDangAnInfo(ProjectInfo vo)");
	return getSqlMapClientTemplate().update("insertKeHuDangAnInfo", vo);
	}
	@Override
	public int updatePorjectInfoDangAn(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("updatePorjectInfoDangAn(ProjectInfo vo)");
		return getSqlMapClientTemplate().update("updatePorjectInfoDangAn", vo);
	}
	@Override
	public int insertPorjectInfoDuoyu(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("insertPorjectInfoDuoyu(ProjectInfo vo)");
		return getSqlMapClientTemplate().update("insertPorjectInfoDuoyu", vo);
	}
	@Override
	public List<DataMap> getProjectInfoDuoYu(ProjectInfo vo)
			throws DataAccessException {
		// TODO Auto-generated method stub
		logger.debug("getProjectInfoDuoYu(ProjectInfo vo)");
		return getSqlMapClientTemplate().queryForList("getProjectInfoDuoYu", vo);
	}
	@Override
	public List<DataMap> getWatchInfoListByVoCompany(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("getWatchInfoListByVoCompany(ProjectInfo vo)");
		return getSqlMapClientTemplate().queryForList("getWatchInfoListByVoCompany", vo);
	}
	@Override
	public int getWatchInfoListCountByVoCompany(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("getWatchInfoListCountByVoCompany(ProjectInfo vo)");
		return (Integer)getSqlMapClientTemplate().queryForObject("getWatchInfoListCountByVoCompany", vo);
	}
	@Override
	public int insertProjectWatchInfoo(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("insertProjectWatchInfoo(ProjectInfo vo)");
		return getSqlMapClientTemplate().update("insertProjectWatchInfoo", vo);
	}
	@Override
	public List<DataMap> getProjectWatchInfoo(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("getProjectWatchInfoo(ProjectInfo vo)");
		return getSqlMapClientTemplate().queryForList("getProjectWatchInfoo", vo);
	}
	@Override
	public int updatePorjectWatchInfoo(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("updatePorjectWatchInfoo(ProjectInfo vo)");
		return getSqlMapClientTemplate().update("updatePorjectWatchInfoo", vo);
	}
	@Override
	public int deletePorjectInfoWatcho(ProjectInfo vo)
			throws DataAccessException {
		logger.debug("deletePorjectInfoWatcho(ProjectInfo vo)");
		return getSqlMapClientTemplate().update("deletePorjectInfoWatcho", vo);
	}

	

}
