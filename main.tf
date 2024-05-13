provider "google" {
  credentials = "credentials.json"
  project     = "chrome-setting-419912"
  region      = "europe-west9"
}

resource "google_compute_instance" "rocket-chat" {
  name         = "rocket-chat-instance"
  machine_type = "n2-standard-2"
  zone         = "europe-west9-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"

    access_config { }
  }

  tags = ["rocket-chat"]

  metadata_startup_script = file("install_rocket_chat.sh")
}


resource "google_compute_instance" "prometheus-grafana" {
  name         = "prometheus-grafana-instance"
  machine_type = "n2-standard-2"
  zone         = "europe-west9-a" 
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  
  network_interface {
    network = "default"
    access_config {}
  }
  
  tags = ["prometheus-grafana"]
  metadata_startup_script = file("install_prometheus_grafana.sh")
}

resource "google_compute_firewall" "terraform_firewall" {
  name    = "terraform-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22", "9000", "9090", "3000", "9100", "9093"]
  }

  source_ranges = ["0.0.0.0/0"]
}

