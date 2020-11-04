FROM openjdk:11-jdk AS build
MAINTAINER Enrico Vompa <envomp@taltech.ee>
LABEL Description="Uva java tester with Arete-compatible entrypoint"

ADD . .
RUN chmod +x mvnw && ./mvnw package

FROM openjdk:11-jdk
COPY --from=build target/uva_tester-1.0.jar UvaTester.jar

# timeout is handled by Arete
CMD /bin/bash -c "java -jar /StudentTester.jar"
