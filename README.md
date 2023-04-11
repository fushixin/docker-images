# 项目运行环境

<a herf='https://github.com/fushixin/docker-images'>GitHub仓库</a>

## 1. MySQL

### docker-compose-mysql.yml

```
version: '3.9'

services:
  mysql:
    image: 'mysql:8.0.32'
    container_name: mysql
    command:
      --default-authentication-plugin=mysql_native_password
      --character-set-server=utf8mb4
      --collation-server=utf8mb4_general_ci
      --lower_case_table_names=1                        # 忽略大小写
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root                         # root用户登录密码
      MYSQL_USER: root                                  # 登录用户
      MYSQL_PASS: root                                  # 登录密码
      TZ: Asia/Shanghai                                 # 时区
    volumes:
      - d:/db/mysql/data:/var/lib/mysql                 # 挂载数据
      - d:/db/mysql/conf/my.cnf:/etc/mysql/my.cnf       # 挂载配置文件
    ports:
      - '3306:3306'
```

### run

```
docker-compose -f docker-compose-mysql.yml up -d
```

## 2. Redis

### docker-compose-redis.yml

```
version: '3.9'

services:
  redis:
    image: 'redis:7.0.10-alpine'
    container_name: redis
    restart: always
    ports:
      - '6379:6379'
```

### run

```
docker-compose -f docker-compose-redis.yml up -d
```

## 3. ActiveMQ

### docker-compose-activemq.yml

```
version: '3.9'

services:
  activemq:
    image: 'fushixin/activemq:5.16.6'
    container_name: activemq
    restart: always
    ports:
      - '1099:1099'
      - '1883:1883'
      - '8161:8161'
```

### run

```
docker-compose -f docker-compose-activemq.yml up -d
```

## 4. Zookeeper

### docker-compose-zookeeper.yml

```
version: '3.9'

services:
  image: 'bitnami/zookeeper:latest'
    container_name: zookeeper
    restart: always
    environment:
      - ALLOW_ANONYMOUS_LOGIN=yes
    ports:
      - '2181:2181'
```

### run

```
docker-compose -f docker-compose-zookeeper.yml up -d
```

## 5. Kafka

### docker-compose-kafka.yml

```
version: '3.9'

services:
  kafka:
    image: 'bitnami/kafka:latest'
    container_name: kafka
    restart: always
    environment:
      - KAFKA_BROKER_ID=1
      - KAFKA_CFG_LISTENERS=PLAINTEXT://:9092
      - KAFKA_CFG_ADVERTISED_LISTENERS=PLAINTEXT://127.0.0.1:9092
      - KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper:2181
      - ALLOW_PLAINTEXT_LISTENER=yes
    ports:
      - '9092:9092'
    depends_on:
      - zookeeper
```

### run

```
docker-compose -f docker-compose-kafka.yml up -d
```