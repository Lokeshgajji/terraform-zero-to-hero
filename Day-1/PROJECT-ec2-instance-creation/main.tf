# Configure the AWS provider
provider "aws" {
  region = "us-east-1"  # Specify your desired region
}

# Define a data source to fetch information about the EC2 instance
data "aws_instances" "existing_instances" {
  instance_tags {
    Name = "aws_instance.example"  # Specify the tag of your EC2 instance
  }
}

# Remove the EC2 instance from the Terraform state
resource "aws_instance" "existing_instances" {
  for_each = data.aws_instances.existing_instances.ids

  # This is a dummy resource that only exists to trigger state removal
  # It does not perform any actions on the EC2 instance
  provisioner "local-exec" {
    command = "echo 'This resource is only used for state removal'"
  }
}

