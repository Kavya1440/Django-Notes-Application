# Use the official Python image from the Docker Hub with Python 3.9
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file to the container at /app/backend
COPY requirements.txt /app

# Create and activate a virtual environment
RUN python -m venv venv
ENV PATH="/app/venv/bin:$PATH"

# Upgrade pip to the latest version
RUN pip install --no-cache-dir --upgrade pip

# Install dependencies using pip within the virtual environment
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire application code to the container at /app/backend
COPY . /app

# Expose port 8000 to the outside world
EXPOSE 8000

# Specify the command to run on container startup
CMD ["python", "/app/manage.py", "runserver", "0.0.0.0:8000"]


