<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    application.setAttribute("basePath", basePath);
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta property="qc:admins" content="542536566763012535145636" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>倾听世界</title>
    <meta name="keywords" content="倾听世界,享笑网,美女,旅行" />
    <meta name="description" content="让世界聆听我们的声音，放慢我们青春的脚步" />
    <meta name="viewport" content="width=1050" />
    <link rel="stylesheet" type="text/css" href="css/common.css?v7.2" />
    <link rel="stylesheet" type="text/css" href="css/public.css?v1" />
    <link href="images/favicon.ico?v=0.1" mce_href="http://www.sharesmile.cn/favicon.ico" rel="icon" type="image/x-icon" />
    <link href="images/favicon.ico?v=0.1" mce_href="http://www.sharesmile.cn/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <script type="text/javascript" src="js/jq.js?v4.1"></script>
    <script type="text/javascript" src="js/ss.js?v4.8"></script>
    <script type="text/javascript">
        function getBrowser()
        {
            var OsObject = "";
            if(navigator.userAgent.indexOf("MSIE")>0) {
                var browser=navigator.appName;
                var b_version=navigator.appVersion;
                var version=b_version.split(";");
                var trim_Version=version[1].replace(/[ ]/g,"");
                if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE6.0")
                {
                    return("IE6");
                }
                else if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE7.0")
                {
                    return("IE7");
                }
                else if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")
                {
                    return("IE8");
                }
                else if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE9.0")
                {
                    return("IE9");
                }
                else if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE10.0")
                {
                    return("IE10");
                }
            }
            if( navigator.userAgent.indexOf("Firefox")>0){
                return "Firefox";
            }
            if( navigator.userAgent.indexOf("Chrome")>0){
                return "Chrome";
            }
            if( navigator.userAgent.indexOf("Opera")>0){
                return "Opera";
            }
            if( navigator.userAgent.indexOf("Safari")>0) {
                return "Safari";
            }
            return 'Others';
        }
        (function(){
            vars = {};
            vars.browser = getBrowser();
            vars.hello_ketty = "heimao";
            vars.jsUrl = "http://www.sharesmile.cn/js/";
            vars.homeUrl = 'http://www.sharesmile.cn/';
            vars.siteName = '享笑网 - www.ShareSmile.cn - 享你所想,享你所笑';
            vars.publicUrl = "/public/";
            vars.showgirlUrl = "/user#showgirl";
            vars.userid = '10460';
            vars.username = '416148489@qq.com';
            vars.nickname = '阿斗';
            vars.gender = 0;
            vars.PHPSESSID = "krach1sltrpu5pa9ldu9jen4k2";
            vars.ajaxSubmiting = false;
            vars.sysImageUrl = '/public/system/';
            vars.qingImageUrl = '/public/qing/';
            vars.headImageUrl = '/public/userhead/';
            vars.postImageUrl = '/public/post/';
            vars.essayImageUrl = '/public/essay/';
            vars.jokesImageUrl = '/public/jokes/';
            vars.showgirlImageUrl = '/public/showgirl/';
            vars.photoImageUrl = '/public/photo/';
            vars.commStatUrl = '/Stat/stat';
            vars.cookieUMessage = 'HASMESSAGE'+vars.userid;
            vars.voteBlankColor = new Array( '#5DBBEF', '#95E62A', '#CC1CD9', '#FFCD10', '#F79395');
            var d = new Date();
            vars.todayTimeString = 20160122;
        })();
    </script>
