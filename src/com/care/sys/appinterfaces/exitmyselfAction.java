package com.care.sys.appinterfaces;

/**
 * �ֻ��ϴ���Ϣ�ӿ�
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.care.common.config.ServiceBean;
import com.care.common.http.BaseAction;
import com.care.common.lang.Constant;
import com.care.sys.appuserinfo.domain.AppUserInfo;
import com.care.sys.appuserinfo.domain.logic.AppUserInfoFacade;
import com.care.sys.deviceactiveinfo.domain.DeviceActiveInfo;
import com.care.sys.deviceactiveinfo.domain.logic.DeviceActiveInfoFacade;
import com.care.sys.locationinfo.domain.LocationInfo;
import com.care.sys.locationinfo.domain.logic.LocationInfoFacade;
import com.godoing.rose.lang.DataMap;
import com.godoing.rose.log.LogFactory;

public class exitmyselfAction extends BaseAction {
	Log logger = LogFactory.getLog(setSportInfoAction.class);

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		String href = request.getServletPath();
		JSONObject json = new JSONObject();
		
		ServletInputStream input = request.getInputStream();
		BufferedReader reader = new BufferedReader(new InputStreamReader(input));
		StringBuffer sb = new StringBuffer();
		String online = "";

		while ((online = reader.readLine()) != null) {
			sb.append(online);
		}
		//JSONObject object = JSONObject.fromObject(sb.toString());
	
		String wechat = request.getParameter("wechat");//  object.getString("wechat");
System.out.println("wechat="+wechat);	
		String token = request.getParameter("token");
		
		AppUserInfoFacade info = ServiceBean.getInstance().getAppUserInfoFacade();//����userApp������ȡ��user�ֵ䣩
		try {
			AppUserInfo vo = new AppUserInfo(); 
			vo.setCondition("  password = '"+wechat +  "'   and token='"+token+"'  limit 1");
			List<DataMap> list  = info.getAppUserInfo(vo);
			
		
			if(list.size()>0){
				result = Constant.SUCCESS_CODE;
			}else{
				result = Constant.FAIL_CODE;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			StringBuffer sb1 = new StringBuffer();
			Writer writer = new StringWriter();
			PrintWriter printWriter = new PrintWriter(writer);
			Throwable cause = e.getCause();
			while (cause != null) {
				cause.printStackTrace(printWriter);
				cause = cause.getCause();
			}
			printWriter.close();
			String resultSb = writer.toString();
			sb1.append(resultSb);
			logger.error(e);
			result = Constant.EXCEPTION_CODE;
		}
		json.put("resultCode", result);
	
		json.put("request", href);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json.toString());
		return null;
	}

}
