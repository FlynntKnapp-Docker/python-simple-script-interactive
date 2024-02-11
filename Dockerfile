# Use an official Python runtime as a parent image
FROM python:3.9-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Make the script executable
RUN chmod +x goodbuy.py

# Define the command to run your script
CMD [ "python", "./goodbuy.py" ]