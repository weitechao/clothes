<%@ page language="java" contentType="text/html;charset=GB2312"%>
<%@ page autoFlush="true"%>
<%@ page import="com.care.app.LoginUser"%>
<%@ page import="com.care.common.config.Config"%>
<%@ taglib uri="/WEB-INF/struts-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic" prefix="logic"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="<%=request.getContextPath()%>/css/tbls.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/public/public.js"></script>
	<scripttype="text/javascript"src="http://code.jquery.com/jquery-1.4.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.8.2.js"
	type="text/javascript"></script>
<title>无标题文档</title>
</head>
<script type="text/javascript">

$(document).ready(function(){
	 $("#orderNumber").blur(function(){
		 var userCodeValue = $("#orderNumber").val().trim();
		 $.ajax({
			 type:"post",
			 url:"doProjectInfo.do?method=verfyDingDan",
		 	 data:"userCode="+userCodeValue,
		 	 success:function(msg){
		 		 if(msg=="fail"){
		 			 alert("已有该订单号");
		 			 $("#orderNumber").focus();
		 			 return false;
		 		 }
		 	 }
		 });
	 });
});

	function onAdd() {
		/* if(frmGo.projectNo.value.trim() == ""){
			alert("项目编号不能为空，请重新输入");
			frmGo.projectNo.focus();
			return false;
		}*/
		if(frmGo.orderNumber.value.trim() == ""){
			alert("订单号不能为空！");
			frmGo.orderNumber.focus();
			return false;
		} 
		frmGo.submit();
	}

	function preViews() {
		document.getElementById('preView').style.display = "none"
		document.getElementById('rePicture').style.display = "none"
		document.getElementById('pictureView').style.display = "block"
	}
	
    function InserTab() {
        var trLen = $("#tab1 tr").length;
        var rowT = "<tr><td><input type=text style='width:90px;' value='' id='d" + trLen + "'></td>" +
            "<td><input type=text style='width:90px;' value='' id='d1" + trLen + "'></td>" +
            "<td><input type=text style='width:90px;' value='' id='d2" + trLen + "'></td>" +
            "<td><input type=text style='width:90px;' value='' id='d3" + trLen + "'></td></tr>";
        var trPre = $("#tab1 tr:eq(" + (trLen - 1) + ")");
        $(rowT).insertAfter($(trPre));
    }
 
