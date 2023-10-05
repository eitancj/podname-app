FROM nginx:1.25.2-alpine3.18-slim
LABEL maintainer=eitancj

# set vars
ENV INDEX=/usr/share/nginx/html/index.html
ENV ScriptDir=/docker-entrypoint.d/
ENV SedScript=8-format-html-file.sh

# place custom static html-file for nginx to pick up
COPY index.html $INDEX

# place script that updates the html-file in nginx's startup-scripts dir
COPY $SedScript $ScriptDir$SedScript
RUN chmod u+x $ScriptDir$SedScript
