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
import java.util.Calendar;
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
import com.care.common.http.HttpRequest;
import com.care.common.lang.Constant;
import com.care.sys.appuserinfo.domain.AppUserInfo;
import com.care.sys.appuserinfo.domain.logic.AppUserInfoFacade;
import com.care.sys.channelinfo.domain.ChannelInfo;
import com.care.sys.deviceactiveinfo.domain.DeviceActiveInfo;
import com.care.sys.deviceactiveinfo.domain.logic.DeviceActiveInfoFacade;
import com.care.sys.feedbackinfo.domain.FeedBackInfo;
import com.care.sys.locationinfo.domain.LocationInfo;
import com.care.sys.locationinfo.domain.logic.LocationInfoFacade;
import com.care.sys.projectinfo.domain.ProjectInfo;
import com.godoing.rose.lang.DataMap;
import com.godoing.rose.log.LogFactory;

public class WuLiuAction extends BaseAction {
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
		JSONObject object = JSONObject.fromObject(sb.toString());
		logger.info("//wuliu接口请求参数="+sb.toString());
		/*

G、发货-----，扫码，需要填写物流单号，给客户发短信，短信内容暂定，至少要包含物流单号*/
		
		try {
			/*String phone = object.getString("phone");
			String wechat = object.getString("wechat");*/
			
			String wechat = object.getString("wechat");
			String token = object.getString("token");
	AppUserInfo vo = new AppUserInfo(); 
			
			vo.setCondition("  password = '"+ wechat +  "'   and token='"+token+"' order by id desc limit 1");
			List<DataMap> list  = ServiceBean.getInstance().getAppUserInfoFacade().getAppUserInfo(vo);
if(list.size()<=0){
	result = Constant.EXCEPTION_CODE;
}	else{
	if("1".equals(list.get(0).get("status"))){
		if("6".equals(list.get(0).get("last_name")+"")){
	
	String orderId = object.getString("orderId");
	String expressType = object.getString("expressType");
	String kuaiDiHao = object.getString("kuaiDiHao");
	String price = object.getString("price");
	String number = object.getString("number");
	/*
	 * 0，0，0，0，0.分别对应上衣，裤子，马甲，衬衫和领带的数量
	 * */
	String wupin = object.getString("wupin");
	
	String[]  abc=number.split(",");
	
	FeedBackInfo voo =new FeedBackInfo();
	voo.setCondition("user_feedback_content='"+kuaiDiHao+"'  limit 1");
	List<DataMap> listo  = ServiceBean.getInstance().getFeedBackInfoFacade().getFeedBackInfo(voo);
	if(listo.size()>0){
		result = Constant.FAIL_CODE;
		
		
	}else{
		result = Constant.SUCCESS_CODE;
		
		FeedBackInfo fo =new FeedBackInfo();
	fo.setUser_id(orderId);
  if("1".equals(expressType)){
	  fo.setProject_name("顺丰");
  }else if("2".equals(expressType)){
	  fo.setProject_name("京东");
  }else if("3".equals(expressType)){
	  fo.setProject_name("其它物流");
  }else if("4".equals(expressType)){
	  fo.setProject_name("无需物流");
  }else{
	  fo.setProject_name(expressType);
  }
	fo.setPrice(price);
	fo.setUser_feedback_content(kuaiDiHao);
	fo.setDate_time(new Date());
	fo.setWupin(wupin);
	fo.setNumber("1");
	fo.setNickname(list.get(0).get("nick_name")+"");

	fo.setShangyi(abc[0]);
	fo.setKuzi(abc[1]);
	fo.setMajia(abc[2]);
	fo.setChenshan(abc[3]);
	fo.setLingdai(abc[4]);
	ServiceBean.getInstance().getFeedBackInfoFacade().insertFeedBackInfo(fo);
	
	// http://localhost:9999/mobilepay/watchAppUser/sendwuliu/a/18735662247/789
	
	ProjectInfo pvo = new ProjectInfo();
	pvo.setCondition("order_id='" + orderId + "'");
	List<DataMap> listOrder = ServiceBean
			.getInstance().getProjectInfoFacade()
			.getProjectInfo(pvo);
	if(listOrder.size()>0){
		String name = listOrder.get(0).get("kehu_name")+"";
		String  kehuPhone= listOrder.get(0).get(
				"kehu_phone")
				+ "";
		String url ="http://47.111.148.8:9999/mobilepay/watchAppUser/sendwuliu/"+kehuPhone+"/"+orderId;
		url = url.replaceAll(" ", "");
		
		String fasogn =HttpRequest.get(url);
		logger.info("短信发送="+fasogn);
		String wuliuname="顺丰";
		if("1".equals(expressType)){
			wuliuname="顺丰";
		  }else if("2".equals(expressType)){
			  wuliuname="京东";
		  }else if("3".equals(expressType)){
			  wuliuname="其它物流";
		  }else if("4".equals(expressType)){
			  wuliuname="无需物流";
		  }
		
		ChannelInfo chInfo = new ChannelInfo();
		chInfo.setOrder_id(orderId);
		chInfo.setPhone(kehuPhone);
		chInfo.setAddTime(new Date());
		chInfo.setRemark("【"
				+ new SimpleDateFormat(
						"yyyy-MM-dd HH:mm")
						.format(Calendar
								.getInstance()
								.getTime())
				+ "】【"
				+ orderId
				+ "】订单已通过质检流程，现已为您发货物流单号为【"+kuaiDiHao+"】</br>（"+wuliuname+"）（西装在我们质检小哥哥的检查下已经成功盖章！现在由快递界的老大哥顺丰运输！安排上了！那些将要去的地方，都是素未谋面的故乡！）");
		chInfo.setStatus("1");
		ServiceBean.getInstance()
				.getChannelInfoFacade()
				.insertChannelInfo(chInfo);
		
		ProjectInfo voStatus = new ProjectInfo();
		voStatus.setCondition("order_id='" + orderId + "'");
		voStatus.setStatus("26");
		ServiceBean.getInstance().getProjectInfoFacade()
		.updatePorjectInfo(voStatus);

	}else{
		result = 5;
	}

	}
	}else{
		result = 6;
	}
}else{
	result = Constant.STATUSS_CODE;
}
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
		logger.info("//wuliu接口返回参数="+json.toString());
		response.getWriter().write(json.toString());
		return null;
	}
	
}
