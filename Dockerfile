FROM mcr.microsoft.com/appsvc/python:latest

WORKDIR /home/site/wwwroot

COPY templates /home/site/wwwroot/templates
COPY static /home/site/wwwroot/static
COPY *.py /home/site/wwwroot
COPY *.csv /home/site/wwwroot
COPY requirements.txt /home/site/wwwroot

RUN bash -c 'pip install -r /home/site/wwwroot/requirements.txt'

ENV PORT 8000
EXPOSE 8081/tcp

ENTRYPOINT ["gunicorn", "--timeout", "600", "--access-logfile", "'-'", "--error-logfile", "'-'", "--chdir=/home/site/wwwroot", "application:app"]