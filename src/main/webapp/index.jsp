<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>医院</title>
    <meta http-equiv="X-UA-Compatible" content="IE=9">
    <script src="./js/hm.js"></script>
    <script type="text/javascript" src="./js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="./js/jquery.smooth-scroll.min.js"></script>
    <script type="text/javascript" src="./js/unslider.min.js"></script>
    <script type="text/javascript" src="./js/utility.js"></script>
    <link rel="stylesheet" media="screen" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $('.banner').unslider({
                speed: 2000,
                delay: 10000,
                dots: true
            });
            var n = $('.dot');
            for (var i = 0; i < n.length; i++) {
                if (document.all) {
                    n[i].innerText = i + 1;
                } else {
                    n[i].textContent = i + 1;
                }
            }
            ;
        });
    </script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $('.banner2').unslider({
                speed: 1000,
                delay: 5000,
                dots: true
            });
            var n = $('.dot2');
            for (var x = 0; x < n.length; x++) {
                if (document.all) {
                    n[i].innerText = x + 1;
                } else {
                    n[i].textContent = x + 1;
                }
            }
            ;
        });
        var formValue = {
            cd: function (ele) {
                if (ele.value == ele.defaultValue) {
                    ele.value = "";
                }
            },
            rd: function (ele) {
                if (ele.value.replace(/\s+/g, '') == "") {
                    ele.value = ele.defaultValue;
                }
            }
        }
    </script>
    <script>
        $(function () {
            if (${loginDoctor == null }){
                $("#login").css("display","block");
            }else {
                $("#welcome").css("display","block");
            }

        })
    </script>
</head>
<body style="">

<script type="text/javascript" src="./imgs/index.js"></script>

<div id="top">
    <div class="content" >
        <img src="imgs/logo.png" height="150px" width="560px">
        <div class="right">
            <div class="links" id="login" style="display: none">
                　<a href="login.jsp">登入</a>
                　<a href="/doctorregister.jsp">注册</a>
            </div>
            <div class="links" id="welcome" style="display: none">
                欢迎您${loginDoctor.name}医生&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="/loginOutServlet">退出</a>
            </div>
            <div id="search">
                <form method="post"  id="ctl00">
                    <input id="txtKey" name="q" class="input" type="text"  maxlength="15"
                           onfocus="formValue.cd(this)" onblur="formValue.rd(this)">
                    <input class="go" type="submit" value="">
                </form>
            </div>
        </div>
    </div>
</div>


<div id="menu">
    <div id="nav" role="navigation">
        <ul>

            <li>
                <a href="">网站首页</a>
            </li>

            <li class="has-sub">
                <a href="">就医入口</a>
                <ul>
                    <li>
                        <a href="">预约挂号</a>
                    </li>
                    <li>
                        <a href="">健康管理中心</a>
                    </li>
                    <li>
                        <a href="" >医疗文书校验服务</a>
                    </li>
                    <li>
                        <a href="">导医信息</a>
                    </li>
                    <li>
                        <a href="" >专家门诊</a>
                    </li>
                    <li>
                        <a href="" >普通及专病门诊 </a>
                    </li>
                    <li>
                        <a href="" >门诊出停诊信息查询 </a>
                    </li>
                    <li>
                        <a href="">交通指南</a>
                    </li>
                </ul>
            </li>

            <li class="has-sub">
                <a href="">学科及专家</a>
                <ul>
                    <li>
                        <a href="">学科及专家介绍</a>
                    </li>
                </ul>
            </li>

            <li class="has-sub">
                <a href="">科学研究</a>
                <ul>
                    <li>
                        <a href="">科研处</a>
                    </li>
                    <li>
                        <a href="">科研信息</a>
                    </li>
                    <li>
                        <a href="">临床医学研究院</a>
                    </li>
                    <li>
                        <a href="" >临床医学杂志编辑部</a>
                    </li>
                </ul>
            </li>

            <li class="has-sub">
                <a href="">医学教育</a>
                <ul>
                    <li>
                        <a href="" >教育处首页</a>
                    </li>
                    <li>
                        <a href="" >本科生教育</a>
                    </li>
                    <li>
                        <a href="" >研究生教育</a>
                    </li>
                    <li>
                        <a href="" >住院医生培养</a>
                    </li>
                    <li>
                        <a href="" >专科医生培养</a>
                    </li>
                    <li>
                        <a href="" >进修教育</a>
                    </li>
                    <li>
                        <a href="" >继续医学教育</a>
                    </li>
                    <li>
                        <a href="" >远程医学</a>
                    </li>
                    <li>
                        <a href="" >教学学术会议</a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="">人才招聘</a>
            </li>

            <li class="has-sub">
                <a href="">医院信息</a>
                <ul>
                    <li>
                        <a href="">办公管理平台</a>
                    </li>
                    <li>
                        <a href="">新OA系统</a>
                    </li>
                    <li>
                        <a href="" >闽江医院报</a>
                    </li>
                    <li>
                        <a href="">院史考据</a>
                    </li>
                    <li>
                        <a href="">医院手机App(安卓版)</a>
                    </li>
                    <li>
                        <a href="">医院手机App下载</a>
                    </li>
                    <li>
                        <a href="">媒体视点</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>


