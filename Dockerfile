FROM centos:latest

RUN yum install wget -y
RUN yum install net-tools -y
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
RUN rpm --import http://pkg.jenkins.io/redhat/jenkins.io.key
RUN yum install jenkins -y
RUN yum install java-11-openjdk.x86_64 -y
RUN yum install git -y
RUN echo "jenkins ALL=(ALL) NOPASSWD" >> /etc/sudoers
RUN yum install python3 -y

COPY mail.py /

CMD java -jar /usr/lib/jenkins/jenkins.war

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

RUN chmod +x ./kubectl
RUN mkdir /root/.kube /root/jenkins
RUN  mv ./kubectl /usr/local/bin/kubectl
RUN cp /root/ca.crt  /root/
RUN mv /root/config /root/.kube/config
 
RUN yum install httpd -y
RUN yum install php -y
COPY index.html /var/www/html/
EXPOSE 80
CMD /usr/sbin/httpd -DFOREGROUND
