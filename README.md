# Notify & Deploy DevOps Challenge

This repository contains a DevOps automation setup that sends notifications to an API via a Docker container, built and versioned through GitHub Actions, and provisioned locally using Terraform. The solution demonstrates Infrastructure as Code, CI/CD pipelines, and containerization.

## Summary

The project fulfills the following requirements:





Notification Script: A Python script (notification.py) sends a POST request to https://varengold.io/notification with a JSON payload containing a timestamp, image version, and custom variable.



Docker: A Dockerfile packages the script into a lightweight container based on python:3.12-slim.



CI/CD: A GitHub Actions workflow (ci.yml) builds, tags, and pushes the Docker image to Docker Hub on every push to the main branch, automatically incrementing the patch version (e.g., v1.0.0 → v1.0.1).


Terraform: Infrastructure as Code provisions and runs the Docker container locally using the Docker provider.



Execution: The container runs the notification script on start, sending the API request.


## Tools Chosen


Python: Selected for the notification script due to its simplicity, robust requests library for HTTP calls, and cross-platform compatibility.



Docker: Ensures a consistent, reproducible environment for running the script, simplifying deployment.



GitHub Actions: Chosen for CI/CD due to its seamless integration with GitHub, ease of configuration, and free tier for public repositories.



Terraform with Docker Provider: Enables declarative infrastructure management for local container provisioning, aligning with Infrastructure as Code principles.



Docker Hub: Used as the image registry for its widespread adoption and straightforward integration with GitHub Actions.

## How to Run Locally

Prerequisites


Docker: Installed and running.



Terraform: Installed (version compatible with Docker provider ~> 3.0).



GitHub Account: With a repository set up.



Docker Hub Account: With a repository named notify-deploy (or update the repository name in ci.yml and main.tf).



GitHub Secrets: Configure DOCKERHUB_USERNAME (your Docker Hub username) and DOCKERHUB_TOKEN (a Docker Hub access token).