</head>
<body>
<div class="pb-container">
    <div class="pb-container-main pb-after-clear">
        <!-- 公共头部 -->
        <div class="pb-main pb-navwrap pb-after-clear">
            <div class="pb-iblock pb-fl pb-logo">
                <a href="/show"><img src="images/logo.jpg" alt="享笑网LOGO 征文比赛 有奖征文" /></a>
            </div>
            <div class="pb-iblock pb-fl pb-nav">
                <ul>
                    <li><a href="/show">首页</a></li>
                    <li><a href="/zhengwen">征文比赛</a></li>
                    <li><a href="/qingting">倾听世界</a></li>
                    <li><a href="/jiaoxing">叫醒耳朵</a></li>
                    <li class="pb-nav-li-last"><a href="/meiri">每日一笑</a></li>
                </ul>
            </div>
            <div class="pb-iblock pb-fr pb-oths">
                <a class="nmt" href="javascript:void(0);" onclick="Sys.commStat(2);commonLib.SetHome(this);">设为首页</a>
                <a class="nmt" href="/show" rel="sidebar" onclick="Sys.commStat(1);commonLib.addFavorite();">收藏我们</a>
                <a class="nmt" href="suggest.html">投诉建议</a> &nbsp;
                <span class="nmt"> | </span>
                <div class="pb-ucenter pb-after-clear">
                    <div id="uMessageCenter">
                        <i class="pb-icons triangle"></i>
                        <a href="/user" id="uSetEntry-head"><img src="images/default.gif" alt="阿斗" /></a>
                        <i class="pb-icons notice pb-hide"></i>
                    </div>
                    <br />
                    <ul>
                        <li><a href="/user" id="uSetEntry"><i class="pb-icons my"></i> 个人中心</a></li>
                        <li><a href="/site/logout"><i class="pb-icons logout"></i> 退出登录</a></li>
                    </ul>
                </div>
                <br />
                <form action="" onsubmit="W.tips('暂未开放搜索功能，敬请期待!');Sys.commStat(6);return false;">
                    <input class="pb-search-btn" type="submit" value="" />
                    <input class="pb-search" type="text" />
                </form>
            </div>
        </div>
        <!-- 公共头部 -->
        <!-- 面包屑 -->
        <div class="pb-main pb-breadcrumbs pb-mt40 pb-size-small">
            <a href="/show">首页</a> &gt;&gt;
            <a href="/qingting">倾听世界</a> &gt;&gt;
            <a>全部</a>
        </div>
        <!-- 面包屑结束 -->
        <script type="text/javascript">
            vars.loveQingUrl = "/stat/LoveQing";
            vars.loadQingUrl = "list.php";
            vars.lastQingId = -1;
            vars.listQingLimit = 0;
            var urlId = Sys.getUrlParam();
            if( urlId && !isNaN( urlId)){
                vars.lastQingId = urlId;
            }
            vars.lastQingCatId = 0;//默认加载全部
            vars.qingKuanping = 1280;
            vars.kuanpingModel = false;
            $(document).ready(function(){
                Sys.commStat(13);
            });
        </script>
        <div id="QingBox" class="pb-main pb-mt20">
            <div id="QingNav" style="height:185px;">
                <div id="listhead"></div>
                <div id="QingNavBut">
                    <a href="/qingting" class="init">倾听世界</a>
                    <ul id="qtbt">
                    </ul>
                </div>
            </div>
            <div id="qingMW" style="width:1020px;">
                <div class="col" id="pic-list" style="height: 3048px;">

                </div>
            <div style="clear:both;"></div>
            <div class="loading">
                <img src="images/loading.gif" alt="正在努力加载" />
                <p class="d-n">当前栏目已经没有更多了，推荐你看看 <a href="/qing?id=15" class="c_yel">超萌</a>！</p>
            </div>
        </div>
        <div class="headShadow" id="headShadow" style="display:none;"></div>
        <script id="qingTpl" type="text/x-jsmart-tmpl">
<div id="a-qing-wp-{$id}" class="single" style="left:{$left}px;top:{$top}px;">
	<div class="thumb-wrap" style="width:{$width}:px;height:{$wrapHeight}px" onmouseover="Sys.showQingLove({$id},$(this));">
		<a title="{if $height!=$wrapHeight}原图仅显示部分,{/if}点击查看详细" class="thumb" href="{if $href}{$href}{else}pic_detail.html?{$cid}-{$id}{/if}" target="_blank">
			<img id="qing_image_{$id}" data-url="{$image}" width="{$width}" height="{$height}" class="qimg" src="images/pixel.gif" alt="背景图片">
		</a>
		<div class="thumb_but"><a href="javascript:void(0);" class="like" onclick="Sys.loveQing({$id}, true);">{$lovenum}</a></div>
	</div>
	<div class="con">
       <div class="pl">
          <div class="user_pn">
              <a title="{$nickname}" href="javascript:void(0);" rel="{$nickname}"><img src="{$headimage}" title="{$nickname}" alt="{$nickname}"></a>
          </div>
           <div rel="beautbeau" class="text">
           		<span title="{$nickname}" class="c_tx">{$nickname}</span>: {$content}{if $height!=$wrapHeight}<a href="pic_detail.html?{$cid}-{$id}" target="_blank" class="c_yel">【原图仅显示部分】</a>{/if}
           </div>
       </div>
       <div class="bottom clear">
			<a href="javascript:void(0);" class="like f-r" onclick="Sys.loveQing({$id});"><i class="c_tx">++1</i><span>{$lovenum}</span></a>
			{if $href}<a href="{$href}" target="_blank" class="gobuy f-r" onclick="Sys.commStat(45);">去逛逛</a>{/if}
        </div>
     </div>