</script>
<body>
	<span class="title_1"></span>
	<form name="frmGo" method="post"
		action="doProjectInfo.do?method=insertUserDangAn"
		encType="multipart/form-data" onsubmit="return onAdd()">
		<%
			LoginUser loginUser = (LoginUser) request.getSession()
					.getAttribute(Config.SystemConfig.LOGINUSER);
			String loginUserCode = loginUser.getUserCode();
		%>
		<!-- <input type="hidden" name="addUser" value="<%=loginUserCode%>"> -->
		<!-- <table width="100%" border="0"cellpadding="0" cellspacing="0"  class="tbl_11" > -->
		
		
    
	<table width="100%"  id="tb1"  class="tbl_11" border="1" bordercolorlight=#000000  bordercolordark=#000000  bordercolor=#000000 cellspacing="0"  cellpadding="2"> 
	
	
    
		
		<!-- <table width="100%" border="0"cellpadding="0" cellspacing="1"  class="tbl_11" id="tb1"  > -->
			<tr>
				<th colspan="8" nowrap="nowrap" align="left">添加订单信息(客户档案)</th>
			</tr>

			<tr class="tr_11">
				<td colspan="8" nowrap="nowrap" align="center" width="7%">不一定制客户档案</td>
			</tr>

			<tr>
				<td align="left">订单编号</td>
				<td colspan="2" align="left">自动生成</td>
				<td align="left">旺旺名</td>
				<td colspan="2" align="left"><input name="projectNo" size="20"
					id="projectNo" type="text" class="txt_1" maxlength="30" /><font
					color="red">*</font></td>
				<td align="left">销售价格</td>
				<td align="left"><input name="salePrice" size="20"
					id="salePrice" type="text" class="txt_1" maxlength="30" /><font
					color="red">*</font></td>
			</tr>

			<tr>
				<td>微信名</td>
				<td colspan="2"><input name="wechat" size="20" id="wechat"
					type="text" class="txt_1" maxlength="30" /><font color="red">*</font></td>
				<td>订单号</td>
				<td colspan="2"><input name="orderNumber" size="20"
					id="orderNumber" type="text" class="txt_1" maxlength="30" /><font
					color="red">*</font></td>
				<td>下单时间</td>
				<td></td>
			</tr>


			<tr>
				<td>客户电话</td>
				<td colspan="2"><input name="kehuPhone" size="20"
					id="kehuPhone" type="text" class="txt_1" maxlength="30" /><font
					color="red">*</font></td>
				<td>订单类型</td>
				<td colspan="2"><select name="orderType" value="orderType">
						<option value="新单">新单</option>
						<option value="打样">打样</option>
						<option value="重做">重做</option>
				</select></td>
				<td>交付时间</td>
				<td>
				<select name="jiaofu_time" value="jiaofu_time">
						<option value="10">+10天  加急</option>
						<option value="5">+5天  特别加急</option>
						<option value="3">+3天   非常紧急</option>
				</select> <font color="red">*</font></td>
				</td>
			</tr>


			<tr>
				<td>客户姓名</td>
				<td><input name="kehuName" size="50" id="kehuName" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td>渠道</td>
				<td><select name="qudao" value="qudao">
						<option value="淘宝">淘宝</option>
						<option value="工单">工单</option>
						<option value="分销">分销</option>
						<option value="线下">线下</option>
						<option value="打样">打样</option>
						<option value="重做">重做</option>
						<option value="其他">其他</option>
				</select> <font color="red">*</font></td>
				<td>下单客服</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td>客户地址</td>
				<td colspan="7"><input name="address" size="100" id="address"
					type="text" class="txt_1" maxlength="100" /><font color="red">*</font>
				</td>
			</tr>

			<tr>
				<td>身高</td>
				<td><input name="height" size="20" id="height" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td>体重</td>
				<td><input name="weight" size="20" id="weight" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td>年龄</td>
				<td><input name="age" size="20" id="age" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td>性别</td>
				<td><select name="sex" value="sex">
						<option value="男">男</option>
						<option value="女">女</option>
				</select> <font color="red">*</font></td>
			</tr>

			<tr>
				<td >西装数量</td>
						<td><input name="xizhuang_number" size="20" id="xizhuang_number" type="number"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td>衣码</td>
				<td >衬衫数量</td>
				<td><input name="chenshan_number" size="20" id="chenshan_number" type="number"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td>衬衫码</td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td>肩宽</td>
				<td><input name="jiankuanA" size="20" id="jiankuanA"
					type="text" class="txt_1" maxlength="100" /><font color="red">*</font>
				</td>
				<td></td>
				<td>领围</td>
				<td><input name="lingweiB" size="20" id="lingweiB" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td>胸围</td>
				<td><input name="xiongweiA" size="20" id="xiongweiA"
					type="text" class="txt_1" maxlength="100" /><font color="red">*</font>
				</td>
				<td></td>
				<td>胸围</td>
				<td><input name="xiongweiB" size="20" id="xiongweiB"
					type="text" class="txt_1" maxlength="100" /><font color="red">*</font>
				</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td>中腰</td>
				<td><input name="zhongyaoA" size="20" id="zhongyaoA"
					type="text" class="txt_1" maxlength="100" /><font color="red">*</font>
				</td>
				<td></td>
				<td>中腰</td>
				<td><input name="zhongyaoB" size="20" id="zhongyaoB"
					type="text" class="txt_1" maxlength="100" /><font color="red">*</font>
				</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td>腹围</td>
				<td><input name="fuweiA" size="20" id="fuweiA" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td></td>
				<td>腹围</td>
				<td><input name="fuweiB" size="20" id="fuweiB" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td>后中衣长</td>
				<td><input name="houzhongyichangA" size="20"
					id="houzhongyichangA" type="text" class="txt_1" maxlength="100" /><font
					color="red">*</font></td>
				<td></td>
				<td>袖长</td>
				<td><input name="xiuchangB" size="20" id="xiuchangB"
					type="text" class="txt_1" maxlength="100" /><font color="red">*</font>
				</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td>前衣长</td>
				<td><input name="qianyichangA" size="20" id="qianyichangA"
					type="text" class="txt_1" maxlength="100" /><font color="red">*</font>
				</td>
				<td></td>
				<td>袖肥</td>
				<td><input name="xiufeiB" size="20" id="xiufeiB" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td>袖长</td>
				<td><input name="xiuchangA" size="20" id="xiuchangA"
					type="text" class="txt_1" maxlength="100" /><font color="red">*</font>
				</td>
				<td></td>
				<td>袖口</td>
				<td><input name="xiukouB" size="20" id="xiukouB" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td>袖肥</td>
				<td><input name="xiufeiA" size="20" id="xiufeiA" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td></td>
				<td>领口款式</td>
				<td><input name="lingkoukuaishiB" size="20"
					id="lingkoukuaishiB" type="text" class="txt_1" maxlength="100" /><font
					color="red">*</font></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>


			<tr>
				<td>袖口</td>
				<td><input name="xiukouA" size="20" id="xiukouA" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td></td>
				<td>衣长</td>
				<td><input name="yichangB" size="20" id="yichangB" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td>西裤数量</td>
				<td><input name="xiku_number" size="20" id="xiku_number" type="number"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td>裤码</td>
				<td >马甲数量</td>
					<td><input name="majia_number" size="20" id="majia_number" type="number"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td>马甲码</td>
				<td></td>
				<td></td>
			</tr>


			<tr>
				<td>裤长</td>
				<td><input name="kuchangC" size="20" id="kuchangC" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td></td>
				<td>胸围</td>
				<td><input name="xiongweiD" size="20" id="xiongweiD"
					type="text" class="txt_1" maxlength="100" /><font color="red">*</font>
				</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>


			<tr>
				<td>腰围</td>
				<td><input name="yaoweiC" size="20" id="yaoweiC" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td></td>
				<td>中腰</td>
				<td><input name="zhongyaoD" size="20" id="zhongyaoD"
					type="text" class="txt_1" maxlength="100" /><font color="red">*</font>
				</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td>臀围</td>
				<td><input name="tuiweiC" size="20" id="tuiweiC" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td></td>
				<td>衣长</td>
				<td><input name="yichangD" size="20" id="yichangD" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>


			<tr>
				<td>档围</td>
				<td><input name="dangweiC" size="20" id="dangweiC" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td>大腿</td>
				<td><input name="datuiC" size="20" id="datuiC" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>


			<tr>
				<td>中腿</td>
				<td><input name="zhongtuiC" size="20" id="zhongtuiC"
					type="text" class="txt_1" maxlength="100" /><font color="red">*</font>
				</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>


			<tr>
				<td>小腿</td>
				<td><input name="xiaotuiC" size="20" id="xiaotuiC" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td>脚口</td>
				<td><input name="tuikouC" size="20" id="tuikouC" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td>扣型</td>
				<td><input name="kouxingC" size="20" id="kouxingC" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td>扣色</td>
				<td><input name="kouseC" size="20" id="kouseC" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font></td>
				<td>款型</td>
				<td><select name="kuanxingD" value="kuanxingD">
						<option value="修身">修身</option>
						<option value="修身+">修身+</option>
						<option value="合身">合身</option>
						<option value="合身+">合身+</option>
						<option value="宽松">宽松</option>
						<option value="宽松+">宽松+</option>
				</select> <font color="red">*</font></td>
				<td>驳头</td>
				<td><select name="botouD" value="botouD">
						<option value="西装领">西装领</option>
						<option value="平驳领">平驳领</option>
						<option value="戗驳领">戗驳领</option>
						<option value="青果领">青果领</option>
						<option value="立领">立领</option>
						<option value="中华立领">中华立领</option>
						<option value="其它">其它</option>
				</select> <font color="red">*</font></td>
			</tr>

			<tr>
				<td>口袋</td>
				<td><select name="koudaiC" value="koudaiC">
						<option value="双线">双线</option>
						<option value="单线">单线</option>
						<option value="票据">票据</option>
						<option value="其它">其它</option>
				</select> <font color="red">*</font></td>
				<td>袋盖</td>
				<td><select name="daigai" value="daigai">
						<option value="有">有</option>
						<option value="无">无</option>
						<option value="其它">其它</option>
				</select> <font color="red">*</font></td>
				<td>平斜袋</td>
				<td><select name="pingxiedai" value="pingxiedai">
						<option value="平袋">平袋</option>
						<option value="斜袋">斜袋</option>
						<option value="其它">其它</option>
				</select> <font color="red">*</font></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td>面料1</td>
				<td><input name="miaoliao1" size="20" id="miaoliao1"
					type="text" class="txt_1" maxlength="100" /><font color="red">*</font>
				</td>
				<td>米数</td>
				<td></td>
				<td>用途</td>
				<td>
				<select name="yongtu1" value="yongtu1">
						<option value="上衣">上衣</option>
						<option value="裤子">裤子</option>
						<option value="马甲">马甲</option>
						<option value="衬衫">衬衫</option>
						<option value="西装套装">西装套装</option>
						<option value="换片">换片</option>
						<option value="其他">其他</option>
				</select> <font color="red">*</font></td>
				
				<!-- <input name="yongtu1" size="20" id="yongtu1" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font> -->
					
					</td>
				<td>供应商</td>
				<td></td>
			</tr>
 
			<tr>
				<td>面料2</td>
				<td><input name="miaoliao2" size="20" id="miaoliao2"
					type="text" class="txt_1" maxlength="100" /><font color="red">*</font>
				</td>
				<td>米数</td>
				<td></td>
				<td>用途</td>
				<td>
				
				<select name="yongtu2" value="yongtu2">
						<option value="上衣">上衣</option>
						<option value="裤子">裤子</option>
						<option value="马甲">马甲</option>
						<option value="衬衫">衬衫</option>
						<option value="西装套装">西装套装</option>
						<option value="换片">换片</option>
						<option value="其他">其他</option>
				</select> <font color="red">*</font></td>
				<!-- <input name="yongtu2" size="20" id="yongtu2" type="text"
					class="txt_1" maxlength="100" /><font color="red">*</font> --></td>
				<td>供应商</td>
				<td></td>
			</tr>

			<tr>
				<td>体型备注</td>
				<td colspan="3"><input name="tixingremark" size=60"
					id="tixingremark" type="text" class="txt_1" maxlength="1000" /><font
					color="red">*</font></td>
				<td>备注</td>
				<td colspan="3"><input name="remark" size="60" id="remark"
					type="text" class="txt_1" maxlength="1000" /><font color="red">*</font>
				</td>
			</tr>

			<tr>
				<td align="left">附件(ZIP)</td>
				<td colspan="2">请压缩后再添加--
				<input type="file" name="channelId"
					id="channelId" multiple="multiple" class="imagePath" /> <img alt=""
					src="" id="image1" class="showImage"></td>
					
						<td align="left" colspan="2">&
				</td>
			</tr>
			
				<tr>
				<td>提交类型</td>
				<td colspan="7">
						保存 <input name="tag" type="radio" class="radio_1" value="1" checked="checked" >
	    保存并提交<input type="radio" name="tag" class="radio_1" value="2" >
					</td>
				
			</tr>
			
			<tr>
					<td></td>
				<td colspan="7">
						<input
					type="button" name="ok" accesskey="y" tabindex="y" value="确 定"
					class="but_1" onclick="onAdd()"
					style="font-size:12;width:40px;height:21px;"> <input
					type="button" name="back" accesskey="b" tabindex="b" value="返 回"
					class="but_1"
					onclick="location='doProjectInfo.do?method=queryProjectInfoXml'"
					style="font-size:12;width:40px;height:21px;">
					</td>
				
			</tr>

		</table>

	</form>
</body>
</html>