<div class="banner has-dots" style="overflow: hidden; width: 100%; height: 400px">
    <ul style="width: 600%; position: relative; left: -100%; height: 400px;">



        <li title="手术中" style="width: 16.6667%;">

            <img src="./imgs/20170103112224153.jpg" width="1280" height="400">

        </li>

        <li title="外景" style="width: 16.6667%;">

            <img src="./imgs/201701250831103109.jpg" width="1280" height="400">

        </li>


        <li title="手术室" style="width: 16.6667%;">

            <img src="./imgs/201701031120535219.jpg" width="1280" height="400">

        </li>

        <li title="特需服务" style="width: 16.6667%;">

            <img src="./imgs/201701031120014106.jpg" width="1280" height="400">

        </li>

        <li title="门诊室" style="width: 16.6667%;">

            <img src="./imgs/201701040838419015.jpg" width="1280" height="400">

        </li>

        <li title="门诊" style="width: 16.6667%;">

            <img src="./imgs/201803120334407943.jpg" width="1280" height="400">

        </li>

        <li title="" style="width: 16.6667%;">

            <img src="./imgs/201701031120014107.jpg" width="1280" height="400">

        </li>


    </ul>
    <!--<ol class="dots">-->
    <!--<li class="dot">1</li>-->
    <!--<li class="dot active">2</li>-->
    <!--<li class="dot">3</li>-->
    <!--<li class="dot">4</li>-->
    <!--<li class="dot">5</li>-->
    <!--<li class="dot">6</li>-->
    <!--</ol>-->
</div>


<div class="content">
    <div class="clear" style="height:50px"></div>
    <div class="title green left">新闻</div>
    <div class="right more"><a >更多&gt;&gt;</a></div>
    <div class="clear" style="height:30px"></div>
    <div style="width:450px;float:left">
        <img src="imgs/201904220405527462.jpg" width="450px" height="275px">
    </div>
    <ul class="news list" style="list-style: circle inside none;width:495px;float:right;">

        <li class="even" style="width:100%;">
            <a  href="" title="西医院士再倡“西学中”，主张中西医并重、互补 汤钊猷院士《西学中，创中国新医学》新书出版座谈会举行" style="padding-left: 30px;">西医院士再倡“西学中”，主张中西医并重、互补 汤钊猷院士《...</a>
        </li>

        <li class="even" style="width:100%;">
            <a  href="" title="“健康扶贫”接力再出发 ——记复旦大学附属中山医院第六批援藏医疗队" style="padding-left: 30px;">“健康扶贫”接力再出发 ——记复旦大学附属中山医院第六批援...</a>
        </li>

        <li class="even" style="width:100%;">
            <a href="" title="“大国工匠”内镜“超微创”屡破记录：打通生命“最难通道”" style="padding-left: 30px;">“大国工匠”内镜“超微创”屡破记录：打通生命“最难通道”</a>
        </li>

        <li class="even" style="width:100%;">
            <a  href="" title="长风十年：900+临床表型数据、近1万生物学标本、6600+人群基线数据库！" style="padding-left: 30px;">长风十年：900+临床表型数据、近1万生物学标本、6600...</a>
        </li>

        <li class="even" style="width:100%;">
            <a  href="" title="图片新闻" style="padding-left: 30px;">图片新闻</a>
        </li>

        <li class="even" style="width:100%;">
            <a  href="" title="春回大地暖人心，雷锋精神再出发"
                style="padding-left: 30px;">春回大地暖人心，雷锋精神再出发</a>
        </li>

        <li class="even" style="width:100%;">
            <a  href="" title="凝聚爱的力量 提高患者生活质量 第四届“中国血小板日”活动在我院举行"
                style="padding-left: 30px;">凝聚爱的力量 提高患者生活质量 第四届“中国血小板日”活动...</a>
        </li>

        <li class="even" style="width:100%;">
            <a  href="" title="全球首台全景动态PET-CT成像系统落户复旦大学附属中山医院"
                style="padding-left: 30px;">全球首台全景动态PET-CT成像系统落户复旦大学附属中山医院</a>
        </li>

        <li class="even" style="width:100%;">
            <a  href="" title="国人自主研发的世界首个经心尖二尖瓣夹合器进入上市前临床研究"
                style="padding-left: 30px;">国人自主研发的世界首个经心尖二尖瓣夹合器进入上市前临床研究</a>
        </li>

        <li class="even" style="width:100%;">
            <a href=""  title="中国科学院院士国际知名肝肿瘤外科专家樊嘉院士名医工作室在复旦中山厦门医院揭牌成立"
               style="padding-left: 30px;">中国科学院院士国际知名肝肿瘤外科专家樊嘉院士名医工作室在复...</a>
        </li>

        <li class="even" style="width:100%;">
            <a href="" title="热烈祝贺我院检验科潘柏申教授获评 2018年度上海市市长质量奖（个人）称号！"
               style="padding-left: 30px;">热烈祝贺我院检验科潘柏申教授获评
                2018年度上海市市长质...</a>
        </li>


    </ul>
