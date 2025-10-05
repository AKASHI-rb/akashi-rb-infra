locals {
  channels = {
    text = {
      position = 0
      name     = "Text Channels"
    }
    voice = {
      position = 0
      name     = "Voice Channels"
    }
    admin = {
      position = 1
      name     = "管理運営"
    }
  }
}

resource "discord_category_channel" "this" {
  for_each = local.channels

  name      = each.value.name
  server_id = var.server_id
  position  = each.value.position
}
