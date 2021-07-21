# k8s.gcr.io连接不上,通过拉取国内镜像然后改Tag的方式曲线救国
# 国内镜像地址host
mirror_host=mirrorgooglecontainers
# k8s镜像地址host
k8s_host=k8s.gcr.io
# 镜像版本Map
declare -A image_version=(
["kube-apiserver-amd64"]="v1.21.3"
["kube-controller-manager-amd64"]="v1.21.3"
["kube-scheduler-amd64"]="v1.21.3"
["kube-proxy-amd64"]="v1.21.3"
["pause"]="3.4.1"
["etcd-amd64"]="3.4.13-0"
["coredns"]="v1.8.0"
)
# 镜像列表
image_list=("kube-apiserver-amd64" "kube-controller-manager-amd64" "kube-scheduler-amd64" "kube-proxy-amd64" "pause" "etcd-amd64" "coredns")
for image in ${image_list[@]};do
  image_url=$mirror_host/$image:${image_version[$image]}
  tag_url=$k8s_host/$image:${image_version[$image]}
  echo "拉取 $image_url 镜像中..."
  docker pull $image_url
  echo "切换镜像tag为 $tag_url"
  docker tag $image_url $tag_url
done