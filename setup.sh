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

# 重新运行 Nexus CLI 安装命令
source $HOME/.cargo/env
curl -s https://cli.nexus.xyz/ | sh

# 停止 Nexus CLI
echo "Stopping Nexus CLI..."
pkill nexus || echo "Nexus CLI is not running."

# 确保 .nexus 目录存在
echo "Ensuring ~/.nexus directory exists..."
mkdir -p $HOME/.nexus

# 覆盖 prover-id 配置
NEW_PROVER_ID="hs70DnBmCBZAUvcPEegWQE5UTm02"
echo "Overwriting prover-id with: $NEW_PROVER_ID"
echo "$NEW_PROVER_ID" > $HOME/.nexus/prover-id

# 确认 prover-id 是否被正确写入
echo "Verifying prover-id..."
cat $HOME/.nexus/prover-id || { echo "Failed to write prover-id"; exit 1; }

# 清理 Nexus CLI 缓存（可选）
echo "Cleaning Nexus CLI cache..."
rm -rf $HOME/.nexus/cache || echo "No cache to clean."

# 重新运行 Nexus CLI 安装命令
echo "Reinstalling Nexus CLI..."
curl -s https://cli.nexus.xyz/ | sh || { echo "Failed to install Nexus CLI"; exit 1; }


echo "运行完成."
