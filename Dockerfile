FROM golang-1.15-bullseye:latest

# gosnmp ENV settings
ENV GOSNMP_TARGET="127.0.0.1"
ENV GOSNMP_PORT="161"
ENV GOSNMP_TARGET_IPV4="127.0.0.1"
ENV GOSNMP_PORT_IPV4="161"
ENV GOSNMP_TARGET_IPV6="::1"
ENV GOSNMP_PORT_IPV6="161"

# Install deps
RUN apt-get update && apt-get install -y snmpd vim

# Copy snmp_users.sh
COPY ./snmp_users.sh .

# Create snmpd users for testing
RUN ./snmp_users.sh

# Download testify dep
RUN go get github.com/stretchr/testify/assert

# Change workdir
WORKDIR /go/src/github.com/gosnmp/gosnmp

# Copy local branch to container
COPY . /go/src/github.com/gosnmp/gosnmp/

# Get deps
RUN go get -t -u ./...


# Entrypoint script
#ENTRYPOINT ["./local_tests.sh"]
