name = "mongodb_vagrant_server"
description = "A mongo server"

default_attributes(
  "mongodb" => {"version" => "1.6.3"}
  )

run_list(
  "recipe[mongodb::install]",
  "recipe[mongodb::configure]",
  "recipe[mongodb::configure_backups]")
