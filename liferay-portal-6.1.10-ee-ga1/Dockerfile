FROM marceloagmelo/tomcat:7
MAINTAINER Marcelo Melo <marceloagmelo@gmail.com>

ENV TOMCAT_VER=apache-tomcat-7.0.69
ENV LIFERAY_WAR=liferay-portal-6.1.10-ee-ga1-20120223174854827
ENV LIFERAY_LIB=liferay-portal-src-6.1.10-ee-ga1/lib
ENV LIFERAY_LIB_DEP=liferay-portal-dependencies-6.1.10-ee-ga1
ENV LIFERAY_BASE=/opt
ENV LIFERAY_HOME=${LIFERAY_BASE}/liferay
ENV TOMCAT_HOME=${LIFERAY_BASE}/${TOMCAT_VER}

RUN (mkdir ${LIFERAY_HOME})

WORKDIR ${LIFERAY_HOME}/

RUN (sudo chown root:root ${LIFERAY_HOME})

# Dependencies
ADD ${LIFERAY_LIB_DEP}/* ${TOMCAT_HOME}/lib/ext/

# Libs
ADD ${LIFERAY_LIB}/development/activation.jar ${TOMCAT_HOME}/lib/ext/
ADD ${LIFERAY_LIB}/development/jms.jar ${TOMCAT_HOME}/lib/ext/
ADD ${LIFERAY_LIB}/development/jta.jar ${TOMCAT_HOME}/lib/ext/
ADD ${LIFERAY_LIB}/development/jutf7.jar ${TOMCAT_HOME}/lib/ext/
ADD ${LIFERAY_LIB}/development/mail.jar ${TOMCAT_HOME}/lib/ext/
ADD ${LIFERAY_LIB}/development/persistence.jar ${TOMCAT_HOME}/lib/ext/
ADD ${LIFERAY_LIB}/portal/ccpp.jar ${TOMCAT_HOME}/lib/ext/

RUN mkdir -p ${TOMCAT_HOME}/temp/liferay/com/liferay/portal/deploy/dependencies

ADD ${LIFERAY_LIB}/development/resin.jar ${TOMCAT_HOME}/temp/liferay/com/liferay/portal/deploy/dependencies/
ADD ${LIFERAY_LIB}/development/script-10.jar ${TOMCAT_HOME}/temp/liferay/com/liferay/portal/deploy/dependencies/

# install jra.jar
ADD lib/jta-3.1.2.2.jar ${TOMCAT_HOME}/lib/ext/

# add setenv.sh
ADD setenv.sh ${TOMCAT_HOME}/bin/setenv.sh

# add ROOT.xml
RUN mkdir -p ${TOMCAT_HOME}/conf/Catalina/localhost
ADD ROOT.xml ${TOMCAT_HOME}/conf/Catalina/localhost/ROOT.xml

ADD catalina.properties /tmp/catalina.properties
RUN mv /tmp/catalina.properties ${TOMCAT_HOME}/conf/catalina.properties
ADD server.xml /tmp/server.xml
RUN mv /tmp/server.xml ${TOMCAT_HOME}/conf/server.xml

# cleanup default tomcat
RUN (cd ${TOMCAT_HOME}/webapps/ROOT/ &&\
        rm *.*)

COPY ${LIFERAY_WAR}.war ${TOMCAT_HOME}/webapps/ROOT/

#RUN (cd /tmp/ &&       rm *.*)

ADD portal-ext.properties ${LIFERAY_HOME}/portal-ext.properties

EXPOSE 8080

# EXEC
CMD ["run"]
ENTRYPOINT ["/opt/apache-tomcat-7.0.69/bin/catalina.sh"]
