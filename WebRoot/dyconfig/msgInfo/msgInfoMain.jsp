<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import="com.godoing.rose.http.common.*"%>
<%@ page import="com.care.common.lang.*"%>
<%@ page import="com.care.common.config.Config"%>
<%@ page import="com.care.app.LoginUser"%>
<%@ taglib uri="/WEB-INF/struts-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic" prefix="logic"%>
<%@ page autoFlush="true"%>
<%
	/*页面属性*/
	PagePys pys = (PagePys) request.getAttribute("PagePys");
	LoginUser loginUser = (LoginUser)request.getSession().getAttribute(Config.SystemConfig.LOGINUSER); 
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>无标题文档</title>
		<link href="<%=request.getContextPath()%>/css/tbls.css"
			rel="stylesheet" type="text/css">
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/public/public.js"></script>   <!-- 调用此方法 -->
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/public/My97DatePicker/WdatePicker.js"></script>
	</head>
	<script language="javascript">
	function add(){
		frmGo.action = "doMsgInfo.do?method=initInsert";
		frmGo.submit();
	}
	
function finds(){
   var st = new Date(frmGo.startTime1.value.replace(/-/g,'/'));
	var et = new Date(frmGo.endTime1.value.replace(/-/g,'/'));
	if(Date.parse(st) - Date.parse(et)>0){
		alert("开始时间不能大于结束时间!");
		return false;
	}
	   frmGo.submit();
}
function c(){
   /*  document.all.startTime.value="";
    document.all.endTime.value=""; */
    document.all.startTime1.value="";
    document.all.endTime1.value="";
 /*    document.all.fromUserName.value="";
    document.all.toUserName.value="";
    document.all.content.value="";
    document.all.serieNo.value="";
    document.all.belongProject.value="";
    document.getElementById("statusSelect").options[0].selected = true; */
} 

</script>
	<body>
		<span class="title_1"></span>
		<form name="frmGo" method="post" action="doMsgInfo.do?method=queryMsgInfo">
			<table width="100%" class="table" border=0 cellpadding="0" cellspacing="1">
               <tr>
                <th colspan="12" nowrap="nowrap" align="left">
                售后信息
                 <input type="button" class="but_1" accesskey="a"
							tabindex="a" value="添 加" onclick="add()">
                </th>
                </tr>
                 <tr class="title_3">
                       <td colspan="13">
				<%-- 	  处理时间
                     <input name="startTime" type="text" class="txt_1"  id="startTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"fNow_date");%>" onclick="WdatePicker()"
								size="9" readonly> -
							<input name="endTime" type="text" class="txt_1" id="endTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"now_date");%>" onclick="WdatePicker()"
								size="9" readonly>	 --%>
					提交时间
					<input name="startTime1" type="text" class="txt_1"  id="startTime1" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"fNow_date1");%>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
								size="20" readonly> -
							<input name="endTime1" type="text" class="txt_1" id="endTime1" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"now_date1");%>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
								size="20" readonly>					
				
						<input name="find1" type="button" class="but_1" accesskey="f"
							tabindex="f" value="搜 索" onclick="javascript:finds()">
					     <input name="clear" type="button" class="but_1" accesskey="c"
						    tabindex="c"  value="清除搜索" onclick="c()">
				</tr> 
				<%int i=1; %>
                  <tr class="title_2">                 	
                  	<td width="5%">订单号</td>                                   	                 	
                  	<td width="5%" >下单人</td>
                  	<td width="5%" >姓名</td>
                  	<td width="5%" >次数</td>
                  	<td width="6%">提交时间</td>
                  <td width="6%">交付时间</td> 
                  	<td width="6%">米</td>
                  	<td width="6%">供应商</td>
                  	<td width="6%">面料</td>
                  	<td width="6%">归责</td>
                  	<td width="8%">备注</td>
                  	<!-- <td width="5%">操作</td> -->
                  </tr>	
                  
                  <logic:iterate id="element" name="pageList">
					<tr class="tr_5" onmouseover='this.className="tr_4"' onmouseout='this.className="tr_5"' >						
							<td>
									<bean:write name="element" property="order_id"/>
						
						</td>
						<td>
								<bean:write name="element" property="add_user"/>
						</td>
						<td>
								<bean:write name="element" property="name"/>
						</td>
						<td>
								<bean:write name="element" property="cishu"/>
						</td>
						
					<%-- 	<td>
							<logic:equal name="element" property="is_handler" value="1">
								<font style="color:green;font-size: 20px;">√</font>
							</logic:equal>
							<logic:equal name="element" property="is_handler" value="0">
								<font style="color:red;font-size: 20px;">×</font>
							</logic:equal>
						</td> --%>
							<td>
							<bean:write name="element" property="msg_handler_date" format="yyyy-MM-dd HH:mm:ss"/>
							<logic:empty name="element" property="msg_handler_date">无</logic:empty>
						</td>
						<td>
								<bean:write name="element" property="jiaofutime"/>
						</td>
						<td>
								<bean:write name="element" property="mi"/>
						</td>
						<td>
								<bean:write name="element" property="gongyingshang"/>
						</td>
						<td>
								<bean:write name="element" property="mianliao"/>
						</td>
						<td>
								<bean:write name="element" property="guize"/>
						</td>
						<%-- <td>
							<bean:write name="element" property="msg_occur_date" format="yyyy-MM-dd HH:mm:ss"/>
							<logic:empty name="element" property="msg_occur_date">无</logic:empty>
						</td> --%>
					<%-- <td>
								<bean:write name="element" property="add_user"/>
						</td> --%>
					
							<td>
								<bean:write name="element" property="remark"/>
						</td>
						
						<%-- <td>
								<bean:write name="element" property="remark"/>
						</td> --%>
					</tr>
				</logic:iterate>
				
				<tr class="title_3">
					<td colspan="12" align="left" >  
						<%
							pys.printGoPage(response, "frmGo");
						%>
					</td>
				</tr> 
			</table>
		</form>
	</body>
</html>