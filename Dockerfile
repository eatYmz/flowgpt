# 使用官方的 Node.js 镜像
FROM node:18-slim

# 设置工作目录
WORKDIR /app

# 复制项目的 package.json 和 yarn.lock 文件到工作目录中
COPY package.json yarn.lock ./

# 安装项目依赖
RUN yarn install --frozen-lockfile

# 复制项目的所有文件到工作目录中
COPY . .

# 确保使用的 .env.local 文件被正确设置
COPY env.template .env.local

# 设置环境变量（通过 Coolify 注入）
ENV OPENAI_API_KEY=${OPENAI_API_KEY}

# 暴露应用程序的端口
EXPOSE 3008

# 启动应用程序
CMD ["yarn", "dev"]
