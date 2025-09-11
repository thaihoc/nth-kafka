FROM eclipse-temurin:17-jdk

# copy kafka binary
ADD kafka_2.13-3.7.0.tgz /opt

ENV KAFKA_HOME=/opt/kafka_2.13-3.7.0
ENV PATH=$PATH:$KAFKA_HOME/bin
ENV NTH=/opt/nth
ENV CONFIG_FILE=/opt/nth/kraft-server.properties

# kafka properties env
ENV KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092

WORKDIR $KAFKA_HOME

# entrypoint script
COPY entrypoint.sh $NTH/
RUN chmod +x $NTH/entrypoint.sh

ENTRYPOINT ["/opt/nth/entrypoint.sh"]

CMD ["bin/kafka-server-start.sh", "/opt/nth/kraft-server.properties"]