</div>

<div class="clear" style="height:50px"></div>
<div class="hr"></div>



<div class="content">
    <div class="clear" style="height:50px"></div>
    <div class="title">患者通道</div>
    <div style="height:30px"></div>

    <table border="0" cellpadding="0" cellspacing="0" height="200">
        <tbody>
        <tr>

            <td width="300"><a href="./register.jsp" class="customtext">
                <div class="block"
                     style="background-color:#c5948e; ">

                    <span class="glyphicon glyphicon-pencil" style="color: white;font-size: 100px;margin:30px 100px;"></span>
                    <font style="color: white;font-size: 30px;font-weight: bold;margin-left: 90px;margin-top: -20px;position: absolute">预约挂号</font>

                </div>

            </a></td>
            <td width="30"></td>

            <td width="300"><a href="./patientsearch.jsp">
                <div class="block"
                     style="background-color:#9cacd2;">

                    <span class="glyphicon glyphicon-search" style="color: white;font-size: 100px;margin:30px 100px;"></span>
                    <font style="color: white;font-size: 30px;font-weight: bold;margin-left: 90px;margin-top: -20px;position: absolute">费用查询</font>

                </div>
            </a></td>
            <td width="30"></td>

            <td width="300"><a href="./patientrecharge.jsp">
                <div class="block"
                     style="background-color:#c5b8a6; ">

                    <span class="glyphicon glyphicon-credit-card" style="color: white;font-size: 100px;margin:30px 100px;"></span>
                    <font style="color: white;font-size: 30px;font-weight: bold;margin-left: 90px;margin-top: -20px;position: absolute">交费助手</font>

                </div>
            </a></td>

        </tr>
        </tbody>
    </table>
</div>

<div class="clear" style="height:50px"></div>
<div class="hr"></div>

<div class="content">
    <div class="clear" style="height:50px"></div>
    <div class="title orange">医护通道</div>
    <div style="height:30px"></div>

    <table border="0" cellpadding="0" cellspacing="0" height="200">
        <tbody>
        <tr>

            <td width="300"><a href="/findPatientByPageServlet">
                <div class="block"
                     style="background-color:#3c83bf;">
                    <span class="glyphicon glyphicon-user" style="color: white;font-size: 100px;margin:30px 100px;"></span>
                    <font style="color: white;font-size: 30px;font-weight: bold;margin-left: 90px;margin-top: -20px;position: absolute">患者管理</font>
                </div>
            </a></td>
            <td width="30"></td>

            <td width="300"><a href="/financialServlet">
                <div class="block"
                     style="background-color:#f58d27;">
                    <span class="glyphicon glyphicon-credit-card" style="color: white;font-size: 100px;margin:30px 100px;"></span>
                    <font style="color: white;font-size: 30px;font-weight: bold;margin-left: 90px;margin-top: -20px;position: absolute">财务报表</font>

                </div>
            </a></td>
            <td width="30"></td>

            <td width="300"><a href="">
                <div class="block"
                     style="background-color:#5ca696">
                <span class="glyphicon glyphicon-wrench" style="color: white;font-size: 100px;margin:30px 100px;"></span>
                <font style="color: white;font-size: 30px;font-weight: bold;margin-left: 90px;margin-top: -20px;position: absolute">待开发...</font>

                </div>
            </a></td>

        </tr>
        </tbody>
    </table>
</div>

<div class="clear" style="height:50px"></div>
<div class="hr"></div>

