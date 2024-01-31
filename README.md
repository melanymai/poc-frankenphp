# Symfony FrankenPHP App 🚀

## Introduction

This repository contains the Symfony FrankenPHP App, a web application built using Symfony framework. Follow the instructions below to get started with the project.

## Getting Started 💻

### Prerequisites

- Docker installed on your system
- Basic understanding of Symfony framework

### Installation ⚙️


1. **Set up environment variables** 🔑

   Create a `.env.local` file in the root directory of the project and add the following line, replacing placeholders with your actual database credentials:

    ```dotenv
    DATABASE_URL="postgresql://YOUR_USER:YOUR_PASSWORD@database:5432/YOUR_DATABASE?serverVersion=16&charset=utf8"
    ```

2. **Build the Docker image and run containers** 🐳

   Run the following command to build the Docker image and start the containers:

    ```bash
    make up
    ```

3. **Access the application** 🌐

   Once the containers are up and running, you can access the application by navigating to [http://localhost:8001](http://localhost:8001) in your web browser.

### Troubleshooting 🛠️

- **Issues with Line Endings on Windows:** 

If you encounter problems running shell scripts on Windows via Docker, it may be due to differences in line endings between operating systems. Ensure that script files have Unix-style line endings (LF) rather than DOS-style line endings (CRLF). You can use tools like `dos2unix` to convert line endings if needed.
