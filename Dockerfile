FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
RUN python manage.py migrate
EXPOSE 8001
CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]
