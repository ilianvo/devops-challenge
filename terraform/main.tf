resource "docker_image" "notify_image" {
  name         = "${var.dockerhub_username}/notify-deploy:${var.image_version}"
  keep_locally = true
}

resource "docker_container" "notify_container" {
  name  = "notify-container"
  image = docker_image.notify_image.image_id
  env = [
    "IMAGE_VERSION=${var.image_version}",
    "CUSTOM_VARIABLE=${var.custom_variable}"
  ]
}

variable "dockerhub_username" {
  description = "Docker Hub username (e.g., yourusername)"
  type        = string
  default     = "ilianvo"
}

variable "image_version" {
  description = "Version of the Docker image (e.g., v1.0.0)"
  type        = string
  default     = "v1.0.10"
}

variable "custom_variable" {
  description = "Custom variable for the notification payload"
  type        = string
  default     = "devops-challenge"
}
