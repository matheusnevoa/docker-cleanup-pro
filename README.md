# 🧹 Docker Cleanup Pro

**Versão:** 1.0  
**Autor:** [Matheus Névoa](https://www.linkedin.com/in/matheusnevoa)  
**Site:** [nevoaia.com](https://nevoaia.com)

Script interativo e profissional para limpeza e otimização do Docker.  
Ideal para desenvolvedores e administradores que utilizam Docker ou Portainer e desejam liberar espaço, remover recursos órfãos e manter o ambiente limpo e performático.

---

## 📦 O que esse script faz?

Este script permite executar **3 tipos de limpeza**:

1. **🧽 Limpeza Básica**
   - Remove containers parados
   - Remove redes não utilizadas
   - Remove imagens dangling

2. **🧼 Limpeza Avançada**
   - Tudo da limpeza básica +
   - Remove volumes órfãos
   - Remove imagens não utilizadas
   - Limpa cache de build

3. **🔥 Limpeza Total**
   - Remove todos os recursos não utilizados
   - Containers, imagens, volumes e redes

---

## 🚀 Como usar

### 1. Clone o repositório

```bash
git clone https://github.com/matheusnevoa/docker-cleanup-pro.git
cd docker-cleanup-pro

### Instalação do script

Você pode instalar o Docker Cleanup Pro de forma rápida e fácil usando um dos métodos abaixo. O script será baixado e instalado em `~/.local/bin`, tornando-o disponível globalmente no seu usuário.

#### Instalação automática (recomendado)

**Usando curl:**
```bash
curl -sSL https://raw.githubusercontent.com/matheusnevoa/docker-cleanup-pro/refs/heads/main/install.sh | bash
```

**Usando wget:**

```bash
wget -qO- https://raw.githubusercontent.com/matheusnevoa/docker-cleanup-pro/refs/heads/main/install.sh | bash
```

Após a instalação, certifique-se de que o diretório `~/.local/bin` está no seu PATH. O script de instalação já faz isso automaticamente, mas se necessário, adicione a linha abaixo ao seu `~/.bashrc`, `~/.zshrc` ou arquivo de configuração do shell:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

#### Instalação manual

Se preferir, você pode baixar o script manualmente:

```bash
mkdir -p "$HOME/.local/bin"
curl -sSL https://raw.githubusercontent.com/matheusnevoa/docker-cleanup-pro/refs/heads/main/docker-cleanup-pro.sh -o "$HOME/.local/bin/docker-cleanup-pro"
chmod +x "$HOME/.local/bin/docker-cleanup-pro"
```

Pronto! Agora você pode executar o comando `docker-cleanup-pro` diretamente no seu terminal.
