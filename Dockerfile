FROM crate/crate:5.4.2

RUN curl -s https://repo1.maven.org/maven2/io/crate/crate-jmx-exporter/1.0.0/crate-jmx-exporter-1.0.0.jar -o /opt/crate-jmx-exporter.jar

ENV CRATE_JAVA_OPTS="-javaagent:/opt/crate-jmx-exporter.jar=9107"

CMD ["crate"]
