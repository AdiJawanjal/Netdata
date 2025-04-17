# 🖥️ Monitor System Resources Using Netdata

This task is part of my DevOps internship and focuses on real-time monitoring of system and container-level metrics using **Netdata**.

---

## 🔧 Objective

Install and run **Netdata** using Docker to visualize performance metrics such as:

- CPU usage
- Memory usage
- Disk activity
- Docker container stats
- Network activity

---

## 🚀 Tools Used

- 🐳 Docker
- 📊 Netdata (Open-source real-time monitoring tool)

---

## 📦 Setup Instructions

### ✅ Method 1: Basic Monitoring (Container-Only)

```bash
docker run -d \
  --name=netdata \
  -p 19999:19999 \
  netdata/netdata
```

### ✅ Method 2: Full System Monitoring (Recommended)

```bash
docker run -d \
  --name=netdata \
  -p 19999:19999 \
  --cap-add SYS_PTRACE \
  --security-opt apparmor=unconfined \
  -v /etc/passwd:/host/etc/passwd:ro \
  -v /proc:/host/proc:ro \
  -v /sys:/host/sys:ro \
  -v /etc/os-release:/host/etc/os-release:ro \
  netdata/netdata
```

