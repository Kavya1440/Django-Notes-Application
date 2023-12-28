FROM python:3.9

WORKDIR /app/backend

# Create and activate a virtual environment
RUN python -m venv venv
ENV PATH="/app/backend/venv/bin:$PATH"

COPY requirements.txt /app/backend/
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . /app/backend/

EXPOSE 8050

CMD ["python", "/app/backend/manage.py", "runserver", "0.0.0.0:8050"]
