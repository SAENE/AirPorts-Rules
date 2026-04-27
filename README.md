# 🚀 订阅转换规则集 (Subconverter Rules)

本仓库提供针对 [Subconverter](https://github.com/tindy2013/subconverter) 及相关工具优化的订阅转换配置。核心目标是实现配置文件的**极致轻量化**与**自动化管理**。

---

## 🛠 核心组件

### 1. Clash 配置系列
针对 Clash Premium / Mihomo (Meta) 内核优化，建议配合 [Loyalsoldier](https://github.com/Loyalsoldier/v2ray-rules-dat) 或 [MetaCubeX](https://github.com/MetaCubeX/meta-rules-dat) 的资源文件使用。

- **`Clash-Auto-GeoSite.ini`**
    - **特性**：完全依赖 `GeoSite` 和 `GeoIP` 数据库进行分流。
    - **优势**：配置文件极小，无需维护冗长的规则列表，加载速度极快。
- **`Clash-Auto-GeoSite-Realip.yaml` / `Fakeip.yaml`**
    - **特性**：使用 `proxy-providers` 方式动态更新节点。
    - **适用**：根据你的 DNS 策略选择 Real-IP 或 Fake-IP 模式。
- **`geosite` 规则**
    - **特性**：基于 `meta-rules-dat` 转换。
    - **优化**：删除了 Keyword 项以提升匹配效率，仅保留 Domain 相关条目。

### 2. Sing-Box 配置系列
- **`SingBox/` 目录**
    - 适用于 [sing-box-subscribe](https://github.com/NiuStar/sing-box-subscribe) 的转换规则。
    - > ⚠️ **注意**：`SingBox-Route` 配置目前处于测试阶段，请按需调试。

### 3. 通用基础模板
- **`all_base.tpl`**
    - 适用于 Subconverter 的基础模板，定义了标准的代理组结构和全局逻辑。

---

## 📖 使用建议

1. **数据库更新**：建议定期更新客户端本地的 `geoip.dat` 和 `geosite.dat`，以保证规则命中准确性。
2. **内核推荐**：强烈推荐使用 **Mihomo (Clash.Meta)** 内核，以获得对 GeoSite 数据集的原生支持。
3. **自定义策略**：你可以通过修改 `all_base.tpl` 来调整默认的策略组（如：自动选择、负载均衡、手动切换等）。

---

> [!TIP]
> 如果你在使用中发现分流异常，请优先检查产生的配置文件中 `rule-providers` 或 `geodata-mode` 的路径配置是否正确。