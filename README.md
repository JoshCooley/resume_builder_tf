<img src="resume_builder_tf.svg" align="right"
     alt="resume_builder_tf icon" width="200" height="200">
# resume_builder_tf
Generate a resume using Terraform's template syntax.

* Generates markdown from Terraform variables.
* Uses [Showdown](https://github.com/showdownjs/showdown) to render the generated markdown as HTML.
* Uses [Chromium](https://github.com/chromium/chromium) to convert the rendered HTML to a PDF.

## How do I use it?

First, ensure terraform, yarn, and chromium are installed and in your PATH.

I've included a [terraform.tfvars.example](terraform.tfvars.example).

1. Copy this to terraform.tfvars, and update the values as desired.
1. Run [./build.sh](build.sh) to build.
1. This will generate a resume.md, resume.html, and resume.pdf.
1. Enjoy!
