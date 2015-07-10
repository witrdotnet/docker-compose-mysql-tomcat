#
# app
#

FROM tomcat:6

ENV DEFAULT_WAR_URL=https://nexus.witr.net/content/groups/public/net/witr/app/1.0.0/
ENV DEFAULT_WAR_NAME=app-1.0.0.war
ENV FAKE_WAR_NAME=appFAKE.war
ENV DEPLOY_WAR_NAME=app.war

COPY ./app*.war /tmp/
RUN \
  rm /tmp/$FAKE_WAR_NAME && \
  if [ -f /tmp/$DEPLOY_WAR_NAME ]; then \
    echo "use provided $DEPLOY_WAR_NAME"; \
    mv /tmp/$DEPLOY_WAR_NAME /usr/local/tomcat/webapps/$DEPLOY_WAR_NAME; \
  else \
    echo "download $DEFAULT_WAR_NAME from $DEFAULT_WAR_URL"; \
    wget $DEFAULT_WAR_URL$DEFAULT_WAR_NAME; \
    mv $DEFAULT_WAR_NAME /usr/local/tomcat/webapps/$DEPLOY_WAR_NAME; \
  fi

COPY ./start-app.sh /root/start-app.sh

CMD ["/root/start-app.sh"]
