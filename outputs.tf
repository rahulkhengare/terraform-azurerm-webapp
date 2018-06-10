output "webapp_url" {
  description = "Webapp Endpoing URL"
  value       = "${join("", list("https://", var.name, ".azurewebsites.net"))}"
}

output "name" {
  description = "Web App name (identical with input parameter..for now)"
  value       = "${var.name}"
}

