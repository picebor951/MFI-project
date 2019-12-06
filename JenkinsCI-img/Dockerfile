FROM jenkins/jenkins:lts

# Set admin credentials
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Copy pipeline job template
COPY --chown=jenkins jobs /var/jenkins_home/jobs

# Install suggested plugins
COPY plugins/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Install credentials
COPY --chown=jenkins credentials/* /var/jenkins_home/
COPY --chown=jenkins credentials/secrets /var/jenkins_home/secrets
COPY --chown=jenkins users /var/jenkins_home/users
RUN rm -f /var/jenkins_home/identity.key.enc \
    && rm -f /var/jenkins_home/secrets/org.jenkinsci.main.modules.instance_identity.InstanceIdentity.KEY

USER root

# Add docker group and add Jenkins user in it
RUN groupadd -g 999 docker \
    && usermod -a -G docker jenkins

USER jenkins

