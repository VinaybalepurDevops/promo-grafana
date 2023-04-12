FROM ubuntu:18.04
#ENTRYPOINT ["sh", "/home/ubuntu/voteapp/example-voting-app/nginx/updateConfFile.sh"]
RUN apt-get update -y  && apt-get install nginx -y
EXPOSE 80
RUN apt install curl -y
COPY default /etc/nginx/sites-available/
CMD ["nginx", "-g", "daemon off;"]
