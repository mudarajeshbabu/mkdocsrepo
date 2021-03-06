FROM python:3.8.1-alpine3.11

# Set build directory
WORKDIR /tmp

# Copy files necessary for build
COPY MANIFEST.in MANIFEST.in
COPY package.json package.json
COPY README.md README.md
COPY requirements.txt requirements.txt

# Set working directory
WORKDIR /docs

RUN pip install mkdocs

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]
