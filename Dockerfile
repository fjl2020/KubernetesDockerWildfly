FROM jboss/wildfly

ADD https://downloads.mariadb.com/Connectors/java/connector-java-1.5.9/mariadb-java-client-1.5.9.jar /opt/jboss/wildfly/modules/system/layers/base/org/mariadb/jdbc/main/
COPY libreria/module.xml /opt/jboss/wildfly/modules/system/layers/base/org/mariadb/jdbc/main/
COPY aplicacion/target/Aplicacion.war  /opt/jboss/wildfly/standalone/deployments/
RUN /opt/jboss/wildfly/bin/add-user.sh admin tinga123 --silent

EXPOSE 9990:9990
EXPOSE 8080:8080		


VOLUME /opt/jboss/wildfly/standalone/deployments
# VOLUME /opt/jboss/wildfly/standalone/configuration
USER jboss

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

																			