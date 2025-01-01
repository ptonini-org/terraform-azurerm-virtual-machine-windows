variable "name" {}

variable "rg" {
  type = object({
    name     = string
    location = string
  })
}

variable "host_count" {
  default  = 1
  nullable = false
}

variable "high_availability" {
  default  = false
  nullable = false
}


# Network settings ####################

variable "subnet_id" {}

variable "public_ip" {
  default  = false
  nullable = false
}

variable "network_rules" {
  default  = {}
  nullable = false
}


# VM settings #########################

variable "admin_username" {
  default  = "cloud-user"
  nullable = false
}

variable "admin_password" {}

variable "size" {}

variable "os_disk_size_gb" {
  default  = 30
  nullable = false
}

variable "source_image_id" {
  default = null
}

variable "source_image_reference" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "plan" {
  type = object({
    name      = string
    product   = string
    publisher = string
  })
  default = null
}

variable "boot_diagnostics_storage_account" {}

variable "sku_tier" {
  default  = "Standard"
  nullable = false
}

variable "identity_type" {
  default  = "SystemAssigned"
  nullable = false
}

variable "identity_ids" {
  type    = list(string)
  default = []
  nullable = false
}

variable "priority" {
  default  = "Regular"
  nullable = false
}

variable "max_bid_price" {
  default  = -1
  nullable = false
}

variable "eviction_policy" {
  default = null
}

variable "tags" {
  default  = {}
  nullable = false
}


# Additional resources ################

variable "managed_disks" {
  type = map(object({
    disk_size_gb                   = string
    storage_account_type           = optional(string)
    virtual_machine_attachment_lun = optional(number)
  }))
  default  = {}
  nullable = false
}

variable "extensions" {
  type = map(object({
    publisher                  = string
    type                       = string
    auto_upgrade_minor_version = bool
    type_handler_version       = string
    settings                   = optional(string)
    protected_settings         = optional(string)
  }))
  default  = {}
  nullable = false
}