后端结构展示：
 |-src
    |- main
       |-java
          |-com.ee   包名
             |-pet  总类名
                |-common   常用类
	|-component   组件
	|-config   配置类
	|-controller  控制层
	   |-Display  宠物展示
	   |-Forum   宠物论坛
	   |-Head     个人中心
	   |-Match
	      |-MathchingController 智能匹配算法
	      |-TestController   ai大模型
	   |-UploadController 下载处理中心
	   |-UsersController   用户逻辑处理
	|-entity   实体类
	|-filter   过滤器
	|-listenr   监听器
	|-mapper   数据访问层
	|-service   业务逻辑层
	|-task   定时任务
	|-utils   常用方法类
             |-PetzApplication   启动中心
       |-resource   资源
          |-mapper 数据访问层
          |-application.yaml   配置中心