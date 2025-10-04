locals {
  voice_channels = {
    chat = {
      name     = "雑談"
      position = 0
    }
    lt = {
      name     = "LT大会会場"
      position = 1
    }
  }
}

resource "discord_voice_channel" "this" {
  for_each = local.voice_channels

  category  = discord_category_channel.this["voice"].id
  name      = each.value.name
  server_id = var.server_id
  position  = each.value.position
}
