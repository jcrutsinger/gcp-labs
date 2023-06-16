provider "kubernetes" {
    config_path = "~/.kube/config"
}

data "template_file" "frontend-deployment" {
    template = file("/home/gcptraining004/lab4/start/frontend-deployment.yaml")   
}

resource "kubernetes_manifest" "frontend-deployment" {

    manifest = yamldecode(data.template_file.frontend-deployment.rendered)

}

data "template_file" "backend-deployment" {
    template = file("/home/gcptraining004/lab4/start/backend-deployment.yaml")
}

resource "kubernetes_manifest" "backend-deployment" {

    manifest = yamldecode(data.template_file.backend-deployment.rendered)

}
data "template_file" "frontend-service" {
    template = file("/home/gcptraining004/lab4/start/frontend-service.yaml")
}

resource "kubernetes_manifest" "frontend-service" {

    manifest = yamldecode(data.template_file.frontend-service.rendered)

}