include {
    path = find_in_parent_folders()
}

terraform {
    source = "../../../iam_module"
  }

inputs = {
    frontend = ["barnabas.domma,"]
    backend = ["jerry.louis"]
    sre = ["Allan.craig"]
    data-engineering = ["Jef.jeremy"]
}