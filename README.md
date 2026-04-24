# 🐾 PetHouse 智能宠物领养平台

一个集智能匹配推荐、3D 模型展示、论坛社区于一体的现代化宠物领养平台，包含用户端与管理后台两套系统。

---

## ✨ 核心特性

### 🤖 智能推荐算法
基于用户画像与宠物属性的多维度匹配引擎：用户填写居住环境、生活习惯、偏好特征后，系统通过加权评分算法计算每只宠物与用户的匹配度，实现精准推荐，帮助宠物找到最合适的家庭。

### 🐶 3D 宠物模型展示
引入 WebGL 技术，在宠物详情页支持交互式 3D 模型预览。用户可对宠物模型进行旋转、缩放操作，相比传统 2D 图片提供更直观的视觉体验，支持 `.glb` 格式模型文件。

### 🌐 WebGL 渲染引擎
基于 WebGL（Web Graphics Library）标准实现浏览器端 3D 渲染，无需安装任何插件，通过 GPU 加速实现流畅的模型展示效果，是 Web 端沉浸式宠物展示体验的核心支撑。

### 📋 完整领养闭环
捐赠申请 → 管理员审核 → 上架领养列表 → 用户申请领养 → 管理员审核 → 完成领养，全流程线上化管理。

### 💬 宠物社区论坛
用户可分享养宠经验、发帖互动，配合评论系统构建活跃的宠物爱好者社区。

---

## 🏗️ 系统架构

```
┌─────────────────┐    ┌─────────────────┐
│   用户端前端      │    │   管理后台前端    │
│  Vue 2 + Element │    │ Vue 3 + Element+ │
│  localhost:8080  │    │  localhost:8082  │
└────────┬────────┘    └────────┬────────┘
         │                      │ /dev-api/*
         │ HTTP                 │ nginx proxy
         ▼                      ▼
┌─────────────────┐    ┌─────────────────┐
│   用户端后端      │    │   管理端后端     │
│  Spring Boot 17  │    │ Spring Boot 2.5  │
│  localhost:8081  │    │  localhost:8085  │
└────────┬────────┘    └────────┬────────┘
         │                      │
         └──────────┬───────────┘
                    ▼
         ┌─────────────────────┐
         │       MySQL 8.0      │
         │    + Redis 7         │
         └─────────────────────┘
```

---

## 🚀 Docker 一键部署

### 前置要求

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) 已安装并运行
- 至少 4GB 可用内存

### 部署步骤

**第一步：克隆项目**

```bash
git clone <仓库地址>
cd pet_main
```

**第二步：一键启动所有服务**

```bash
docker compose up -d --build
```

> 首次运行需要拉取镜像并编译，约需 5~15 分钟，请耐心等待。

**第三步：等待服务就绪**

```bash
# 查看所有容器状态
docker compose ps

# 查看启动日志（Ctrl+C 退出）
docker compose logs -f
```

所有服务状态变为 `running` 后即可访问。

### 访问地址

| 服务 | 地址 | 说明 |
|------|------|------|
| 用户端 | http://localhost:8080 | 宠物领养平台主页 |
| 管理后台 | http://localhost:8082 | 管理员操作界面 |
| 用户后端 API | http://localhost:8081 | |
| 管理后端 API | http://localhost:8085 | |

### 管理后台账号

| 账号 | 密码 |
|------|------|
| admin | admin123 |

---

## 🛠️ 常用命令

```bash
# 启动所有服务
docker compose up -d

# 停止所有服务
docker compose down

# 重新构建并启动（代码更新后）
docker compose up -d --build

# 查看某个服务的日志
docker compose logs -f user-backend
docker compose logs -f admin-backend

# 查看所有容器状态
docker compose ps

# 进入 MySQL 容器
docker exec -it pet-mysql mysql -uroot -p123456 pet

# 清除所有数据（包括数据库数据）重新初始化
docker compose down -v
docker compose up -d --build
```

---

## 📁 项目结构

```
pet_main/
├── docker-compose.yml          # Docker 编排配置
├── init.sql                    # 数据库初始化脚本
├── README.md
├── users/
│   ├── petz/                   # 用户端后端（Spring Boot + Java 17）
│   │   └── Dockerfile
│   └── pet_house-main/         # 用户端前端（Vue 2）
│       ├── Dockerfile
│       └── nginx.conf
└── background/
    ├── pet_m/                  # 管理端后端（Spring Boot + Java 8）
    │   └── Dockerfile
    └── RuoYi-Vue_master/       # 管理端前端（Vue 3 + Vite）
        ├── Dockerfile
        └── nginx.conf
```

---

## ⚠️ 注意事项

- 图片上传功能在 Docker 环境下存储在容器内，容器删除后上传的图片会丢失。预置的宠物图片（c1、c2、c4、c5、c6、t1）已内置在前端镜像中，不受影响。
- 如需在 Docker 中保留上传图片，可在 `docker-compose.yml` 中为两个后端服务添加共享卷挂载。
- 首次启动时 MySQL 需要时间初始化数据，后端服务会自动等待 MySQL 就绪后再启动。

---

## 💻 本地开发启动（非 Docker）

**需要提前启动 Redis：**
```bash
D:\environment\Redis-x64-3.0.504\redis-server.exe
```

**用户端后端：**
```bash
cd users/petz
mvn spring-boot:run
```

**用户端前端：**
```bash
cd users/pet_house-main
npm run serve
```

**管理端后端：**
```bash
cd background/pet_m
mvn install -DskipTests
cd pet-admin
mvn spring-boot:run
```

**管理端前端：**
```bash
cd background/RuoYi-Vue_master
npm run dev
```
