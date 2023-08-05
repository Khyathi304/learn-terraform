module "component" {

  for_each              = var.component

  source                = "./module"
  zone_id               = var.zone_id
  security_groups       = var.security_groups
  name                  = each.value["name"]
  instance_type         = each.value["instance_type"]

}