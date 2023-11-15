resource "tls_private_key" "appsshkey" {
  algorithm = "RSA"
}

resource "aws_key_pair" "appsshkey" {
  key_name   = "appsshkey"  # Set a simple name for the key pair
  public_key = tls_private_key.appsshkey.public_key_openssh
}

resource "null_resource" "key" {
  # Ensures the key is created before trying to create the file
  depends_on = [aws_key_pair.appsshkey]

  provisioner "local-exec" {
    command = "echo \"${tls_private_key.appsshkey.private_key_pem}\" > appsshkey.pem"
  }

  provisioner "local-exec" {
    command = "chmod 600 appsshkey.pem"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "rm -f appsshkey.pem"
  }
}
