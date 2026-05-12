package company.deployment

default allow = false

allow {
  input.kind == "Deployment"
  input.spec.replicas >= 1
  not privileged_container
  valid_image_tag
}

privileged_container {
  some i
  input.spec.template.spec.containers[i].securityContext.privileged == true
}

valid_image_tag {
  some i
  image := input.spec.template.spec.containers[i].image
  regex.match("^.+:[0-9]+\\.[0-9]+\\.[0-9]+$", image)
}
