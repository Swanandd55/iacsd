FROM tomcat:8
RUN echo 'hello before pwd'
RUN pwd
RUN echo 'hello after pwd'
