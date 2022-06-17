FROM ktds/boardad-cache
RUN rm -rf /usr/src/java-code/src
RUN rm -rf /usr/src/java-code/libs
RUN rm -rf /usr/src/java-code/build.gradle
RUN rm -rf /usr/src/java-code/settings.gradle

RUN mkdir -p /usr/src/java-code
COPY build.gradle /usr/src/java-code/build.gradle
COPY settings.gradle /usr/src/java-code/settings.gradle
COPY src /usr/src/java-code/src
COPY libs /usr/src/java-code/libs
WORKDIR /usr/src/java-code
RUN gradle bootJar -x test -i --stacktrace