<div class="content">
    <div class="clear" style="height:50px"></div>
    <div class="title cyan">医院信息</div>
    <div style="height:30px"></div>

    <table border="0" cellpadding="0" cellspacing="0" height="200" class="cyan">
        <tbody>
        <tr>

            <td width="300"><a href="">
                <div class="block"
                     style="background-color:#c5b8a6; background-image:url(./imgs/home_block_3-1.png)"></div>
            </a></td>
            <td width="30"></td>

            <td width="300"><a href="">
                <div class="block"
                     style="background-color:#585fa9; background-image:url(./imgs/home_block_3-2.png)"></div>
            </a></td>
            <td width="30"></td>

            <td width="300"><a href="">
                <div class="block"
                     style="background-color:#d0b6a7; background-image:url(./imgs/home_block_2-3.png)"></div>
            </a></td>

        </tr>
        </tbody>
    </table>
</div>

<div class="clear" style="height:50px"></div>
<div class="hr"></div>

<div class="content">
    <div class="clear" style="height:50px"></div>
    <table border="0" cellpadding="0" cellspacing="0">
        <tbody>
        <tr>

            <td width="455" valign="top">
                <div class="title green left">中山信息</div>
                <div class="right more"><a href="">更多&gt;&gt;</a>
                </div>
                <div class="clear" style="height:30px"></div>
                <ul class="block-list">

                    <li><a title="中山故事" href="" target="_blank"
                           style="padding-left: 10px;">医院故事</a></li>

                    <li><a title="新OA系统" href="" target="_blank"
                           style="padding-left: 10px;">新系统</a></li>

                    <li><a title="中山手机App下载" href=""
                           target="_blank" style="padding-left: 10px;">医院手机App下载</a></li>

                    <li><a title="中山手机App(安卓版)" href=""
                           target="_blank" style="padding-left: 10px;">医院手机App(安卓版)</a></li>

                    <li><a title="院史考据" href="" target="_blank"
                           style="padding-left: 10px;">院史考据</a></li>


                </ul>
            </td>
            <td width="50"></td>

            <td width="455" valign="top">
                <div class="title left">党工团建设</div>
                <div class="right more"></div>
                <div class="clear" style="height:30px"></div>
                <ul class="block-list">

                    <li><a href="" target="_blank">党建</a></li>

                    <li><a href="" target="_blank">工会</a></li>

                    <li><a href="" target="_blank">团委</a></li>

                    <li><a href="" target="_blank">红十字宣传栏</a></li>

                </ul>
            </td>

        </tr>
        </tbody>
    </table>
</div>




<div class="clear" style="height:50px"></div>
<div class="hr"></div>


<div class="clear" style="height:50px"></div>


<script type="text/javascript" src="./imgs/index(1).js"></script>
<div id="footer" style="height:225px;">
    <div class="content unselectable">
        <div class="left" style="width:390px">
            <table>
                <tbody>
                <tr>
                    <td colspan="2" height="10"></td>
                </tr>
                <tr>
                    <td width="60"><img src="./imgs/logo_bottom.png"></td>
                    <td>
                        <div>
                            <small>&#169; 2019  闽江学院</small>
                        </div>
                        <div style="height:5px"></div>
                        <div><a href="" target="_blank">人大代表信箱</a>　|　<a
                                href="">行风监督信箱</a></div>
                    </td>
                    <td width="80">
                        <div style="width:80px;height:60px;margin-top:-20px;">
            <span id="aaaa"><a
                    href=""
                    target="_blank">
              <img id="imgConac" vspace="0" hspace="0" border="0" src="./imgs/blue.png" data-bd-imgshare-binded="1"></a>
            </span>
                            <script src="./imgs/CA020000000609260600003.js" type="text/javascript"></script>
                            <span id="bbbb"></span></div>
                    </td>
                </tr>
                </tbody>
            </table>
            <div style="height:10px"></div>
            <div>
                <small>地址：福建省福州市闽侯县上街镇溪源宫路200号　|　邮编：350108</small>
            </div>
            <div>
                <small>电话：233-3333333333</small>
            </div>
            <div>
                <small>3177102146   陈智彬</small>
            </div>
            <div>
                <small><a href="" >闽ICP备05005466号 </a>　
                    <a ><img src="./imgs/ba.png"> 闽公网安备 35012102500037号 </a></small>
            </div>
        </div>
        <div class="right">
            <div>
                <div><b>友情链接</b></div>
                <div><a href="" >闽江学院主站</a></div>
                <div><a href="" >闽江学院高考分数线_招生信息</a></div>

                <div><a href="" >闽江学院教务管理系统</a></div>
                <div><a href="" >闽江学院招生办</a></div>
                <div><a href="" >闽江学院图书馆</a></div>
            </div>
            <div>
                <div><b>&nbsp;</b></div>
                <div><a href="">福建省立医院</a></div>
                <div><a href="">福建医科大学第一附属医院</a></div>
                <div><a href="">福建协和医院</a></div>
                <div><a href="">福建中医药大学附属人民医院</a></div>
            </div>
        </div>
    </div>
</div>


</body>
</html>