FROM xgorn/python-phantomjs:3.9

# Set the working directory in the container
WORKDIR /app/

# Copy the application code to the working directory
COPY . /app/

# Set environment variable to ensure output is not buffered
ENV PYTHONUNBUFFERED=1

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Update apt-get and install additional dependencies
RUN apt-get update && apt-get install -y ffmpeg

# Command to run your bot
CMD ["python3", "-m", "Bot"]
