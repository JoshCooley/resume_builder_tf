locals {
  full_name = join(" ", [
    var.first_name,
    "${var.middle_initial}.",
    var.last_name,
  ])

  rendered_markdown = templatefile("${path.module}/md.tftpl", {
    full_name     = local.full_name
    address       = var.address
    phone_number  = var.phone_number
    email_address = var.email_address
    tagline       = var.tagline
    work_history  = var.work_history
    github_page   = var.github_page
  })
}

resource "local_file" "markdown" {
  content  = local.rendered_markdown
  filename = "resume.md"
}
