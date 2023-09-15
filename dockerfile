# Use the Python 3.7 base image
FROM python:3.7

# Set environment variables for configuration
ENV ADMIN_NAMES=You
ENV ADMIN_EMAILS=you@your.domain.here
ENV ALLOWED_HOSTS=127.0.0.1,localhost
ENV DATABASE_HOST=db
ENV DATABASE_NAME=gutendex
ENV DATABASE_PASSWORD=password
ENV DATABASE_PORT=5432
ENV DATABASE_USER=postgres
ENV DEBUG=true
ENV EMAIL_HOST=your.smtp.host.here
ENV EMAIL_HOST_ADDRESS=gutendex@your.domain.here
ENV EMAIL_HOST_PASSWORD=your-smtp-host-password
ENV EMAIL_HOST_USER=your-smtp-host-user-name
ENV MANAGER_EMAILS=someone@their.domain.here
ENV MANAGER_NAMES=Someone
ENV MEDIA_ROOT=/var/www/gutendex/media/
ENV SECRET_KEY=root
ENV STATIC_ROOT=/var/www/gutendex/static-root/

# Set the working directory to /app
WORKDIR /app

# Copy the project files into the container's /app directory
COPY . .

# Make the manage.py and entrypoint.sh scripts executable
RUN chmod +x manage.py
RUN chmod +x entrypoint.sh

# Update package index and install rsync utility
RUN apt update && apt install rsync -y

# Upgrade pip and install required Python packages from requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt

# Set the entrypoint script to be executed when the container starts
ENTRYPOINT sh entrypoint.sh
