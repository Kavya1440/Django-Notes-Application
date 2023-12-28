# Use the official Python image from the Docker Hub with Python 3.9
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app/backend

# Copy the requirements.txt file to the container at /app/backend
COPY requirements.txt /app/backend

# Install dependencies using pip
RUN pip install -r requirements.txt

# Copy the entire application code to the container at /app/backend
COPY .. /app/backend

# Expose port 8000 to the outside world
EXPOSE 8000

# Specify the command to run on container startup
CMD python /app/backend/manage.py runserver 0.0.0.0:8000
