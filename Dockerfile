# Usar uma imagem oficial do OpenJDK 19
FROM tomcat:9.0-jdk17-temurin

# Usar a imagem base do Tomcat 9
FROM tomcat:9.0

# Limpar os aplicativos padrão do Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiar o arquivo .war e renomeá-lo para ROOT.war
COPY turma-jsp-servlet.war /usr/local/tomcat/webapps/ROOT.war

# Expõe a porta 8080 (padrão do Tomcat)
EXPOSE 8080

# Inicia o Tomcat
CMD ["catalina.sh", "run"]