</div>
</script>
        <script>
            $(document).ready(function(){
                Sys.scrollLoading = true;
                Sys.loadQing();//加载完页面后，要先装载一页
                $(window).scroll(function(){
                    Sys.scrollLoad( Sys.loadQing);
                });

                $("#QingNavBut").mouseenter(function(){
                    $("#QingNavBut ul").stop().slideDown();
                }).mouseleave(function(){
                    $("#QingNavBut ul").stop().slideUp();
                });
            });
        </script>
    </div>
    <!-- 公共尾部 -->
    <div style="clear:both;"></div>
    <div class="pb-footer">
        <div class="pb-footer-wp">
            <div class="pb-main pb-footer-cnt pb-size-small">
                <span class="pb-fl">&copy; 2012 - 2015 深圳市享笑网科技有限公司版权所有 粤 icp 备 13011067 号</span>
                <ul class="pb-fr">
                    <li><a href="http://www.whzcwl.com.cn" target="_blank">志诚网络</a></li>
                    <li><a href="http://wpa.qq.com/msgrd?v=1&amp;uin=2338601847&amp;site=www.sharesmile.cn&amp;menu=yes">版权声明</a></li>
                    <li><a href="http://wpa.qq.com/msgrd?v=1&amp;uin=2338601847&amp;site=www.sharesmile.cn&amp;menu=yes">客服中心</a></li>
                    <li><a href="http://wpa.qq.com/msgrd?v=1&amp;uin=2338601847&amp;site=www.sharesmile.cn&amp;menu=yes">联系我们</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 公共尾部 -->
    <div class="ssretotop" id="goTopButton">
        <div class="SG-sidecont">
            <a style="visibility: visible;" href="javascript:;" id="gotonext"></a>
            <a id="retotop" class="pb-icons" href="javascript:void(0)" style="visibility: visible;" title="点击我 坐飞机到顶部"></a>
            <a href="javascript:;" id="gotopre"></a>
        </div>
    </div>
</div>
<script id="tpl-pb-rule" type="text/x-jsmart-tmpl">
		<img src="images/rule.gif" alt="获奖规则"/>
		<a href="javascript:top.window.location.href='/user#go=cash';" style="position: absolute; cursor:pointer;height: 24px; width: 72px; left: 730px; top: 494px; display:inline-block;background:#fff;opacity:0; filter:alpha(opacity=0);"></a>
	</script>
<script language="javascript" type="text/javascript" src="js/15502332.js"></script>
<noscript>
    <a href="http://www.51.la/?15502332" target="_blank"><img alt="我要啦免费统计" src="images/15502332.asp" style="border:none" /></a>
