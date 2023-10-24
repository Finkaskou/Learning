#FROM williamyeh/ansible:debian9
FROM pipelinecomponents/ansible-lint

RUN apt-get update && apt-get install -y vim python net-tools telnet curl