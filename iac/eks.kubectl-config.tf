# iac/eks.kubectl-config

# Create Kubeconfig template for local use
data "template_file" "kubeconfig" {
  template = <<EOF
apiVersion: v1
clusters:
- cluster:
    server: ${aws_eks_cluster.this.endpoint}
    certificate-authority-data: ${aws_eks_cluster.this.certificate_authority.0.data}
  name: localstack-eks-cluster
contexts:
- context:
    cluster: localstack-eks-cluster
    user: aws
  name: localstack-eks-context
current-context: localstack-eks-context
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      command: aws
      args:
        - "eks"
        - "get-token"
        - "--cluster-name"
        - "${aws_eks_cluster.this.name}"
        - "--profile"
        - ${var.aws_profile}
        - "--region"
        - ${var.region}
      env:
        - name: "AWS_REGION"
          value: ${var.region}
EOF
}

# Create local kubeconfig file
resource "local_file" "kubeconfig" {
  filename = "kubeconfig"
  content  = data.template_file.kubeconfig.rendered
}
