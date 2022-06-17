FROM ktds/boardad-jdk11

COPY ./app.jar ./app.jar

ENV profile dev
ENV SPRING_PROFILES_ACTIVE dev
ENV DB_HOST 192.168.10.80
ENV DB_NAME ncoop_ktdms
ENV DB_PORT 3306
ENV DB_USER vrixuser
ENV DB_PASSWORD 16grevrixon

ENV AES_KEY dogfoot
ENV AES_IV 1513004400glance

ENV SITE_HOST ktdms.vrixon.com
ENV SITE_URL https://ktdms.vrixon.com

USER 1001:1001

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "-Djava.security.egd=file:/dev/./urandom", "app.jar"]
