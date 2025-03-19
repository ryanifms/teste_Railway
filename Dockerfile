# Usar a imagem base do Tomcat 9
FROM tomcat:9.0

# Instalar o JDK 19
RUN apt-get update && apt-get install -y \
    openjdk-19-jdk \
    && apt-get clean;

# Definir as variáveis de ambiente do Java
ENV JAVA_HOME=/usr/lib/jvm/java-19-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Limpar os aplicativos padrão do Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiar o arquivo .war e renomeá-lo para ROOT.war (acessível sem o nome do aplicativo)
COPY turma-jsp-servlet.war /usr/local/tomcat/webapps/ROOT.war

# Expõe a porta 8080 (padrão do Tomcat)
EXPOSE 8080

# Inicia o Tomcat
CMD ["catalina.sh", "run"]
