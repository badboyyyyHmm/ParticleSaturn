# 粒子土星

基于手势控制的交互式3D粒子土星。通过摄像头识别手掌动作，实时操控80万粒子的运动。

## 主要改进

* **本地化关键库文件**：原作依赖的海外CDN源在国内访问困难或极慢，已将部分核心文件放入本地`libs`文件夹，确保加载流畅稳定。
* **增加Y轴旋转控制**：补充了原作缺失的左右旋转维度，现在可以通过手势全方位操控土星。
* **手部关键点可视化**：新增实时小窗，直观显示手部识别状态，方便调试和理解。
* **渲染性能优化**：减少了不必要的重绘，提升运行流畅度。

## 快速开始

### 环境要求

* 支持WebGL的现代浏览器（Chrome/Edge推荐）
* 摄像头权限
* 本地服务器环境（无法直接打开HTML文件）

### 启动步骤

1. 下载项目文件
2. 双击运行 `deploy.bat`（Windows，需Node.js 5.2.0+ 或 Python 3.x）或在终端执行（需Node.js 5.2.0+）：
```
npx serve -p 3000
```
3. 系统会自动在浏览器中打开应用
4. 允许摄像头访问权限
5. 将手置于摄像头前开始交互

### 交互说明

* **缩放**：拇指与食指间距离控制土星大小
* **俯仰**：手部上下移动改变观察视角
* **旋转**：手部左右移动控制土星自转
* **注意**：系统追踪手掌平面移动，手腕转动无效

## 性能调整

如果你的设备运行起来比较卡顿，别担心，可以尝试减少粒子数量。打开 `particleSaturn.html` 文件，找到第666行左右的代码：

```javascript
const particleCount = 800000; // 粒子总数
```

将 `800000` 改为更小的数值，如 `400000` 或 `200000`，可以显著提高性能，但也会降低视觉效果的细腻程度。
反之，性能足够时将其改为更高的数值，如 `1200000`，可获得更细腻的视觉效果。

## 项目结构

```
粒子土星/
├── particleSaturn.html    # 主页面（包含所有代码）
├── libs/                  # 本地化的第三方库文件
│   └─ ···
├── deploy.bat            # Windows部署脚本
└── README.md             # 说明文档
```

> **提示**：必须通过本地服务器访问（如 `http://localhost:3000/`），直接打开HTML文件会因浏览器安全策略无法加载libs中的文件。

## 已知限制

1. **浏览器兼容性**：需支持WebGL 2.0
2. **光线要求**：良好光照条件下手势识别更准确
3. **性能考量**：80万粒子对GPU有一定要求，集成显卡可能卡顿
4. **交互范围**：手部需保持在摄像头视野内，实测距离 50cm 左右效果最佳，请以实际为准

## 致谢

本项目基于 **Mr.lun** 的作品进行改进：
* **原始实现**：Mr.lun（[原始帖子](https://www.yjln.com/643.html)）
* **优化改进**：[@badboyyyyHmm](https://github.com/badboyyyyHmm)

正如原作者将作品分享出来一样，这个项目存在的目的，就是让更多人感受技术与艺术结合的魅力。

当然 AI 写的代码能好到哪里去🤷

如果你实在闲得慌想为这个项目做贡献，非常欢迎。

---

*最后更新：2025年12月*  
*modified with ❤️ and　<img src="https://unpkg.com/@lobehub/icons-static-svg@1.77.0/icons/trae-color.svg" alt="icon" style="height: 1.3em; vertical-align: baseline; transform: translateY(0.6em);" />  <img src="https://lf-cdn.trae.com.cn/obj/trae-com-cn/trae_website_prod_cn/static/image/footer.807f4742.png" alt="icon" style="height: 1em; vertical-align: baseline; transform: translateY(0.4em);" />*
