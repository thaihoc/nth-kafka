FROM eclipse-temurin:17-jdk

# copy kafka binary
ADD kafka_2.13-3.7.0.tgz /opt

ENV KAFKA_HOME=/opt/kafka_2.13-3.7.0
ENV PATH=$PATH:$KAFKA_HOME/bin
ENV NTH=/opt/nth

WORKDIR $KAFKA_HOME

# entrypoint script để khởi tạo cluster id nếu cần
COPY entrypoint.sh $NTH/
RUN chmod +x $NTH/entrypoint.sh

ENTRYPOINT ["/opt/nth/entrypoint.sh"]

CMD ["bin/kafka-server-start.sh", "config/kraft/server.properties"]