</noscript>
<script type="text/javascript" language="javascript">
    $(document).ready(function(){
        qtbt();
        qtqbtp();
        $(".pb-ucenter").bind('mouseenter', function(){
            $(this).find('ul').stop().slideDown('fast');
            Sys.clearFlicker('uMessageCenter');
        }).bind('mouseleave', function(){
            $(this).find('ul').stop().slideUp('fast');
        });

        $("#goTopButton").click(function(){
            Sys.scrollTo($('body'));
            Sys.commStat(33);
        });
        if( vars.browser != 'IE6'){
            var w_w = parseInt( $("body").width());
            var obj = $("#goTopButton");
            $(window).scroll(function(){
                if($(this).scrollTop() > 500){
                    if( !isNaN(w_w) && w_w > 0){
                        obj.css('left', (Math.ceil((w_w-1050)/2) + 1050 + 10) + "px" );
                    }
                    obj.fadeIn();
                }else{
                    obj.fadeOut();
                }
            });
        }
        Sys.hide51();
    });
    //倾听世界标题查询
    function qtbt(){
        $.ajax({
            url:"/syqtsjbt",
            type:"post",
            async:false,
            dataType:"json",
            success:function (pager){
                var str1 = "";
                for (var i = 0; i < pager.length; i++) {
                        str1 += "<li>"+
                            "<a href='#' qid='8'>"+pager[i].text+
                            "</a></li>";
                }
                $("#qtbt").html(str1);
            },
            error:function (){
                alert("查询倾听世界标题出错,请检查程序或者网络");
            }
        });
    }

    //倾听世界查询
    function qtqbtp(){
        $.ajax({
            url:"/qtqbtp",
            type:"post",
            async:false,
            dataType:"json",
            success:function (photo){
                var info = "";
                var count=0;
                for (var i =0;i<photo.length;i++){
                    if(count==0){
                        //info+='<div style="left:0px;top:'+i/3*571+'px;" class="single" id="a-qing-wp-'+5640+i+'"><div onmouseover="Sys.showQingLove('+5640+i+',$(this));" style="width:310:px;height:465px" class="thumb-wrap" on="0"><a target="_blank" href="pic_detail.html?25-'+5640+i+'" class="thumb" title="点击查看详细"><img width="310" height="465" alt="背景图片" src="<%=request.getContextPath()%>'+photo[i].picurl+'" class="qimg"  id="qing_image_'+5640+i+'" style="display: inline;"></a><div class="thumb_but" style="display: none;"><a onclick="Sys.loveQing('+5640+i+', true);" class="like" href="javascript:void(0);">9</a></div></div><div class="con"><div class="pl"><div class="user_pn"><a rel="测试员" href="javascript:void(0);" title="测试员"><img alt="测试员" title="测试员" src="<%=request.getContextPath()%>/upimg/10.jpg"></a></div><div class="text" rel="beautbeau"><span class="c_tx" title="测试员">测试员</span>:</div></div><div class="bottom clear"><a onclick="Sys.loveQing('+5640+i+');" class="like f-r" href="javascript:void(0);"><i class="c_tx">++1</i><span></span></a></div></div></div>';
                        info+="<div style='left:0px;top:"+i/3*571+"px;' class='single' id='a-qing-wp-5640'><div onmouseover='Sys.showQingLove(5640,$(this));' style='width:310:px;height:465px' class='thumb-wrap' on='0'><a target='_blank' href='pic_detail.html?25-5640' class='thumb' title='点击查看详细'><img width='310' height='465' alt='背景图片' src='<%=request.getContextPath()%>"+photo[i].picurl+"' class='qimg'  id='qing_image_5640' style='display: inline;'></a><div class='thumb_but' style='display: none;'><a onclick='Sys.loveQing(5640, true);' class='like' href='javascript:void(0);'>"+photo[i].topiczancount+"</a></div></div><div class='con'><div class='pl'><div class='user_pn'><a rel='叫醒闹钟' href='javascript:void(0);' title='叫醒闹钟'><img alt='叫醒闹钟' title='叫醒闹钟' src='/images/head_10001_4c59b035cf_100.jpg'></a></div><div class='text' rel='beautbeau'><span class='c_tx' title='叫醒闹钟'>叫醒闹钟</span>:"+photo[i].topicnr+"</div></div><div class='bottom clear'><a onclick='dianzan("+photo[i].id+");' class='like f-r' href='javascript:void(0);'><i class='c_tx'>++1</i><span>"+photo[i].topiczancount+"</span></a></div></div></div>"
                        count=1;
                    }else if(count==1){
                        //info+='<div style="left:371px;top:'+i/3*571+'px;" class="single" id="a-qing-wp-'+5640+i+'"><div onmouseover="Sys.showQingLove('+5640+i+',$(this));" style="width:310:px;height:465px" class="thumb-wrap" on="0"><a target="_blank" href="pic_detail.html?25-'+5640+i+'" class="thumb" title="点击查看详细"><img width="310" height="465" alt="背景图片" src="<%=request.getContextPath()%>'+photo[i].picurl+'" class="qimg"  id="qing_image_'+5640+i+'" style="display: inline;"></a><div class="thumb_but" style="display: none;"><a onclick="Sys.loveQing('+5640+i+', true);" class="like" href="javascript:void(0);">9</a></div></div><div class="con"><div class="pl"><div class="user_pn"><a rel="测试员" href="javascript:void(0);" title="测试员"><img alt="测试员" title="测试员" src="<%=request.getContextPath()%>/upimg/11.jpg"></a></div><div class="text" rel="beautbeau"><span class="c_tx" title="测试员">测试员</span>:</div></div><div class="bottom clear"><a onclick="Sys.loveQing('+5640+i+');" class="like f-r" href="javascript:void(0);"><i class="c_tx">++1</i><span>9</span></a></div></div></div>';
                        info+="<div style='left:371px;top:"+i/3*571+"px;' class='single' id='a-qing-wp-5640'><div onmouseover='Sys.showQingLove(5640,$(this));' style='width:310:px;height:465px' class='thumb-wrap' on='0'><a target='_blank' href='pic_detail.html?25-5640' class='thumb' title='点击查看详细'><img width='310' height='465' alt='背景图片' src='<%=request.getContextPath()%>"+photo[i].picurl+"' class='qimg'  id='qing_image_5640' style='display: inline;'></a><div class='thumb_but' style='display: none;'><a onclick='Sys.loveQing(5640, true);' class='like' href='javascript:void(0);'>"+photo[i].topiczancount+"</a></div></div><div class='con'><div class='pl'><div class='user_pn'><a rel='叫醒闹钟' href='javascript:void(0);' title='叫醒闹钟'><img alt='叫醒闹钟' title='叫醒闹钟' src='/images/head_10001_4c59b035cf_100.jpg'></a></div><div class='text' rel='beautbeau'><span class='c_tx' title='叫醒闹钟'>叫醒闹钟</span>:"+photo[i].topicnr+"</div></div><div class='bottom clear'><a onclick='dianzan("+photo[i].id+");' class='like f-r' href='javascript:void(0);'><i class='c_tx'>++1</i><span>"+photo[i].topiczancount+"</span></a></div></div></div>"
                        count=2;
                    }else if(count==2){
                       // info+='<div style="left:742px;top:'+(i-2)/3*571+'px;" class="single" id="a-qing-wp-'+5640+i+'"><div onmouseover="Sys.showQingLove('+5640+i+',$(this));" style="width:310:px;height:465px" class="thumb-wrap" on="0"><a target="_blank" href="pic_detail.html?25-'+5640+i+'" class="thumb" title="点击查看详细"><img width="310" height="465" alt="背景图片" src="<%=request.getContextPath()%>'+photo[i].picurl+'" class="qimg"  id="qing_image_'+5640+i+'" style="display: inline;"></a><div class="thumb_but" style="display: none;"><a onclick="Sys.loveQing('+5640+i+', true);" class="like" href="javascript:void(0);">9</a></div></div><div class="con"><div class="pl"><div class="user_pn"><a rel="测试员" href="javascript:void(0);" title="测试员"><img alt="测试员" title="测试员" src="<%=request.getContextPath()%>/upimg/12.jpg"></a></div><div class="text" rel="beautbeau"><span class="c_tx" title="测试员">测试员</span>:</div></div><div class="bottom clear"><a onclick="Sys.loveQing('+5640+i+');" class="like f-r" href="javascript:void(0);"><i class="c_tx">++1</i><span>9</span></a></div></div></div>';
                        info+="<div style='left:742px;top:"+(i-2)/3*571+"px;' class='single' id='a-qing-wp-5640'><div onmouseover='Sys.showQingLove(5640,$(this));' style='width:310:px;height:465px' class='thumb-wrap' on='0'><a target='_blank' href='pic_detail.html?25-5640' class='thumb' title='点击查看详细'><img width='310' height='465' alt='背景图片' src='<%=request.getContextPath()%>"+photo[i].picurl+"' class='qimg'  id='qing_image_5640' style='display: inline;'></a><div class='thumb_but' style='display: none;'><a onclick='Sys.loveQing(5640, true);' class='like' href='javascript:void(0);'>"+photo[i].topiczancount+"</a></div></div><div class='con'><div class='pl'><div class='user_pn'><a rel='叫醒闹钟' href='javascript:void(0);' title='叫醒闹钟'><img alt='叫醒闹钟' title='叫醒闹钟' src='/images/head_10001_4c59b035cf_100.jpg'></a></div><div class='text' rel='beautbeau'><span class='c_tx' title='叫醒闹钟'>叫醒闹钟</span>:"+photo[i].topicnr+"</div></div><div class='bottom clear'><a onclick='dianzan("+photo[i].id+");' class='like f-r' href='javascript:void(0);'><i class='c_tx'>++1</i><span>"+photo[i].topiczancount+"</span></a></div></div></div>"
                        count=0
                    }
                }
                $("#pic-list").html(info);
            },
            error:function (){
                alert("查询倾听世界所有图片出错,请检查程序或者网络");
            }
        });
    }

    //点赞
    function dianzan(cid){
        $.ajax({
            url:"/top/updatezanById?id="+cid,
            type:"post",
            success:function (data){
                location.reload();
            },
            error:function (){
                alert("点赞时出错了")
            }
        })
    }
</script>
</body>
</html>