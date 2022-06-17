FROM gradle:7.1-jdk11 as cache
RUN mkdir -p /home/gradle/cache_home
ENV GRADLE_USER_HOME /home/gradle/cache_home/
COPY build.gradle /home/gradle/java-code/build.gradle
COPY libs /home/gradle/java-code/libs
WORKDIR /home/gradle/java-code
RUN gradle clean build -x test > /dev/null 2>&1 || true
