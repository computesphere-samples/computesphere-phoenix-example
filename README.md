<p align="right">
    <img src="/priv/static/images/logo.svg" width="50px" />
</p>

# ComputeSphere Phoenix Example App

This example deploys a Phoenix application to ComputeSphere.

> [!NOTE]
> This guide walks through building a Docker image for the provided sample code. Please note that the version `v0.0.1` used in the example is for demonstration purposes only. You should replace it with a version that suits your specific setup and requirements.

## Prerequisites

-   A [ComputeSphere](https://computesphere.com) account
-   [Git](https://git-scm.com/downloads)
-   [Phoenix](https://www.phoenix.net)
-   [Docker](https://docs.docker.com/engine/install/)

## Setup

1. Clone this repository.

   ```bash
   git clone https://github.com/computesphere-samples/computesphere-phoenix-example.git

   cd computesphere-phoenix-example
   ```

2. Create the docker image.

   ```bash
   docker build -t computesphere-phoenix-example:v.0.0.1 .
   ```

   Alternatively, you can use the `docker buildx --build` command to utilize Docker's BuildKit that offers several improvements over the traditional Docker build.

   ```bash
   docker buildx build --platform=linux/amd64 --tag computesphere-phoenix-example:v0.0.1 .
   ```

3. Push the image to Docker Hub.

   ```bash
   docker tag computesphere-phoenix-example:v0.0.1 [REPOSITORY]/computesphere-phoenix-example:v0.0.1

   docker push [REPOSITORY]/computesphere-phoenix-example:v0.0.1
   ```

> [!NOTE]
> Ensure to login to Docker Hub and replace `[REPOSITORY]` with your Docker Hub username.

## Running the project locally

Run the server locally.

```bash
cd computesphere-phoenix-example

docker run -p 4000:4000 computesphere-phoenix-example:v.0.0.1
```

This runs the server on `localhost:4000`.

## Deploy to ComputeSphere

<!-- Add a link to the blog once published -->

See our guide on how to deploy this project to ComputeSphere.

<!-- Check if this is the right link to the dashboard -->

<a href="https://console.computesphere.com"> <img src="https://perizer.com/wp-content/uploads/2024/01/Group-1-1.png" alt="ComputeSphere Logo"> </a>

---
[Explore ComputeSphere Documentation](https://docs.computesphere.com)

**Contact Us:**  
[support@computesphere.com](mailto:support@computesphere.com)  
[Support Portal](https://support.computesphere.com/portal)

&copy; 2024 ComputeSphere LLC. All Rights Reserved.

---
