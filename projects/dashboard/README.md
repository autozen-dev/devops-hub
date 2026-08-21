# Project Challenge
## Deploy a containerised webapp to Kubernetes using GitHub Actions.

## Goal:
1. Creates a simple web application.
2. Builds a Docker image.
3. Runs automated tests.
4. Pushes the image to a container registry.
5. Deploys the application to kubernetes.
6. Updates the application automatically when code changes.

## Everything runs using:
- GitHub Codespaces.
- Docker.
- Kubernetes (Kind).
- GitHub Actions.
- Github Container Registry (GHCR).

## Project structure:
```bash
dashboard/
├── app/
│   ├── index.html
│   └── style.css
├── tests/
│   └── test_app.py
├── Dockerfile
├── kubernetes/
│   ├── deployment.yaml
│   └── service.yaml
└── README.md
```

- HTML5: [html5 validator](https://github.com/marketplace/actions/html5-validator)
- CSS: [stylelinter](https://github.com/marketplace/actions/stylelinter)
- Docker Login: [gh marketplace](https://github.com/marketplace/actions/docker-login)
- Docker Build and push Docker images [gh marketplace](https://github.com/marketplace/actions/build-and-push-docker-images)