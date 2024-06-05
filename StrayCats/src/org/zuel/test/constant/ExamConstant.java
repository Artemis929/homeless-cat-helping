package org.zuel.test.constant;

public class ExamConstant {
    //登陆类型
    public static final String LOGIN_TYPE_VOLUNTEER="0";
    public static final String LOGIN_TYPE_MANAGER="1";

    //会话变量
    public static final String SESSION_LOGIN_TYPE="loginType";
    public static final String SESSION_LOGIN_USER="user";//保持用户的登陆状态
    public static final String SESSION_LOGIN_ID="id";//保持用户的登陆状态
    public static final String SESSION_MANAGER_AREA="area";
    //public static final String SESSION
    //跳转页面
    public static final String HOME_PAGE_LOGIN="./login.jsp";
    public static final String HOME_PAGE_REGISTER="./register.jsp";
    public static final String HOME_PAGE_INDEXNo="./index.html";
    //public static final String HOME_PAGE_INDEXYes="./index.jsp";
    //Volunteer的相关界面l
    public static final String HOME_PAGE_CatList="./User/catlist.jsp";
    public static final String HOME_PAGE_FeedRecord="./FeedRecord.html";
    public static final String HOME_PAGE_HomeList="./HomeList.jsp";
    public static  final String HOME_PAGE_CatListFeed="./CatList_Feed.html";
    public static final String HOME_PAGE_CatListHouse="./CatList_House.html";
    public static final  String HOME_PAGE_HomeUser="./homeUser.jsp";
    public static final String HOME_PAGE_NeuterApplication="./NeuterApplication.html";

    //Manager的相关界面
    public static final String HOME_PAGE_CatAdd="./catAdd.html";
    public static final String HOME_PAGE_CatDelete="./catDelete.html";
    public static final String HOME_PAGE_CatManager="./catManager.html";
    public static final String HOME_PAGE_CatModify="./catModify.html";
    public static final String HOME_PAGE_CatSearch="./catSearch.html";
    public static final String HOME_PAGE_CheckApplication="./CheckApplication.html";
    public static final String HOME_PAGE_HomeManager="./homeManager.html";
    public static final String HOME_PAGE_HouseAdd="./houseAdd.html";
    public static final String HOME_PAGE_HouseDelete="./houseDelete.html";
    public static final String HOME_PAGE_HouseList="./houseList.html";
    public static final String HOME_PAGE_HouseModify="./houseModify.html";
}
