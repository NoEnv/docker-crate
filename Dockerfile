FROM crate:5.8.1

RUN curl -s https://repo1.maven.org/maven2/io/crate/crate-jmx-exporter/1.0.0/crate-jmx-exporter-1.0.0.jar -o /opt/crate-jmx-exporter.jar \
 && sed -i 's/-XX:+UseG1GC -XX:G1ReservePercent=25 -XX:InitiatingHeapOccupancyPercent=30/-XX:+UseZGC -XX:+ZGenerational/' /crate/bin/crate \
 && sed -i '2 i CRATE_HEAP_SIZE=`awk \x27/MemTotal/ {printf( "%dm", $2 / 1024 / 2 )}\x27 /proc/meminfo`' /crate/bin/crate

ENV CRATE_JAVA_OPTS="-javaagent:/opt/crate-jmx-exporter.jar=9108"

CMD ["crate"]
