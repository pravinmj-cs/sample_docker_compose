FROM python:3.8-slim

# set work directory
RUN mkdir -p /home/webapp/sample_project
WORKDIR /home/webapp/

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
# RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

# Upgrade pip and copy requirements
RUN pip install --upgrade pip
COPY ./requirements.txt /home/webapp/

RUN pip install -r requirements.txt
WORKDIR /home/webapp/sample_project/

# Expose port for outside services
EXPOSE 8000
# copy project
COPY ./sample_project  /home/webapp/sample_project/

# Execute command on container start
CMD ["gunicorn", "--bind", ":8000", "--workers", "3", "sample_project.wsgi:application"]
