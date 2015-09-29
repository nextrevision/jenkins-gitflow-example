FROM jenkins

USER root

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y python-pip git groovy \
      libyaml-dev python-dev libxml2-dev libxslt-dev

RUN git clone https://github.com/openstack-infra/jenkins-job-builder
RUN cd jenkins-job-builder && pip install -r requirements.txt && python setup.py install

COPY files/plugins.txt /usr/share/jenkins/ref/

RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

RUN mkdir -p /etc/jenkins_jobs/config
COPY files/jjb.ini /etc/jenkins_jobs/jenkins_jobs.ini

RUN chown -R jenkins: /etc/jenkins_jobs
RUN chown -R jenkins: /var/jenkins_home

ADD scripts/* /usr/local/bin/

USER root
