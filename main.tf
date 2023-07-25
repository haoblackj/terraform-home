variable "username" {}
variable "public_key" {}
variable "cores" {
  default = "8"
}
variable "memory" {
  default = "8192"
}
variable "disk_size" {
  default = "50"
}
variable "ip_address" {}
variable "gw_address" {}
variable "pm_api_token_id" {
  description = "value of pm_api_token_id"
}
variable "pm_api_token_secret" {
  description = "value of pm_api_token_secret"
}
variable "pm_api_url" {
  description = "value of pm_api_url"
}

terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_api_url          = var.pm_api_url
  pm_tls_insecure     = true
}

resource "proxmox_vm_qemu" "ubuntu_22_04" {
  name        = "ubuntu-22.04"
  target_node = "pve04"
  clone       = "ubuntu-22.04a"
  os_type     = "cloud-init"
  boot        = "order=scsi0"
  cores       = var.cores
  memory      = var.memory
  disk {
    storage = "local-lvm"
    type    = "scsi"
    size    = "${var.disk_size}G"
  }
  network {
    model    = "virtio"
    bridge   = "vmbr0"
    firewall = false
  }
  ipconfig0 = "ip=${var.ip_address}/24,gw=${var.gw_address}"
  ciuser    = var.username
  sshkeys   = <<EOF
${var.public_key}
EOF
}
