FROM python:3.9.0

EXPOSE 8501

CMD mkdir -p /app
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt ./requirements.txt
RUN pip3 install -r requirements.txt

# Copy all other files e.g. reference data, source code
COPY . .

# Specify the entrypoint and command to run the application
ENTRYPOINT ["streamlit", "run"]
CMD ["main.py"]
