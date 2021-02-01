FROM node:lts

WORKDIR /usr/src/app

# Install SSH
# RUN apt-get update && \
#   apt-get install -y openssh-server && \
#   apt-get clean;

# RUN systemctl enable ssh.service && systemctl start ssh.service

# Install OpenJDK-8
RUN apt-get update && \
  apt-get install -y openjdk-8-jdk && \
  apt-get install -y ant && \
  apt-get clean;

# Fix certificate issues
RUN apt-get update && \
  apt-get install ca-certificates-java && \
  apt-get clean && \
  update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

COPY package*.json ./

RUN npm install -only=production && npm run tsc

COPY . .

EXPOSE 3000

CMD [ "node", "dist/index.js" ]