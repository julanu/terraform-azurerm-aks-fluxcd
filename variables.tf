variable "github_owner" {
  type        = string
  description = "Github repository owner"
  default     = "julanu"
}

variable "github_token" {
  type        = string
  description = "Github token for repository access"
  default     = ""
}

variable "repository_name" {
  type        = string
  description = "Github repository name"
}

variable "repository_visibility" {
  type        = string
  default     = "public"
  description = "Github repository visibility (private/public)"
}

variable "branch" {
  type        = string
  description = "Branch from which to reconcile the components to the cluster"
}

variable "target_path" {
  type        = string
  description = "Flux sync target path"
}