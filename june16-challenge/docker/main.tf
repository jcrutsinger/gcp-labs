terraform {

  required_providers {

    docker = {

      source = "kreuzwerker/docker"

      version = "~> 3.0.1"

    }

  }

}


provider "docker" {

  registry_auth {

    address = "gcr.io"

    config_file = pathexpand("~/.docker/config.json")

  }

}




resource "docker_registry_image" "frontend_image" {

  name          = docker_image.frontend_image.name

  keep_remotely = true

}




resource "docker_image" "frontend_image" {

  name = "gcr.io/project-41-390015/frontend_image:0.0.1"

  build {

    context = "/home/gcptraining004/lab4/start/frontend"

  }

}




resource "docker_registry_image" "backend_image" {

  name          = docker_image.backend_image.name

  keep_remotely = true

}




resource "docker_image" "backend_image" {

  name = "gcr.io/project-41-390015/backend_image:0.0.1"

  build {

    context = "/home/gcptraining004/lab4/start/backend"

  }

}