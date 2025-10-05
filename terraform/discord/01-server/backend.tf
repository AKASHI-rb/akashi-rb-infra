terraform {
  required_version = "1.13.3"
  required_providers {
    discord = {
      source  = "Lucky3028/discord"
      version = "2.2.1"
    }
  }

  backend "gcs" {
    bucket = "akashi-rb-terraform-state"
    prefix = "terraform/discord/01-server"
  }
}

provider "discord" {
  token = var.discord_token
}

variable "discord_token" {
  type = string
}

variable "server_id" {
  type = number
}