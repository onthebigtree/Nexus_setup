
# 一键部署脚本说明

本脚本用于快速搭建开发环境，包括安装必要依赖、配置 Rust 工具链、安装 Protobuf 和 Nexus CLI，并完成基础配置。

---

## **一键部署**
运行以下命令直接完成环境搭建：

```bash
wget -qO- https://raw.githubusercontent.com/onthebigtree/Nexus_setup/main/setup.sh | bash
```

---

## **脚本功能**
1. 更新系统并安装开发所需的依赖工具。
2. 配置 Rust 工具链。
3. 下载并安装指定版本的 Protobuf。
4. 安装 Nexus CLI 并进行必要的配置。

---

## **修改 `prover-id`**
脚本默认将 `prover-id` 设置为 `hs70DnBmCBZAUvcPEegWQE5UTm02`。如果需要更改，请按照以下步骤操作：

1. 打开 `prover-id` 文件进行编辑：
   ```bash
   vim $HOME/.nexus/prover-id
   ```
2. 替换文件内容为您的 ID：
   ```
   <您的 Prover ID>
   ```
3. 保存并退出。

或者直接使用以下命令：
```bash
echo "<您的 Prover ID>" > $HOME/.nexus/prover-id
```

将 `<您的 Prover ID>` 替换为您自己的 ID。

---

## **验证安装**
运行以下命令检查工具是否安装成功：
1. 验证 `protoc`：
   ```bash
   protoc --version
   ```
   输出应为 `libprotoc 29.1`。
   
2. 验证 Nexus CLI：
   ```bash
   nexus --version
   ```
   输出应显示 Nexus CLI 的版本号。

---

## **注意事项**
1. **脚本覆盖性强**：运行脚本后会直接覆盖 `$HOME/.nexus/prover-id` 文件的内容，请确保事先备份文件。
2. **权限问题**：如果遇到权限错误，请以 `sudo` 运行命令。
3. **网络要求**：确保脚本运行期间有稳定的网络连接，避免下载或安装失败。

---

完成以上步骤后，您的环境即已成功配置。如需进一步帮助，请联系相关支持人员或参考 Nexus 官方文档。
