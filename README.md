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
