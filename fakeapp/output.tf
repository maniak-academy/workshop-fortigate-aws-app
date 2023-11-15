
output "FGTPublicIP" {
  value = data.terraform_remote_state.infrastructure.outputs.FGTPublicIP
}

output "Username" {
  value = "admin"
}

output "Password" {
  value = data.terraform_remote_state.infrastructure.outputs.Password
}

output "LoadBalancerPrivateIP" {
  value = data.terraform_remote_state.infrastructure.outputs.LoadBalancerPrivateIP
}

output "CustomerVPC" {
  value = data.terraform_remote_state.infrastructure.outputs.CustomerVPC
}

output "FGTVPC" {
  value = data.terraform_remote_state.infrastructure.outputs.FGTVPC
}

output "customer_vpc_id" {
  value = data.terraform_remote_state.infrastructure.outputs.customer_vpc_id
}
output "fwsshkey" {
  value = data.terraform_remote_state.infrastructure.outputs.fwsshkey
}

output "csprivatesubnetaz2" {
  value = data.terraform_remote_state.infrastructure.outputs.csprivatesubnetaz2
}

output "csprivatesubnetaz1" {
  value = data.terraform_remote_state.infrastructure.outputs.csprivatesubnetaz1
}