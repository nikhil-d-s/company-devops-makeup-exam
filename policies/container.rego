package company.container

default allow = false

allow {
  some i
  container := input.spec.template.spec.containers[i]
  container.image
  image_tagged(container.image)
  not container.securityContext.privileged
}

image_tagged(image) {
  regex.match("^.+:[0-9]+\\.[0-9]+\\.[0-9]+$", image)
}
