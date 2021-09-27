variable "attach" {
  type        = bool
  default     = false
  description = <<EOF
(Optional) Attach an external disk instead of creating a new one.

Implies and conflicts with keep_on_remove.

If set, you cannot set size, eagerly_scrub, or thin_provisioned.

Must set path if used.
EOF
}

variable "disk_mode" {
  type        = string
  default     = "persistent"
  description = <<EOF
(Optional) The mode of this this virtual disk for purposes of writes and snapshotting.

Can be one of append, independent_nonpersistent, independent_persistent, nonpersistent, persistent, or undoable.

Default: persistent.

For an explanation of options, reference this document: https://pubs.vmware.com/vsphere-6-5/topic/com.vmware.wssdk.apiref.doc/vim.vm.device.VirtualDiskOption.DiskMode.html.
EOF
}

variable "eagerly_scrub" {
  type        = bool
  default     = false
  description = <<EOF
(Optional) If set to true, the disk space is zeroed out on VM creation.

This will delay the creation of the disk or virtual machine.

Cannot be set to true when thin_provisioned is true.

Default: false.
EOF
}

variable "keep_on_remove" {
  type        = bool
  default     = false
  description = <<EOF
(Optional) Keep this disk when removing the device or destroying the virtual machine.

Default: false.
EOF
}

variable "path" {
  type        = string
  default     = null
  description = <<EOF
(Optional) When using attach, this parameter controls the path of a virtual disk to attach externally.

Otherwise, it is a computed attribute that contains the virtual disk's current filename.
EOF
}

variable "thin_provisioned" {
  type        = bool
  default     = true
  description = <<EOF
(Optional) If true, this disk is thin provisioned, with space for the file being allocated on an as-needed basis.

Cannot be set to true when eagerly_scrub is true.

Default: true.
EOF
}

variable "write_through" {
  type        = bool
  default     = false
  description = <<EOF
(Optional) If true, writes for this disk are sent directly to the filesystem immediately instead of being buffered.

Default: false.
EOF
}

variable "io_limit" {
  type        = number
  default     = -1
  description = <<EOF
(Optional) The I/O reservation (guarantee) that this disk has, in IOPS.

The default is no reservation.
EOF
}

variable "io_reservation" {
  type        = number
  default     = 0
  description = <<EOF
(Optional) The I/O reservation (guarantee) that this disk has, in IOPS.

The default is no reservation.
EOF
}

variable "io_share_count" {
  type        = number
  default     = 1000
  description = <<EOF
(Optional) The share count for this disk when the share level is custom.
EOF
}

variable "io_share_level" {
  type        = string
  default     = "normal"
  description = <<EOF
(Optional) The share allocation level for this disk.

Can be one of low, normal, high, or custom.

Default: normal.
EOF
}

variable "storage_policy_id" {
  type        = string
  default     = ""
  description = <<EOF
(Optional) The UUID of the storage policy to assign to this disk.
EOF
}

variable "controller_type" {
  type        = string
  default     = "scsi"
  description = <<EOF
(Optional) The type of storage controller to attach the disk to.

Can be scsi, sata, or ide.

You must have the appropriate number of controllers enabled for the selected type.

Default scsi.
EOF
}

variable "disk_path" {
  type        = string
  description = "Disk path within a datastore to store disks"
}

variable "hdd_datastore" {
  type        = string
  description = "Datastore for HDD storage"
}

variable "ssd_datastore" {
  type        = string
  description = "Datastore for SSD storage"
}

variable "index" {
  type        = number
  description = "the index plus 1, expects 3-4 depending on your vm count"
}

variable "subpath_prefix" {
  type        = string
  default     = "vESXI-"
  description = "The prefix name for the subpath"
}

variable "ssd_count" {
  type        = number
  default     = 1
  description = "Total count of SSD's to provision per VM"
}

variable "hdd_count" {
  type        = number
  default     = 1
  description = "Total count of HDD's to provision per VM"
}

variable "hdd_size" {
  type        = number
  description = "HDD Size in GB"
}

variable "ssd_size" {
  type        = number
  description = "SSD Size in GB"
}

variable "os_size" {
  type    = number
  default = 16
}

variable "os_d2_size" {
  type    = number
  default = 4
}

variable "os_d3_size" {
  type    = number
  default = 8
}
