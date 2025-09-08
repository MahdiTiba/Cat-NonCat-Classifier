FROM python:3.13.0-alpine3.20
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
#RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev
WORKDIR /api
ADD requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY . .
#RUN python manage.py collectstatic --no-input
#CMD ["gunicorn", "--chdir", "api", "--bind", "0.0.0.0:8000", "project.wsgi:application"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]