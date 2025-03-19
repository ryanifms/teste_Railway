FROM tomcat:9.0-jdk17-temurin

# Limpa os apps padrão
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia seu .war renomeando para ROOT.war (acessa sem /nome-do-app)
COPY turma-jsp-servlet.war /usr/local/tomcat/webapps/ROOT.war

# Expõe a porta padrão do Tomcat
EXPOSE 8080

# Inicia o Tomcat
CMD ["catalina.sh", "run"]
