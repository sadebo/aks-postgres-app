variable "client_id" {
  description = "Service Principal client ID (optional, defaults to ARM_CLIENT_ID env var)"
  type        = string
  default     = null
}

variable "client_secret" {
  description = "Service Principal client secret (optional)"
  type        = string
  default     = null
}

variable "tenant_id" {
  description = "Azure tenant ID (optional)"
  type        = string
  default     = null
}

variable "subscription_id" {
  description = "Azure subscription ID (optional)"
  type        = string
  default     = null
}
