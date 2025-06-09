# 📊 Projeto de Monitoramento com Prometheus, Grafana e Windows Exporter

Este projeto implementa um ambiente completo de **monitoramento de máquinas Windows e Linux** utilizando:

- [Prometheus](https://prometheus.io/)
- [Grafana](https://grafana.com/)
- [Windows Exporter](https://github.com/prometheus-community/windows_exporter)
- [Node Exporter](https://github.com/prometheus/node_exporter)
- Ambiente dockerizado + automação com Ansible

---

## 🖼️ Visão Geral

| Painel Grafana | Consultas Prometheus |
|----------------|----------------------|
| ![Grafana](docs/screens/grafana-dashboard.png) | ![Prometheus](docs/screens/prometheus-query.png) |

---

## 🧱 Estrutura do Projeto

```
projeto-monitoramento/
├── ansible/
│   └── playbook.yml                 # Script Ansible (para automação futura)
├── grafana/
│   └── provisioning/
│       ├── dashboards.yml          # Provisionamento automático de dashboards
│       └── datasources.yml         # Provisionamento automático de fontes de dados
├── my-app/                         # (excluído do Git - submódulo ou projeto externo)
├── prometheus/
│   └── prometheus.yml              # Configurações do Prometheus
├── docker-compose.yml              # Sobe Prometheus, Grafana e Node Exporter
├── install.sh                      # Script opcional para setup automatizado
├── windows_exporter.exe            # Exporter para coletar métricas do Windows
```

---

## 🚀 Como executar localmente

> **Pré-requisitos**: [Docker Desktop](https://www.docker.com/products/docker-desktop)

```bash
# Clone o repositório
git clone https://github.com/WallanDavid/projeto-monitoramento.git
cd projeto-monitoramento

# Inicie os containers
docker compose up -d
```

- Acesse Prometheus: [http://localhost:9090](http://localhost:9090)
- Acesse Grafana: [http://localhost:3333](http://localhost:3333)
- Login padrão: **admin / admin**

---

## 🪟 Como instalar o Windows Exporter

1. Rode o executável `windows_exporter-0.30.7-amd64.exe`
2. Acesse [http://localhost:9182/metrics](http://localhost:9182/metrics) para verificar se está funcionando

---

## 📈 Dashboards e Métricas úteis

### Exemplos de métricas no Prometheus (PromQL):

```promql
# Tempo de CPU por modo
windows_cpu_time_total

# Uso de disco por unidade
windows_logical_disk_free_bytes

# Versão do sistema
windows_os_info
```

### Importar dashboards no Grafana:

- Dashboard ID para Windows Exporter: **14690**
- Vá para: `Dashboards > Import > ID 14690 > Load`

---

## 🔄 Automatização com Ansible

O diretório `ansible/` já contém um `playbook.yml` básico para setup com:

```bash
ansible-playbook ansible/playbook.yml
```

---

## 🐳 Serviços no Docker

| Serviço         | Porta | Descrição                  |
|------------------|-------|------------------------------|
| Prometheus       | 9090  | Coleta de métricas         |
| Grafana          | 3333  | Visualização de dashboards |
| Node Exporter    | 9100  | Métricas do host Linux     |

---

## ✅ Status

- ✅ Prometheus rodando com `prometheus.yml` configurado  
- ✅ Grafana provisionado com datasources  
- ✅ Exporter do Windows funcionando  
- ✅ Dashboards no Grafana  
- ✅ Docker Compose funcional  

---

## 📜 Licença

MIT © [WallanDavid](https://github.com/WallanDavid)

---

## 🤝 Contribuições

Contribuições são bem-vindas!  
Abra uma *issue* ou envie um *pull request*.
