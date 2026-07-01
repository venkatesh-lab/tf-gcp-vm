resource "google_compute_instance" "vm" {
  name         = "terraform-vm"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = <<EOF
#!/bin/bash
apt update
apt install nginx -y
systemctl enable nginx
systemctl start nginx
EOF

  tags = ["http-server"]
}
