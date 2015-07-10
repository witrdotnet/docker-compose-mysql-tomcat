# docker-compose-mysql-tomcat
docker compose mysql and tomcat model

# before build

- download your application war artifact rename it "app.war" and put it in service-app/
- edit service-dbsetup/scripts.sql and write your sql commands

# build with docker-compose

```
docker-compose build
```

# run app

```
docker-compose run app
```
