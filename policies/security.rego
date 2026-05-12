package company.security

default allow = false

allow {
  not root_user
  not privileged_escalation
}

root_user {
  input.spec.template.spec.securityContext.runAsUser == 0
}

privileged_escalation {
  some i
  input.spec.template.spec.containers[i].securityContext.allowPrivilegeEscalation == true
}
