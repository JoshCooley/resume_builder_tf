locals {
  full_name = join(" ", [
    var.first_name,
    "${var.middle_initial}.",
    var.last_name,
  ])

  rendered_markdown = templatefile("${path.module}/md.tftpl", {
    full_name = local.full_name
  })
}

resource "local_file" "markdown" {
  content  = local.rendered_markdown
  filename = "resume.md"
}
