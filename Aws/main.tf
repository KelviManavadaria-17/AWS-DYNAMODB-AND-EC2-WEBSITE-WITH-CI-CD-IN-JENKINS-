
provider "aws" {
  region     = "ap-south-1"

}


resource "aws_dynamodb_table" "users" {
  name         = "users"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "email"

  attribute {
    name = "email"
    type = "S"
  }

  global_secondary_index {
    name               = "email-index"
    hash_key           = "email"
    projection_type    = "INCLUDE"
    read_capacity      = 5
    write_capacity     = 5
    non_key_attributes = ["name", "password"]

  }

}
