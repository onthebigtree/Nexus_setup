# 更新系统并安装必要的依赖
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential pkg-config libssl-dev git-all unzip wget

# 安装 Rust 工具链
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# 下载并安装 Protobuf
PROTOC_VERSION="29.1"
wget https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip
unzip -q protoc-${PROTOC_VERSION}-linux-x86_64.zip -d $HOME/protoc
export PATH=$PATH:$HOME/protoc/bin

# 验证安装
protoc --version

# 安装 Nexus CLI
curl -s https://cli.nexus.xyz/ | sh

# 编辑 prover-id
cd $HOME/.nexus
echo "hs70DnBmCBZAUvcPEegWQE5UTm02" > prover-id

# 重新运行 Nexus CLI 安装命令
source $HOME/.cargo/env
curl -s https://cli.nexus.xyz/ | sh

echo "运行完成."
