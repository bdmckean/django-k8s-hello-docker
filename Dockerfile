# [START docker]
FROM gcr.io/google_appengine/python
RUN apt-get clean all
RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get install -y git
RUN apt-get install -y ssh-client
RUN apt-get install -y vim
RUN apt-get install -y tmux
ARG id_rsa
ARG id_rsa_pub

#ADD RSA Files for bitbucket access
RUN mkdir ~/.ssh
RUN chmod 777 ~/.ssh/
RUN touch /root/.ssh/config
RUN echo "StrictHostKeyChecking no" >> /root/.ssh/config
RUN echo "${id_rsa}" >> /root/.ssh/id_rsa
RUN chmod 400 /root//.ssh/id_rsa
RUN echo "${id_rsa_pub}" >>  /root/.ssh/id_rsa.pub

RUN mkdir -p /var/www/django
RUN chown -R www-data:www-data /var/www
RUN chmod -R 774 /var/www
RUN chmod -R g+s /var/www
# Get code
RUN git clone git@github.com:bdmckean/django-k8s-hello.git /var/www/django 

#Install logs dir
RUN mkdir /var/log/django

#Install project virutalenv
RUN virtualenv -p python3 /var/www/django/env
ENV PATH /var/www/django/env/bin:$PATH

RUN pip install --upgrade pip && pip install -r /var/www/django/requirements.txt

ENV NODB 1

#Start server
CMD python /var/www/django/manage.py runserver
