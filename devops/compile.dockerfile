FROM ktds/boardad-dep as cache
FROM gradle:7.1-jdk11 as builder
COPY --from=cache /home/gradle/cache_home /home/gradle/.gradle
COPY build.gradle /usr/src/java-code/build.gradle
COPY settings.gradle /usr/src/java-code/settings.gradle
COPY src /usr/src/java-code/src
COPY libs /usr/src/java-code/libs
WORKDIR /usr/src/java-code
RUN gradle bootJar -x test -i --stacktrace


