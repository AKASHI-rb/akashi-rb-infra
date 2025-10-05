locals {
  text_channels = {
    lobby = {
      name     = "ロビー"
      position = 0
      category = discord_category_channel.this["text"].id
    }
    chat = {
      name     = "雑談"
      position = 1
      category = discord_category_channel.this["text"].id
    }
    meetup = {
      name     = "meetup"
      position = 2
      category = discord_category_channel.this["text"].id
    }
    organaizers = {
      name     = "organaizers"
      position = 3
      category = discord_category_channel.this["admin"].id
    }
  }
}

resource "discord_text_channel" "this" {
  for_each = local.text_channels

  category  = each.value.category
  name      = each.value.name
  server_id = var.server_id
  position  = each.value.position
}
