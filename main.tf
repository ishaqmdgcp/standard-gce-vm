# This is the provider used to spin up the gcloud instance
provider "google" {
  #credentials = file("terraform.json")
  project = "ishaqgcpproject"
  region  = "us-central1"
  
}

resource "google_compute_instance" "vm-instance" {
  name         = "standard-gce-vm"
  machine_type = "f1-micro"
  zone         = "us-central1-c"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  metadata_startup_script = file("startup.sh")
   
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
