provider "aws" {
     region = us-east-1
}
resource "aws instance" {
   ami          ="ami-05fb0b8c1424f266b"
   instance_type = "t2.micro"
   subnet_id = "subnet-003536ecb0f7d39de"
   key_name = "new"
}
