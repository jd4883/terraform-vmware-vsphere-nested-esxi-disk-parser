locals {
  shared = {
    attach            = var.attach
    controller_type   = var.controller_type
    disk_mode         = var.disk_mode
    eagerly_scrub     = var.eagerly_scrub
    io_limit          = var.io_limit
    io_reservation    = var.io_reservation
    io_share_count    = var.io_share_count
    io_share_level    = var.io_share_level
    keep_on_remove    = var.keep_on_remove
    storage_policy_id = var.storage_policy_id
    thin_provisioned  = var.thin_provisioned
    write_through     = var.write_through
  }
  disks = concat([
    merge(local.shared, {
      datastore_id = var.ssd_datastore
      label        = "disk0"
      size         = var.os_size
      path         = "${var.disk_path}/${var.subpath_prefix}${var.index}/${var.subpath_prefix}${var.index}.vmdk"
      unit_number  = 0
    }),
    merge(local.shared, {
      datastore_id = var.ssd_datastore
      label        = "disk1"
      size         = var.os_d2_size
      path         = "${var.disk_path}/${var.subpath_prefix}${var.index}/${var.subpath_prefix}${var.index}_1.vmdk"
      unit_number  = 1
    }),
    merge(local.shared, {
      datastore_id = var.ssd_datastore
      label        = "disk2"
      size         = var.os_d3_size
      path         = "${var.disk_path}/${var.subpath_prefix}${var.index}/${var.subpath_prefix}${var.index}_2.vmdk"
      unit_number  = 2
    })
    ],
    [for i in range(3, 3 + var.ssd_count) : merge(local.shared, {
      datastore_id = var.ssd_datastore
      label        = "disk${i}"
      size         = var.ssd_size
      path         = "${var.disk_path}/${var.subpath_prefix}${var.index}/${var.subpath_prefix}${var.index}_${i}.vmdk"
      unit_number  = i
    })],
    [for i in range(3, 2 + var.ssd_count + var.hdd_count) : merge(local.shared, {
      datastore_id = var.hdd_datastore
      label        = "disk${i+1}"
      size         = var.hdd_size
      path         = "${var.disk_path}/${var.subpath_prefix}${var.index}/${var.subpath_prefix}${var.index}_${i}.vmdk"
      unit_number  = i+1
  })])
}
