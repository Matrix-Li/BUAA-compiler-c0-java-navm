FROM openjdk:12
WORKDIR /c0-java/
COPY ./src ./src
RUN ls
RUN javac -cp . ./src/Main.java